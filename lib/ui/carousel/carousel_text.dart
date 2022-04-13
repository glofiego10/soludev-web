import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';

RichText slide1Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Diseños', style: carouselBlueTextStyle),
      TextSpan(text: ' atractivos', style: carouselWhiteTextStyle),
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide2Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Excelente ', style: carouselWhiteTextStyle),
      TextSpan(text: ' rendimiento', style: carouselBlueTextStyle),
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide3Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Rapido ', style: carouselBlueTextStyle),
      TextSpan(text: ' desarollo', style: carouselWhiteTextStyle),
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide4Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Plataformas', style: carouselBlueTextStyle),
      TextSpan(text: ' móvil, web & escritorio', style: carouselWhiteTextStyle),
    ],
    style: TextStyle(height: 1.1),
  ),
  textAlign: TextAlign.center,
);
