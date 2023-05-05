import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:payaki/utilities/color_utility.dart';


class NetworkImageWidget extends StatelessWidget {
  final String? url;
  final Widget? placeholder;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Widget? error;
  final Widget? alternate; // if url is empty

  const NetworkImageWidget({Key? key,
    required this.url,
    this.placeholder,
    this.fit,
    this.width,
    this.height,
    this.error,
    this.alternate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
          imageUrl: url!,
          placeholder: (context, url) {
            return placeholder ?? const Center(
                child: CircularProgressIndicator()
            );
          },
          fit: fit ?? BoxFit.cover,
          width: width,
          height: height,
          //  errorWidget:
          errorWidget: (context, url, value) {
            if (
            error != null) {
              return error!;
            } else {
              return Container(
                color: ColorUtility.colorAEB1B9,
                child: const Center(
                  child: Icon(
                    //  Icons.image_not_supported_rounded,
                    Icons.image_not_supported_rounded,
                    color: ColorUtility.color43576F,
                    size: 10,
                  ),
                ),
              );
            }
          }
        // : null,
      );
    }
    return alternate ?? const SizedBox();
  }
}

