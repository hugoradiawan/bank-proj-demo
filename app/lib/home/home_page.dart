import 'package:app/home/components/home.component.dart' show AppBottomNavBar;
import 'package:app/home/enums/tabs.enum.dart' show TabsEnum;
import 'package:core/core.dart' show BlocBuilder, BlocProvider, Cubit;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

class AppBottomNavBarCubit extends Cubit<int> {
  AppBottomNavBarCubit() : super(0);

  void setIndex(int index) => emit(index);

  void onTap(TabsEnum tab) => emit(TabsEnum.values.indexOf(tab));
}
