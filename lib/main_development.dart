import 'dart:io';

import 'package:vocab_drill/app/app.dart';
import 'package:vocab_drill/bootstrap.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  bootstrap(() => const App());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        return true;
      });
  }
}
