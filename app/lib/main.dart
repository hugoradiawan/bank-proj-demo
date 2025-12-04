import 'package:app/shell/app_scaffold.dart';
import 'package:core/core.dart' show AppTheme, AppTypography;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiMode;

void main() {
  AppTypography.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MondooliApp());
}

class MondooliApp extends StatelessWidget {
  const MondooliApp({super.key});

  @override
  Widget build(_) =>
      MaterialApp(theme: AppTheme.light, home: const AppScaffold());
}
