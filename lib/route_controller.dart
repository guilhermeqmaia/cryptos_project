import 'package:flutter/material.dart';
import 'package:projeto_criptos/revision/view/revision_page.dart';
import 'package:projeto_criptos/shared/utils/arguments/to_revision_arguments.dart';
import 'conversion/view/conversion_page.dart';
import 'shared/utils/arguments/to_conversion_arguments.dart';
import 'shared/utils/arguments/to_details_arguments.dart';

import 'details/view/details_screen.dart';
import 'moves/view/moves_screen.dart';
import 'portfolio/view/portfolio_screen.dart';

class RouteController {
  static Route<dynamic>? generateRoute(settings) {
    if (settings.name == PortfolioScreen.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return const PortfolioScreen();
        },
      );
    } else if (settings.name == MovesScreen.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return const MovesScreen();
        },
      );
    } else if (settings.name == DetailsScreen.route) {
      final args = settings.arguments as ToDetailsArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return DetailsScreen(
            asset: args.crypto,
            coinAmmount: args.coinAmmount,
          );
        },
      );
    } else if (settings.name == ConversionPage.route) {
      final args = settings.arguments as ToConversionArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return ConversionPage(
            coinAmmount: args.cryptoAmmount,
            asset: args.crypto,
          );
        },
      );
    } else if (settings.name == RevisionPage.route) {
      final args = settings.arguments as ToRevisionArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return RevisionPage(
            convert: args.convert,
            recieve: args.recieve,
            cambio: args.cambio,
          );
        },
      );
    }
    return null;
  }
}
