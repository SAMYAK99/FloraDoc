import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  final File image;

  const ImageViewPage(this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).accentColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Center(
          child: InteractiveViewer(
            constrained: false,
            child: Image.file(image),
          ),
        ),
      ),
    );
  }
}
