import 'package:app/home/enums/tabs.enum.dart';
import 'package:app/home/presentation/cubits/home_cubit.dart';
import 'package:app/home/presentation/pages/components/home.component.dart';
import 'package:core/core.dart';
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
      bottomNavigationBar: const AppBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ),
  );
}
