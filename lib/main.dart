import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe/data/db_helper.dart';
import 'package:pfe/widget/splash_screen.dart';

Future <void> main() async {
    await DbHelper.initdb();

    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return const GetMaterialApp (
            debugShowCheckedModeBanner: false,
            title: 'Tunisie Pets',

            home:SplashScreen(),
        );
    }
}