import 'dart:io';

import 'package:flutter/widgets.dart';

/// Picked photos are local files; uploaded ones come back as Supabase
/// Storage URLs.
Widget buildLocalImage(String path, BoxFit fit) => path.startsWith('http')
    ? Image.network(path, fit: fit)
    : Image.file(File(path), fit: fit);
