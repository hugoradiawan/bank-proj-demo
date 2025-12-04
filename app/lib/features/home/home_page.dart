import 'package:app/features/home/widgets/widgets.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: <Widget>[
      _appBar(
        heights: (85, 30),
        backgroundColor: LightColors().primary,
        child: const GreetingHeader(),
      ),
      _appBar(
        heights: (178, 60),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(child: Container(color: LightColors().primary)),
                Expanded(child: Container(color: LightColors().surface)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: BalanceCard(),
            ),
          ],
        ),
      ),
      const SliverPadding(
        padding: EdgeInsets.only(bottom: 24, top: 12),
        sliver: SliverToBoxAdapter(child: PromoBanner()),
      ),
      const SliverPadding(
        padding: EdgeInsets.fromLTRB(16, 0, 20, 0),
        sliver: SliverToBoxAdapter(child: FinanceGrid()),
      ),
      const SliverPadding(
        padding: EdgeInsets.symmetric(vertical: 24),
        sliver: SliverToBoxAdapter(child: PromoCarousel()),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 200)),
    ],
  );

  SliverAppBar _appBar({
    required (double, double) heights,
    required Widget child,
    Color? backgroundColor,
  }) => SliverAppBar(
    backgroundColor: backgroundColor ?? Colors.white,
    elevation: 0,
    toolbarHeight: 0,
    expandedHeight: heights.$1,
    collapsedHeight: heights.$2,
    flexibleSpace: FlexibleSpaceBar(background: child),
  );
}
