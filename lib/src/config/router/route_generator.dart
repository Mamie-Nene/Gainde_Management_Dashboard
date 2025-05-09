import 'package:flutter/material.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/auth/login.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/home_pages.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus%20infinity/orbus_infinity_home_page.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus%20infinity/reporting_journalier/reporting_page.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus/orbus_page.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus/pole/pole_public.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus/my_orbus/my_orbus_home_page.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus/dashboard_performance_orbus.dart';
import '../../presentation/pages/gie/gie_page.dart';
import '../../presentation/pages/orbus infinity/orbus_infinity_page.dart';
import '../../presentation/pages/orbus infinity/reporting_journalier/bad/repartition_bad_par_jour_page.dart';
import '../../presentation/pages/orbus infinity/reporting_journalier/douane/reporting_brigade_sortie_journalier_page.dart';
import '../../presentation/pages/orbus infinity/reporting_journalier/douane/reporting_brigade_visa_journalier_page.dart';

// ----------------------------- Domain Class  --------------------------------


// ----------------------------- Auth --------------------------------

// ----------------------------- Utils Pages  --------------------------------

import '../../presentation/pages/orbus/pole/deec.dart';
import '../../presentation/pages/splash_first_page.dart';
import '/src/presentation/pages/utils_pages/all_directories.dart';
import '/src/utils/const/routes/app_routes_name.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    final args = settings.arguments;

    switch (settings.name){
      case AppRoutesName.splashFirstPage:
        return MaterialPageRoute( builder: (context) =>  const SplashPage());

      case AppRoutesName.homePage:
        return MaterialPageRoute( builder: (context) =>  const MyHomePage());

      case AppRoutesName.loginPage:
        return MaterialPageRoute( builder: (context) =>  const LoginPage());

      case AppRoutesName.orbusInfinityParts :
        return MaterialPageRoute( builder: (context) =>  const OrbusInfinityPage());

      case AppRoutesName.performanceOrbus :
      return MaterialPageRoute( builder: (context) => const OrbusPage());

      case AppRoutesName.gieParts:
        return MaterialPageRoute( builder: (context) => const GIEPage());

      case AppRoutesName.polePublicOrbus :

        return MaterialPageRoute( builder: (context) =>  PolePublic());
      case AppRoutesName.deec :
        return MaterialPageRoute( builder: (context) =>  DEEC());

      case AppRoutesName.repartitionBadParJourPage :
        return MaterialPageRoute( builder: (context) =>  const RepartitionBadParJour());


      case AppRoutesName.reportingVisaBrigadeJournalierPage :
        return MaterialPageRoute( builder: (context) =>  const ReportingJournalierForVisaBrigade());

      case AppRoutesName.reportingSortieBrigadeJournalierPage :
        return MaterialPageRoute( builder: (context) =>  const ReportingJournalierForSortieBrigade());

      case AppRoutesName.blankPage:
        return MaterialPageRoute(  builder: (context) => const BlankPage());

      default :
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
            builder: (context){
    return const ErrorScreen();
        }
    );
  }


}