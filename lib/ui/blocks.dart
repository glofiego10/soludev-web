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
                      duration: const Duration(seconds: 2),
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
                      duration: const Duration(seconds: 2),
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
                      duration: const Duration(seconds: 2),
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
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 4,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
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
                  'https://play.google.com/store/apps/developer?id=SoluDev'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(
                    AssetImage("assets/images/google-play-gris.png"),
                    color: navLinkColor,
                    size: 24),
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
                      index: 5,
                      duration: const Duration(seconds: 2),
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
                  padding: const EdgeInsets.only(bottom: 15),
                  child: buildMaterialIconCircle(
                      "assets/images/icon_development.png", 250),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Desarrollo Ágil",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                const Text(
                    "Garantizamos calidad, eficiencia,  experiencia satisfactoria por parte del cliente,  entrega de productos y servicios en intervalos cortos de tiempo y con rápida respuesta a los cambios a través del desarrollo mediante metodologías agiles.",
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
                  padding: const EdgeInsets.only(bottom: 15),
                  child:
                      buildMaterialIconCircle("assets/images/icon_ui.png", 250),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Desarrollo Multiplataforma",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                const Text(
                    "Desarrollamos nuestras aplicaciones tanto de iOS como Android de forma nativa y como si fuera poco, agregamos  tanto aplicaciones de escritorio y desarrollo de sistemas Web , logrando de esta manera productos finales confiables y de alta performance en su funcionamiento.",
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
                  padding: const EdgeInsets.only(bottom: 15),
                  child: buildMaterialIconCircle(
                      "assets/images/icon_performance.png", 250),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Comunicación y Soporte",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                RichText(
                  text: const TextSpan(
                    style: bodyTextStyle,
                    children: [
                      TextSpan(
                          text:
                              "Mantenemos una relación cercana con nuestros clientes durante el proceso de desarrollo, que continúa posterior a la implementación de la solución. Estamos a disposición del cliente para resolver cualquier falla o situación que se presente de forma inmediata."),
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

class SantiagoCocina extends StatefulWidget {
  const SantiagoCocina({Key? key}) : super(key: key);

  @override
  _SantiagoCocinaState createState() => _SantiagoCocinaState();
}

class _SantiagoCocinaState extends State<SantiagoCocina> {
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
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: bodyTextStyle.copyWith(fontSize: 20),
                      children: const [
                        TextSpan(
                            text: "• Consultá las recetas dulces y saladas."),
                        TextSpan(text: "\n"),
                        TextSpan(
                            text:
                                "• Obtené instrucciones paso a paso sobre cómo cocinar cada receta."),
                        TextSpan(text: "\n"),
                        TextSpan(
                            text:
                                "• Utilizá la opción búsqueda para encontrar tu receta favorita."),
                        TextSpan(text: "\n"),
                        TextSpan(
                            text:
                                "• Compartí tus recetas favoritas por WhatsApp, Gmail, Facebook, Instagram, etc."),
                        TextSpan(text: "\n"),
                        TextSpan(
                            text:
                                "• App 100% gratis, descargala desde google play."),
                        TextSpan(text: "\n"),
                        TextSpan(text: "\n"),
                      ],
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        openUrl(
                            "https://play.google.com/store/apps/details?id=com.soludevarg.santiagococinaapp");
                      },
                      child: const Image(
                        image: const AssetImage(
                            'assets/images/disponible-google-play.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DigitalMenu extends StatefulWidget {
  const DigitalMenu({Key? key}) : super(key: key);

  @override
  _DigitalMenuState createState() => _DigitalMenuState();
}

class _DigitalMenuState extends State<DigitalMenu> {
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
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: bodyTextStyle.copyWith(fontSize: 18),
                      children: const [
                        TextSpan(
                            text:
                                "La forma más fácil de diseñar menús QR, incluso sin un día de experiencia en diseño. ¡En cuestión de minutos, puede crear menús que llamarán la atención sobre su negocio, cafetería, bar o restaurante!\nEn esta aplicación encontraras muchos recursos gratuitos que incluyen muchas imágenes y variadas plantillas, fuentes e íconos que puede usar de forma totalmente gratuita. ¿Quieres algo oscuro, claro, clásico o elegante? Lo encontrarás. Además, la aplicación viene con la funcionalidad Lector QR."),
                        TextSpan(text: "\n"),
                        TextSpan(text: "\n"),
                      ],
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        openUrl(
                            "https://play.google.com/store/apps/details?id=com.soludevarg.digitalmenu");
                      },
                      child: const Image(
                        image: const AssetImage(
                            'assets/images/disponible-google-play.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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

class SobreNosotros extends StatelessWidget {
  const SobreNosotros({Key? key}) : super(key: key);

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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/soludev_logo_horizontal.png'))),
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text("Conocenos.", style: headlineTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "Somos SoluDev, una Start-Up Argentina que genera proyectos tecnolólogicos innovadores con un alto impacto positivo en la comunidad. Esto lo realizamos trabajando con tecnologías exponenciales en iniciativas de mejorar la calidad de navegacion de los usuarios.",
                  style: bodyTextStyle.copyWith(fontSize: 18, shadows: [
                    const Shadow(
                      color: Colors.white,
                      offset: Offset(1, 1),
                      blurRadius: 1,
                    ),
                    const Shadow(
                      color: Colors.white,
                      offset: const Offset(-1, -1),
                      blurRadius: 1,
                    ),
                    const Shadow(
                      color: Colors.white,
                      offset: const Offset(-1, 1),
                      blurRadius: 1,
                    ),
                    const Shadow(
                      color: Colors.white,
                      offset: const Offset(1, -1),
                      blurRadius: 1,
                    )
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            validator: (value) {
              if (value!.isEmpty) {
                return "Debes ingresar tu nombre";
              }
              return null;
            },
            onChanged: (value) {},
            decoration: const InputDecoration(
              labelText: "Nombre",
              hintText: "Ingrese su nombre",
              border: const OutlineInputBorder(),
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
                  ? 'Debes ingresar un e-mail valido\n Ejemplo. xxxxx@yyyy.zzz'
                  : null;
            },
            decoration: const InputDecoration(
              labelText: "Correo electrónico",
              hintText: "Ingrese su dirección de correo electrónico",
              border: OutlineInputBorder(),
            ),
          ),
          ResponsiveRowColumn(
            layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowSpacing: 25,
            columnSpacing: 30,
            children: [
              ResponsiveRowColumnItem(
                rowOrder: 1,
                rowFlex: 1,
                columnOrder: 1,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 1, bottom: 1, right: 12, left: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 117, 117, 117),
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
                      "Varios"
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
              ResponsiveRowColumnItem(
                rowOrder: 2,
                rowFlex: 1,
                columnOrder: 2,
                child: TextFormField(
                  controller: _telefonoController,
                  focusNode: focusTelefono,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focusDescripcion);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Debes ingresar tu número de teléfono";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: "Teléfono",
                    hintText: "ingrese su teléfono",
                    border: const OutlineInputBorder(),
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
            validator: (value) {
              if (value!.isEmpty) {
                return "Debes ingresar tu consulta";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Descripción",
              alignLabelWithHint: true,
              hintText: "Ingrese su consulta",
              border: const OutlineInputBorder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Center(
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendEmail(
                        name: _nombreController.text.trim(),
                        email: _emailController.text.trim(),
                        subject: _chosenValue == null
                            ? "Consulta sobre: desarrollo 'sin especificar'."
                            : "Consulta sobre: desarrollo $_chosenValue.",
                        message: "      Email: ${_emailController.text.trim()}."
                            "     Teléfono: ${_telefonoController.text.trim()}."
                            "     Mensaje: ${_descripcionController.text.trim()}.");
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Contacto'),
                            content: const Text(
                                'Su mensaje fue enviado exitosamente, recibirá una respuesta a la brevedad. Gracias por comunicarte con nosotros.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Aceptar')),
                            ],
                          );
                        });
                    _nombreController.clear();
                    _emailController.clear();
                    _telefonoController.clear();
                    _descripcionController.clear();
                    _chosenValue = null;
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'Debes ingresar de forma correcta los campos solicitados para poder continuar.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Aceptar')),
                            ],
                          );
                        });
                  }
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
                                  "https://play.google.com/store/apps/developer?id=SoluDev");
                            },
                          text: "google play"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl(
                                  "https://www.youtube.com/channel/UCeldMeYBi5ebvTmB7t_3XLA");
                            },
                          text: "youtube"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl(
                                  "https://drive.google.com/file/d/1v2KTZfr2AgrAz4Z10nyYa5Hsyei7EriI/view?usp=sharing");
                            },
                          text: "políticas de privacidad"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://soludevs.web.app/");
                            },
                          text: "español"),
                      const TextSpan(text: "  •  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://soludevs.web.app/");
                            },
                          text: "english"),
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
