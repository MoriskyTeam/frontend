import 'dart:io';

import 'package:flutter/widgets.dart';

Widget buildLocalImage(String path, BoxFit fit) =>
    Image.file(File(path), fit: fit);
