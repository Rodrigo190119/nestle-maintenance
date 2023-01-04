import 'package:flutter_maintenance/commons/environment/environment.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppConfiguration {
  static void init() {
    //-------------DEFINE BOOT ENV--------------
    Environment.environment = ENVIRONMENT.testing; //ENV.DESA;
    initializeDateFormatting();
  }

  static bool isTestingEnvironment()
    => Environment.environment == ENVIRONMENT.testing;
}