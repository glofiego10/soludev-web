// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:flutter_website/ui/block_wrapper.dart';
import 'package:flutter_website/ui/carousel/carousel.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
    final ItemScrollController itemScrollController = ItemScrollController();
    final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

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
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size(double.infinity, 66),
                  child: Material(
                      elevation: 4,
                      child: MenuBar(
                        itemScrollController: itemScrollController,
                      ))),
              body: ScrollablePositionedList.builder(
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  itemCount: blocks.length,
                  itemBuilder: (context, index) {
                    return blocks[index];
                  }),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

List<Widget> blocks = [
  const BlockWrapper(Features()),
  ResponsiveWrapper(
      maxWidth: 1200,
      minWidth: 1200,
      defaultScale: true,
      mediaQueryData: const MediaQueryData(size: Size(1200, 640)),
      child: RepaintBoundary(child: Carousel())),
  const BlockWrapper(SantiagoCocina()),
  const BlockWrapper(DigitalMenu()),
  const BlockWrapper(SobreNosotros()),
  const BlockWrapper(ContactSoludev()),
  const Footer(),
];
