import 'package:app/features/home/widgets/widgets.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        backgroundColor: LightColors().primary,
        elevation: 0,
        toolbarHeight: 0,
        expandedHeight: 85,
        flexibleSpace: const FlexibleSpaceBar(background: GreetingHeader()),
      ),
      SliverAppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(child: Container(color: LightColors().primary)),
                  Expanded(child: Container(color: LightColors().surface)),
                ],
              ),
              const BalanceCard(),
            ],
          ),
        ),
      ),
       SliverPadding(
        padding: const EdgeInsets.only(bottom: 24),
        sliver: SliverToBoxAdapter(child: Container(
          color: Colors.transparent,
          child: const PromoBanner())),
      ),
      const SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(child: FinanceGrid()),
      ),
      const SliverPadding(
        padding: EdgeInsets.fromLTRB(16, 24, 0, 24),
        sliver: SliverToBoxAdapter(child: PromoCarousel()),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 80)),
      const SliverToBoxAdapter(child: SizedBox(height: 800)),
    ],
  );
}
