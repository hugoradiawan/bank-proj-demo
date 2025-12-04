import 'package:app/home/home_page.dart' show HomePage;
import 'package:core/core.dart' show AppTheme, AppTypography;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiMode, SystemUiOverlayStyle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTypography.init();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MondooliApp());
}

class MondooliApp extends StatelessWidget {
  const MondooliApp({super.key});

  static const SystemUiOverlayStyle _overlayStyle = SystemUiOverlayStyle(
    // Android
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    // iOS
    statusBarBrightness: Brightness.light,
  );

  @override
  Widget build(_) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: _overlayStyle,
    child: MaterialApp(theme: AppTheme.light, home: const HomePage()),
  );
}
