import 'package:app/home/enums/tabs.enum.dart' show TabsEnum;
import 'package:app/home/presentation/cubits/home_cubit.dart'
    show AppBottomNavBarCubit;
import 'package:app/home/presentation/pages/components/home.component.dart'
    show AppBottomNavBar;
import 'package:core/core.dart' show BlocBuilder, BlocProvider;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(_) => BlocProvider<AppBottomNavBarCubit>(
    create: (_) => AppBottomNavBarCubit(),
    child: Scaffold(
      body: BlocBuilder<AppBottomNavBarCubit, int>(
        builder: (_, int currentIndex) => TabsEnum.tabs[currentIndex],
      ),
      bottomNavigationBar: const ColoredBox(
        color: Colors.white,
        child: SafeArea(top: false, child: AppBottomNavBar()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ),
  );
}
