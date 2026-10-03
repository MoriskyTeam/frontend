import 'package:dynamic_rcb_alerts/shared/widgets/local_image_io.dart'
    if (dart.library.js_interop) 'package:dynamic_rcb_alerts/shared/widgets/local_image_web.dart'
    as platform;
import 'package:flutter/widgets.dart';

/// Shows a photo picked on this device: a file path on mobile, a blob URL on
/// the web.
class LocalImage extends StatelessWidget {
  const LocalImage({
    required this.path,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String path;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) => platform.buildLocalImage(path, fit);
}
