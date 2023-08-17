import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/addEvent/model/ticket_model.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/response/post/add_post_response.dart';
import 'package:payaki/network/repository/post_repository.dart';

class AddEventTicketScreenVm extends ChangeNotifier {
  final PostRepository postRepository = PostRepository();

  List<Tickets> ticketList = [];
 // TicketModel? ticketModel = TicketModel();


  addTicket(Tickets tickets) {
    ticketList.add(tickets);


    // ticketModel?.tickets = [
    //   Tickets(
    //       ticketTitle: "titleController.text",
    //       ticketQuantity: "2",
    //       ticketPrice: "1",
    //       sellingMode: "offline")
    // ];
    //
    // logD("list length is ${ticketModel?.tickets?.length}");
    notifyListeners();
  }

  removeTicket(int index) {
    ticketList.removeAt(index);
    notifyListeners();
  }

  addPostApi(
      {ValueChanged<AddPostResponse>? onSuccess,
      ValueChanged<String>? onFailure,
      required XFile images,
      required XFile video,
      required String productName,
      required String description,
      required int categoryId,
      required int subCategoryId}) async {
    MultipartFile imageFile = await MultipartFile.fromFile(
      images.path,
      filename: images.name,
    );

    MultipartFile videoFile = await MultipartFile.fromFile(
      video.path,
      filename: video.name,
    );

    FormData formData = FormData.fromMap({
      'name': Endpoints.post.addPost,
      'user_id': Preference().getUserId(),
      'product_name': productName,
      'description': description,
      'category': categoryId,
      'sub_category': subCategoryId,
      'product_images[]': imageFile,
      'promo_video': videoFile,
     // 'max_size': "500", ...?ticketModel?.toJson()
     // "events":ticketModel?.toJson()
    });





    postRepository.addPost(formData).then((value) {
      notifyListeners();

      if (value.code == 200) {
        onSuccess?.call(value);
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();

      onFailure?.call("Server Error");
    });
  }
}
