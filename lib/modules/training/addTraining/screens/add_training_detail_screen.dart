import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/inputFormatter/decimal_input_formatter.dart';
import 'package:payaki/modules/training/addTraining/viewModel/add_training_detail_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/postAdd/model/days_model.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:provider/provider.dart';
import 'package:payaki/network/model/response/location/city_list_response.dart';

import '../../../../generated/l10n.dart';

class AddTrainingDetailScreen extends StatefulWidget {
  final int catId;
  final int subCatId;

  const AddTrainingDetailScreen(
      {super.key, required this.catId, required this.subCatId});

  @override
  State<AddTrainingDetailScreen> createState() =>
      _AddTrainingDetailScreenState();
}

class _AddTrainingDetailScreenState extends State<AddTrainingDetailScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  AddTrainingDetailScreenVm addTrainingDetailScreenVm =
      AddTrainingDetailScreenVm();

  String? location;
  String? city;
  String? country;
  String? latlong;
  String? state;

  String? selectedLocation;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String? countryCode;

  Day? selectDayValue;

  @override
  void initState() {
    super.initState();
    addTrainingDetailScreenVm =
        Provider.of<AddTrainingDetailScreenVm>(context, listen: false);
    addTrainingDetailScreenVm.cityListApi(
        onSuccess: (value) {},
        onFailure: (String message) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: message);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: CustomAppBar(
        title: S.of(context).training,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Consumer<AddTrainingDetailScreenVm>(
              builder: (context, addTrainingDetailScreenVm, child) {
            return addTrainingDetailScreenVm.isLoading == true
                ? const CircularProgressWidget()
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 23.h),
                              Text(
                                S.of(context).details,
                                style: StyleUtility.headingTextStyle,
                              ),
                              SizedBox(height: 25.h),
                              SimpleTextField(
                                controller: titleController,
                                hintText: S.of(context).titleForYourTraining,
                                titleText: S.of(context).title,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SimpleTextField(
                                controller: descriptionController,
                                hintText: S
                                    .of(context)
                                    .tellUsMoreAboutYourDescription,
                                titleText: S.of(context).description,
                                maxLine: 5,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              selectedLocation != null
                                  ? Text(
                                      selectedLocation ?? "",
                                      style: StyleUtility.headingTextStyle,
                                    )
                                  : const SizedBox(),
                              Text(
                                S.of(context).addLocation,
                                style: StyleUtility.inputTextStyle,
                              ),
                              TypeAheadField<Data>(
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: locationController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 12.sp,
                                        bottom: 12.sp,
                                        left: 20.w,
                                        right: 5.w),
                                    filled: true,
                                    hintText: S.of(context).enterLocation,
                                    fillColor: ColorUtility.colorF8FAFB,
                                    hintStyle: StyleUtility.hintTextStyle,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    prefixIcon: SizedBox(
                                      height: 55.sp,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.sp),
                                        child: Image.asset(
                                            ImageUtility.locationSelectIcon),
                                      ),
                                    ),
                                    focusColor: Colors.white,
                                  ),
                                ),
                                suggestionsCallback: (query) {
                                  if (locationController.text.isNotEmpty) {
                                    return addTrainingDetailScreenVm.cityList!
                                        .where((obj) => obj.name!
                                            .toLowerCase()
                                            .contains(query.toLowerCase()));
                                  }

                                  return [];
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.name!),
                                    subtitle: Text(suggestion.stateName!),
                                  );
                                },
                                onSuggestionSelected: (suggestion) {
                                  // Do something with the selected suggestion

                                  location = suggestion.name;
                                  city = suggestion.id;
                                  country = suggestion.countryCode;
                                  latlong =
                                      "${suggestion.latitude},${suggestion.longitude}";
                                  state = suggestion.subadmin1Code;

                                  locationController.text =
                                      "${suggestion.name!},${suggestion.stateName!}";
                                  selectedLocation =
                                      "${suggestion.name!},${suggestion.stateName!}";

                                  addTrainingDetailScreenVm.notifyListeners();
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                S.of(context).expireAd,
                                style: StyleUtility.inputTextStyle,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<Day>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 15.sp,
                                        bottom: 15.sp,
                                        left: 20.w,
                                        right: 5.w),
                                    filled: true,
                                    fillColor: ColorUtility.colorF8FAFB,
                                    hintStyle: StyleUtility.hintTextStyle,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: ColorUtility.colorE2E5EF,
                                      ),
                                    ),
                                    focusColor: ColorUtility.whiteColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                  hint: Text(
                                    S.of(context).selectYOurCountry,
                                    style: StyleUtility.hintTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  items: daysList
                                      .map((e) => DropdownMenuItem<Day>(
                                          value: e,
                                          child: Text(e.name,
                                              style:
                                                  StyleUtility.inputTextStyle)))
                                      .toList(),
                                  value: selectDayValue,
                                  onChanged: (Day? value) {
                                    selectDayValue = value!;
                                    logD(selectDayValue!.value);
                                  },
                                  icon: Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Image.asset(
                                      ImageUtility.dropDownIcon,
                                      width: 14.w,
                                    ),
                                  ),
                                  iconSize: 20.sp,
                                  iconEnabledColor: Colors.black,
                                  iconDisabledColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              MobileNumberTextField(
                                  controller: phoneNumberController,
                                  onChanged: (phone) {
                                    countryCode = phone.countryCode;
                                  }),
                              SizedBox(
                                height: 15.h,
                              ),
                              SimpleTextField(
                                controller: priceController,
                                hintText: S.of(context).enterPrice,
                                titleText: S.of(context).price,
                                textInputType: TextInputType.number,
                                inputFormatter: [
                                  DecimalInputFormatter(),
                                ],
                                onTapOutside: (String value) {
                                  CommonMethod.numberFormatForTextEditing(
                                      priceController);
                                },
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                          buttonText: S.of(context).next,
                          onTab: () {
                            FocusScope.of(context).unfocus();
                            logD("Selected location $location");
                            if (titleController.text.isEmpty) {
                              context.flushBarTopErrorMessage(
                                  message: S.of(context).pleaseEnterTitle);
                            } else if (descriptionController.text.isEmpty) {
                              context.flushBarTopErrorMessage(
                                  message:
                                      S.of(context).pleaseEnterDescription);
                            } else if (location == null) {
                              context.flushBarTopErrorMessage(
                                  message: S.of(context).pleaseSelectLocation);
                            } else if (selectDayValue?.value == null) {
                              context.flushBarTopErrorMessage(
                                  message:
                                      S.of(context).pleaseSelectExpireDays);
                            } else if (phoneNumberController.text.isEmpty) {
                              context.flushBarTopErrorMessage(
                                  message:
                                      S.of(context).pleaseEnterMobileNumber);
                            } else if (priceController.text.isEmpty) {
                              context.flushBarTopErrorMessage(
                                  message: S.of(context).pleaseEnterPrice);
                            } else {
                              Navigator.pushNamed(
                                context,
                                RouteName.trainingPromoScreen,
                                arguments: {
                                  "catId": widget.catId,
                                  "subCatId": widget.subCatId,
                                  "title": titleController.text,
                                  //  "price": priceController.text,
                                  "price":
                                      priceController.text.replaceAll(',', ''),
                                  "description": descriptionController.text,
                                  "location": location,
                                  "city": city,
                                  "country": country,
                                  "latlong": latlong,
                                  "state": state,
                                  "phone": phoneNumberController.text,
                                  "availableDays": selectDayValue?.value,
                                },
                              );
                            }
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
