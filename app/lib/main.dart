import 'package:app/app_router.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Core.initialize();
  runApp(const MondooliApp());
}

class MondooliApp extends StatelessWidget {
  const MondooliApp({super.key});

  @override
  Widget build(_) => Core.init(
    builder: (BuildContext context, ThemeMode themeMode) => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
    ),
  );
}
