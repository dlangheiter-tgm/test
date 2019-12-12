import 'package:src/src.dart';

class ServerConfig extends Configuration {

  /// Port to run the application
  int port;

  /// How many processors (cores) should be used
  ///
  /// 0 uses all cores. Negative numbers use all cores minus the number (-1 => 7 cores on a 8 core machine)
  int processors;

}