import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/utils/utils.dart';

class MenuBar extends StatelessWidget {
  final ItemScrollController itemScrollController;

  MenuBar({
    Key? key,
    required this.itemScrollController,
  }) : super(key: key);

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
                padding: const EdgeInsets.fromLTRB(15, 5, 16, 5),
                child: Image.asset("assets/images/soludev_logo_text.png",
                    height: 60, fit: BoxFit.contain),
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
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 0,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
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
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 2,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
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
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 3,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
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
              onTap: () => openUrl(
                  'https://www.youtube.com/channel/UCeldMeYBi5ebvTmB7t_3XLA'),
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
                onPressed: () {
                  itemScrollController.scrollTo(
                      index: 4,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
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
                      return const BorderSide(width: 0, color: Colors.white);
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
    videoController = VideoPlayerController.asset(
        "assets/videos/Video_Santiago_Cocina_web.mp4");
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
        VideoPlayerController.asset("assets/videos/Video_Digital_Menu_web.mp4");
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

class ContactSoludev extends StatelessWidget {
  const ContactSoludev({Key? key}) : super(key: key);

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
                child: Text("Contactanos.", style: headlineTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text("Para consultas e información sobre proyectos.",
                    style: bodyTextStyle.copyWith(fontSize: 24)),
              ),
              ContactForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  ContactForm({
    key,
  }) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  //Controladores
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  //dropdown tipo de proyecto
  String? _chosenValue;
  final _telefonoController = TextEditingController();
  final _descripcionController = TextEditingController();

  //Focus
  late FocusNode focusNombre,
      focusEmail,
      focusTelefono,
      focusDescripcion,
      focusTipo;

  @override
  void initState() {
    focusNombre = FocusNode();
    focusEmail = FocusNode();
    focusTelefono = FocusNode();
    focusDescripcion = FocusNode();
    focusTipo = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    //Limpiando controladores
    _nombreController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _descripcionController.dispose();
    //Limpiando focos
    focusNombre.dispose();
    focusEmail.dispose();
    focusTelefono.dispose();
    focusDescripcion.dispose();
    focusTipo.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: 20.0 * 2.5,
        runSpacing: 20.0 * 1.5,
        children: [
          TextFormField(
            controller: _nombreController,
            focusNode: focusNombre,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(focusEmail);
            },
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Nombre",
              hintText: "Ingrese su nombre",
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            controller: _emailController,
            focusNode: focusEmail,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(focusTipo);
            },
            onChanged: (value) {},
            validator: (value) {
              return value != null && !EmailValidator.validate(value)
                  ? 'Enter a valid email'
                  : null;
            },
            decoration: InputDecoration(
              labelText: "Correo electrónico",
              hintText: "Ingrese su dirección de correoelectrónico",
              border: OutlineInputBorder(),
            ),
          ),
          ResponsiveRowColumn(
            layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            //rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                columnOrder: 1,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 1, bottom: 1, right: 12, left: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 117, 117, 117),
                      width: 0.7,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String>(
                    onTap: () {
                      FocusScope.of(context).requestFocus(focusTelefono);
                    },
                    focusNode: focusTipo,
                    underline: Container(
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide.none))),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward_rounded,
                        color: Colors.grey[600]),
                    borderRadius: BorderRadius.circular(5),
                    value: _chosenValue,
                    items: <String>[
                      "Android",
                      "IOS",
                      "Web",
                      "Desktop",
                      "Varias"
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      );
                    }).toList(),
                    hint: Container(
                      //padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Tipo de proyecto",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Muli"),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                ),
              ),
              //ver mejorar
              ResponsiveRowColumnItem(
                  //rowFlex: 2,
                  columnOrder: 2,
                  child: SizedBox(height: 30, width: 5)),
              ResponsiveRowColumnItem(
                rowFlex: 3,
                columnOrder: 3,
                child: TextFormField(
                  controller: _telefonoController,
                  focusNode: focusTelefono,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focusDescripcion);
                  },
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: "Teléfono",
                    hintText: "ingrese su teléfono",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 5,
            controller: _descripcionController,
            focusNode: focusDescripcion,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Descripción",
              alignLabelWithHint: true,
              hintText: "Ingrese su consulta",
              border: OutlineInputBorder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Center(
              child: TextButton(
                onPressed: () {
                  sendEmail(
                      name: _nombreController.text.trim(),
                      email: _emailController.text.trim(),
                      subject: "Consulta sobre: desarrollo $_chosenValue.",
                      message: "      Email: ${_emailController.text.trim()}."
                          "     Teléfono: ${_telefonoController.text.trim()}."
                          "     Mensaje: ${_descripcionController.text.trim()}.");
                },
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
                  "Enviar consulta",
                  style: buttonTextStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    final serviceId = 'service_dvkuq1m';
    final templateId = 'template_0f6hyjb';
    final userId = 'urhOJhqRSNLtJx_L1';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }),
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
              child: Image.asset("assets/images/soludev_logo_mono.png",
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
                                "SoluDev - Santiago del Estero, Argentina - soludevarg@gmail.com - © Copyright SoluDev. Todos los derechos reservados.",
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
