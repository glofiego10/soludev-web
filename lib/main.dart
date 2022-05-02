import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:flutter_website/ui/block_wrapper.dart';
import 'package:flutter_website/ui/carousel/carousel.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'components/components.dart';
import 'ui/blocks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();
    final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

    return MaterialApp(
        title: 'SoluDev',
        debugShowCheckedModeBanner: false,
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
        home: Scaffold(
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
        ));
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
  const BlockWrapper(Cosmere()),
  const BlockWrapper(SobreNosotros()),
  const BlockWrapper(ContactSoludev()),
  const Footer(),
];
