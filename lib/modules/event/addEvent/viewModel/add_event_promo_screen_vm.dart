import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AddEventPromoScreenVm extends ChangeNotifier {
  XFile? selectedImages;
  XFile? selectedVideo;
  final picker = ImagePicker();
  String thumbnailPath = '';

  Future getImages() async {
    selectedImages = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future getVideo() async {
    selectedVideo = await picker.pickVideo(source: ImageSource.gallery);
    notifyListeners();

    if (selectedVideo != null) {
      String? thumbnail = await VideoThumbnail.thumbnailFile(
        video: selectedVideo?.path ?? "",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
      );
      thumbnailPath = thumbnail!;
      notifyListeners();
    }
  }

  removeImage() {
    selectedImages = null;
    notifyListeners();
  }

  removeVideo() {
    selectedVideo = null;
    thumbnailPath = '';
    notifyListeners();
  }
}
