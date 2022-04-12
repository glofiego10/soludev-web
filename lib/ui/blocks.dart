import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:video_player/video_player.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color navLinkColor = Color(0xFF6E7274);
    return Container(
      height: 66,
      decoration: const BoxDecoration(color: background),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
                child: Image.asset("assets/images/flutter_logo_text.png",
                    height: 37, fit: BoxFit.contain),
              ),
            ),
          ),
          const Spacer(),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => openUrl("https://flutter.dev/docs"),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Inicio",
                      style: TextStyle(
                          fontSize: 16,
                          color: navLinkColor,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => openUrl("https://flutter.dev/showcase"),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Santiago Cocina",
                      style: TextStyle(
                          fontSize: 16,
                          color: navLinkColor,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => openUrl("https://flutter.dev/community"),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Digital Menu",
                        style: TextStyle(
                            fontSize: 16,
                            color: navLinkColor,
                            fontFamily: fontFamily))),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => openUrl("https://flutter.dev/community"),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Sobre Nosotros",
                        style: TextStyle(
                            fontSize: 16,
                            color: navLinkColor,
                            fontFamily: fontFamily))),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl('https://www.youtube.com/flutterdev'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(
                    AssetImage("assets/images/icon_youtube_64x.png"),
                    color: navLinkColor,
                    size: 24),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: true,
            //visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: TextButton(
                onPressed: () =>
                    openUrl("https://flutter.dev/docs/get-started/install"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(primary),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return buttonPrimaryDark;
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return buttonPrimaryDarkPressed;
                        }
                        return primary;
                      },
                    ),
                    // Shape sets the border radius from default 3 to 0.
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)));
                        }
                        return const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)));
                      },
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 28)),
                    // Side adds pressed highlight outline.
                    side: MaterialStateProperty.resolveWith<BorderSide>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return const BorderSide(
                            width: 3, color: buttonPrimaryPressedOutline);
                      }
                      // Transparent border placeholder as Flutter does not allow
                      // negative margins.
                      return const BorderSide(width: 3, color: Colors.white);
                    })),
                child: Text(
                  "Contactanos",
                  style: buttonTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisSize: MainAxisSize.min,
        rowPadding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
        columnPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        columnSpacing: 50,
        rowSpacing: 50,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: buildMaterialIconCircle(
                      "assets/images/icon_development.png", 68),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Fast Development",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                const Text(
                    "Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of fully-customizable widgets to build native interfaces in minutes.",
                    style: bodyTextStyle,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child:
                      buildMaterialIconCircle("assets/images/icon_ui.png", 68),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Expressive and Flexible UI",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                const Text(
                    "Quickly ship features with a focus on native end-user experiences. Layered architecture allows for full customization, which results in incredibly fast rendering and expressive and flexible designs.",
                    style: bodyTextStyle,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: buildMaterialIconCircle(
                      "assets/images/icon_performance.png", 68),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Native Performance",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                RichText(
                  text: TextSpan(
                    style: bodyTextStyle,
                    children: [
                      const TextSpan(
                          text:
                              "Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts, and your Flutter code is compiled to native ARM machine code using "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://dart.dev/platforms");
                            },
                          text: "Dart's native compilers",
                          style: bodyLinkTextStyle),
                      const TextSpan(text: "."),
                    ],
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FastDevelopment extends StatefulWidget {
  const FastDevelopment({Key? key}) : super(key: key);

  @override
  _FastDevelopmentState createState() => _FastDevelopmentState();
}

class _FastDevelopmentState extends State<FastDevelopment> {
  late VideoPlayerController videoController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset("assets/videos/FastDev.mp4");
    videoController.setVolume(0);
    videoController.setLooping(true);
    initializeVideoPlayerFuture = videoController.initialize().then((_) {
      if (mounted) {
        // Display the first frame of the video before playback.
        setState(() {});
        videoPlay();
      }
    });
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void videoPlay() {
    videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 2,
            child: FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the VideoPlayer.
                  return AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: RepaintBoundary(child: VideoPlayer(videoController)),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container();
                }
              },
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: buildMaterialIconCircle(
                        "assets/images/icon_development.png", 68),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text("Fast Development", style: headlineTextStyle),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyTextStyle,
                      children: [
                        const TextSpan(text: "Flutter's "),
                        TextSpan(
                            text: "hot reload",
                            style: bodyTextStyle.copyWith(
                                fontStyle: FontStyle.italic)),
                        const TextSpan(
                            text:
                                " helps you quickly and easily experiment, build UIs, add features, and fix bugs faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
                        const TextSpan(text: "\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl(
                                    "https://flutter.dev/docs/development/tools/hot-reload");
                              },
                            text: "Learn more",
                            style: bodyLinkTextStyle)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BeautifulUI extends StatefulWidget {
  const BeautifulUI({Key? key}) : super(key: key);

  @override
  _BeautifulUIState createState() => _BeautifulUIState();
}

class _BeautifulUIState extends State<BeautifulUI> {
  late VideoPlayerController videoController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoController =
        VideoPlayerController.asset("assets/videos/BeautifulUI.mp4");
    videoController.setVolume(0);
    videoController.setLooping(true);
    initializeVideoPlayerFuture = videoController.initialize().then((_) {
      if (mounted) {
        // Display the first frame of the video before playback.
        setState(() {});
        videoPlay();
      }
    });
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void videoPlay() {
    videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnOrder: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: buildMaterialIconCircle(
                        "assets/images/icon_ui.png", 68),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text("Expressive, beautiful UIs",
                        style: headlineTextStyle),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyTextStyle,
                      children: [
                        const TextSpan(
                            text:
                                "Delight your users with Flutter's built-in beautiful Material Design and Cupertino (iOS-flavor) widgets, rich motion APIs, smooth natural scrolling, and platform awareness."),
                        const TextSpan(text: "\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl(
                                    "https://flutter.dev/docs/development/ui/widgets/catalog");
                              },
                            text: "Browse the widget catalog",
                            style: bodyLinkTextStyle),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 2,
            columnOrder: 1,
            child: FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the VideoPlayer.
                  return AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: RepaintBoundary(child: VideoPlayer(videoController)),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class InstallFlutter extends StatelessWidget {
  const InstallFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text("Install Flutter today.", style: headlineTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text("It’s free and open source.",
                    style: bodyTextStyle.copyWith(fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextButton(
                  onPressed: () =>
                      openUrl("https://flutter.dev/docs/get-started/install"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primary),
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return buttonPrimaryDark;
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return buttonPrimaryDarkPressed;
                          }
                          return primary;
                        },
                      ),
                      // Shape sets the border radius from default 3 to 0.
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)));
                          }
                          return const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)));
                        },
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 32, horizontal: 90)),
                      // Side adds pressed highlight outline.
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return const BorderSide(
                              width: 3, color: buttonPrimaryPressedOutline);
                        }
                        // Transparent border placeholder as Flutter does not allow
                        // negative margins.
                        return const BorderSide(width: 3, color: Colors.white);
                      })),
                  child: Text(
                    "Get started",
                    style: buttonTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundDark,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isMobile
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        columnMainAxisSize: MainAxisSize.min,
        children: [
          ResponsiveRowColumnItem(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Image.asset("assets/images/flutter_logo_mono.png",
                  height: 100, fit: BoxFit.contain),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFit: FlexFit.loose,
            columnFit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: bodyTextStyle.copyWith(
                        fontSize: 14, color: Colors.white, height: 2),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl(
                                  "https://groups.google.com/forum/#!forum/flutter-dev");
                            },
                          text: "flutter-dev@"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://flutter.dev/tos");
                            },
                          text: "terms"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://flutter.dev/security");
                            },
                          text: "security"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl(
                                  "https://www.google.com/intl/en/policies/privacy");
                            },
                          text: "privacy"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://flutter-es.io/");
                            },
                          text: "español"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://flutter.cn/");
                            },
                          text: "社区中文资源"),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      style: bodyTextStyle.copyWith(
                          fontSize: 14, color: Colors.white, height: 1),
                      children: [
                        const TextSpan(text: '\n'),
                        TextSpan(
                            text:
                                "Except as otherwise noted, this work is licensed under a Creative Commons Attribution 4.0 International License, and code samples are licensed under the BSD License.",
                            style: bodyTextStyle.copyWith(
                                fontSize: 10, color: Colors.white)),
                        const TextSpan(text: '\n'),
                        const TextSpan(text: '\n'),
                        const TextSpan(text: '\n'),
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
