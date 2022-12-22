
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'list_tile_widget.dart';
import 'media_source.dart';


class GalleryButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTileWidget(
        text: "Galerie",
        icon: Icons.photo,
        onClicked: () => pickGalleryMedia(context),
      );

  Future pickGalleryMedia(BuildContext context) async {
    final Object? source = ModalRoute.of(context)!.settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getImage;

    final media = await getMedia(source: ImageSource.gallery);
    final file = File(media!.path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var storedLanguage = prefs.setString('path',media.path);


    Navigator.of(context).pop(file);
  }
}
