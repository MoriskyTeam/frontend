import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/widgets/local_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Optional photo: camera or gallery on mobile, a file picker on the web.
class PhotoField extends StatelessWidget {
  const PhotoField({
    required this.photoPath,
    required this.onChanged,
    super.key,
  });

  final String? photoPath;
  final ValueChanged<String?> onChanged;

  Future<void> _pick(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final source = kIsWeb
        ? ImageSource.gallery
        : await showModalBottomSheet<ImageSource>(
            context: context,
            builder: (context) => SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_camera_outlined),
                    title: Text(l10n.reportPhotoCamera),
                    onTap: () => Navigator.pop(context, ImageSource.camera),
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library_outlined),
                    title: Text(l10n.reportPhotoGallery),
                    onTap: () => Navigator.pop(context, ImageSource.gallery),
                  ),
                  const SizedBox(height: RcbSpacing.sm),
                ],
              ),
            ),
          );
    if (source == null) return;
    final file = await ImagePicker().pickImage(
      source: source,
      maxWidth: 1600,
      imageQuality: 82,
    );
    if (file != null) onChanged(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final path = photoPath;

    if (path != null) {
      return ClipRRect(
        borderRadius: RcbRadii.cardBorder,
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Stack(
            fit: StackFit.expand,
            children: [
              LocalImage(path: path),
              Positioned(
                top: RcbSpacing.sm,
                right: RcbSpacing.sm,
                child: IconButton.filled(
                  tooltip: l10n.reportPhotoRemove,
                  style: IconButton.styleFrom(
                    backgroundColor: scheme.inverseSurface,
                    foregroundColor: scheme.onInverseSurface,
                  ),
                  onPressed: () => onChanged(null),
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Material(
      color: scheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(
        borderRadius: RcbRadii.cardBorder,
        side: BorderSide(color: scheme.outlineVariant),
      ),
      child: InkWell(
        onTap: () => _pick(context),
        borderRadius: RcbRadii.cardBorder,
        child: Padding(
          padding: const EdgeInsets.all(RcbSpacing.lg),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerHigh,
                  borderRadius: RcbRadii.buttonBorder,
                ),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: scheme.onSurface,
                ),
              ),
              const SizedBox(width: RcbSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.reportPhotoAdd,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: RcbSpacing.xxs),
                    Text(
                      l10n.reportPhotoHint,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
