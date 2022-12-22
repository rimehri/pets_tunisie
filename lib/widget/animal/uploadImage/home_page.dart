// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pfe/widget/animal/uploadImage/source_page.dart';

import 'media_source.dart';







class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File ? fileMedia;
  late MediaSource source;

  @override
  Widget build(BuildContext context) => Scaffold(

        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: fileMedia == null
                      ? Icon(Icons.photo, size: 120)

                          :Image.file(fileMedia!),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {  capture(MediaSource.image);},
                  child: Text('Capture Image'),

                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  child: Text('Capture Video'),

                  onPressed: () => capture(MediaSource.image),

                ),
              ],
            ),
          ),
        ),
      );

  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia =null ;
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(
          arguments: source,
        ),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }
}
