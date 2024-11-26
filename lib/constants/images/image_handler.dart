import 'image_extension.dart';
import 'image_roots.dart';

class ImageHandler{

  /// Get a specific image.
  static String getImagePath({
    required String imageRoot,
    required String image,
  }) =>   //images ------   inner dic -- image   ----------- extension
      '${ImageRoots.imageRoot}$imageRoot$image${ImageExtensions.pngExtension}';

}