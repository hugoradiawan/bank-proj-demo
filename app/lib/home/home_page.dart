import 'package:app/home/components/home.component.dart' show AppBottomNavBar;
import 'package:app/home/tabs/tabs.dart' show HomeTab, PlaceholderTab;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget _buildTab(int index) {
    switch (index) {
      case 0:
        return const HomeTab();
      case 1:
        return const PlaceholderTab(title: 'Finance');
      case 2:
        return const PlaceholderTab(title: 'QRIS');
      case 3:
        return const PlaceholderTab(title: 'Portfolio');
      case 4:
        return const PlaceholderTab(title: 'Profile');
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(_) => Scaffold(
    body: _buildTab(_currentIndex),
    bottomNavigationBar: ColoredBox(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: AppBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (int index) => setState(() => _currentIndex = index),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}
