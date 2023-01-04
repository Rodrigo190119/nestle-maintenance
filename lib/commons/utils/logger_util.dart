import 'package:logger/logger.dart';

class LoggerUtil extends LogPrinter {

  final String project = "SSTT D'onofrio";

  @override
  List<String> log(LogEvent event) {
    return [event.message];
  }
}