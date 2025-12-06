import 'package:app/home/presentation/pages/components/tabs.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

enum TabsEnum {
  home(
    label: 'Home',
    iconFilled: PhosphorIconsFill.house,
    iconBold: PhosphorIconsBold.house,
    tab: HomeTab(),
  ),
  finance(
    label: 'Finance',
    iconFilled: PhosphorIconsFill.coins,
    iconBold: PhosphorIconsBold.coins,
    tab: PlaceholderTab(title: 'Finance'),
  ),
  qris(
    label: 'QRIS',
    iconFilled: PhosphorIconsFill.qrCode,
    iconBold: PhosphorIconsBold.qrCode,
    tab: PlaceholderTab(title: 'QRIS'),
    isQris: true,
  ),
  portfolio(
    label: 'Portfolio',
    iconFilled: PhosphorIconsFill.chartPieSlice,
    iconBold: PhosphorIconsBold.chartPieSlice,
    tab: PlaceholderTab(title: 'Portfolio'),
  ),
  profile(
    label: 'Profile',
    iconFilled: PhosphorIconsFill.user,
    iconBold: PhosphorIconsBold.user,
    tab: PlaceholderTab(title: 'Profile'),
  );

  const TabsEnum({
    required this.label,
    required this.iconFilled,
    required this.iconBold,
    required this.tab,
    this.isQris = false,
  });

  final String label;
  final PhosphorFlatIconData iconFilled;
  final PhosphorFlatIconData iconBold;
  final Widget tab;
  final bool isQris;

  static List<Widget> get tabs =>
      TabsEnum.values.map((TabsEnum e) => e.tab).toList();
}
