import 'package:flutter/widgets.dart';

Widget buildLocalImage(String path, BoxFit fit) =>
    Image.network(path, fit: fit);
