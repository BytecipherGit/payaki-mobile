import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/event/eventList/viewModel/event_list_screen_vm.dart';
import 'package:payaki/modules/event/widgets/event_widget.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/no_data_widget.dart';
import 'package:provider/provider.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({Key? key}) : super(key: key);

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  EventListScreenVm eventListScreenVm = EventListScreenVm();

  @override
  void initState() {
    super.initState();
    eventListScreenVm = Provider.of(context, listen: false);
    eventListScreenVm.getEvent(
        onSuccess: (String value) {},
        onFailure: (value) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: value.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      appBar: const CustomAppBar(
        title: "My Event",
      ),
      body: Consumer<EventListScreenVm>(
          builder: (context, eventListScreenVm, child) {
        var eventList = eventListScreenVm.eventList?.data;
        return eventListScreenVm.eventListLoading == true
            ? const CircularProgressWidget()
            : Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: (eventList?.length ?? 0) > 0
                    ? GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.only(top: 20.h, bottom: 60.h),
                        itemCount: eventList?.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 15.w,
                          // childAspectRatio: 0.98
                        ),
                        itemBuilder: (context, index) {
                          String? image;
                          if ((eventList?[index].image?.length ?? 0) > 0) {
                            image = eventList?[index].image?[0];
                          }
                          return EventWidget(
                            title: eventList?[index].productName ?? "",
                            imageUrl: image ?? "",
                            expiredDate: eventList?[index].expiredDate,
                            isShowDeleteIcon: true,
                            onTap: () {},
                            onDeleteIconTap: () {},
                          );
                        },
                      )
                    : const NoDataWidget(
                        title: 'You haven’t listed anything yet.',
                      ),
              );
      }),
    );
  }
}
