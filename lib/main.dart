// ignore: import_of_legacy_library_into_null_safe
import 'package:appbar_elevation/appbar_elevation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:flutter_website/ui/block_wrapper.dart';
import 'package:flutter_website/ui/carousel/carousel.dart';

import 'components/components.dart';
import 'ui/blocks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBW7QsrfGVWJ_BTImiFkmmDMDJvfoHT0DQ",
          authDomain: "soludev-web.firebaseapp.com",
          projectId: "soludev-web",
          storageBucket: "soludev-web.appspot.com",
          messagingSenderId: "73781584016",
          appId: "1:73781584016:web:2fdc7e6b5c6390fd353815"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          defaultScale: true,
          minWidth: 480,
          defaultName: MOBILE,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            const ResponsiveBreakpoint.resize(600, name: MOBILE),
            const ResponsiveBreakpoint.resize(850, name: TABLET),
            const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
          ],
          background: Container(color: background)),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // ignore: avoid_print
            print("error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ScrollActivatedAppBarElevation(
                builder: (BuildContext context, double appBarElevation) {
              return Scaffold(
                appBar: PreferredSize(
                    preferredSize: const Size(double.infinity, 66),
                    child: Material(
                        elevation: appBarElevation, child: const MenuBar())),
                body: ListView.builder(
                    itemCount: blocks.length,
                    itemBuilder: (context, index) {
                      return blocks[index];
                    }),
              );
            });
          }
          return const CircularProgressIndicator();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

List<Widget> blocks = [
  ResponsiveWrapper(
      maxWidth: 1200,
      minWidth: 1200,
      defaultScale: true,
      mediaQueryData: const MediaQueryData(size: Size(1200, 640)),
      child: RepaintBoundary(child: Carousel())),
  const BlockWrapper(Features()),
  const BlockWrapper(FastDevelopment()),
  const BlockWrapper(BeautifulUI()),
  const BlockWrapper(InstallFlutter()),
  const Footer(),
];
