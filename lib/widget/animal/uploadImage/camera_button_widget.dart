
import 'dart:io';

import 'media_source.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'list_tile_widget.dart';

class CameraButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTileWidget(
        text: "Camera",
        icon: Icons.camera_alt,
        onClicked: () => pickCameraMedia(context),
      );

  Future pickCameraMedia(BuildContext context) async {
    final Object? source = ModalRoute.of(context)!.settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getImage;

    final media = await getMedia(source: ImageSource.camera);
    final file = File(media!.path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var storedLanguage = prefs.setString('path',media.path);

    Navigator.of(context).pop(file);
  }
}
