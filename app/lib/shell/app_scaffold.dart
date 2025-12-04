import 'package:app/features/home/home_page.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const _PlaceholderPage(title: 'Finance');
      case 2:
        return const _PlaceholderPage(title: 'QRIS');
      case 3:
        return const _PlaceholderPage(title: 'Portfolio');
      case 4:
        return const _PlaceholderPage(title: 'Profile');
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: _buildPage(_currentIndex),
    bottomNavigationBar: AppBottomNavBar(
      currentIndex: _currentIndex,
      onTap: (int index) => setState(() => _currentIndex = index),
    ),
    floatingActionButton: QrisFab(
      onPressed: () => setState(() => _currentIndex = 2),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(child: Text(title, style: theme.textTheme.headlineMedium));
  }
}
