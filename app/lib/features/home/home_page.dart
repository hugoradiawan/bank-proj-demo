import 'package:app/features/home/widgets/widgets.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: <Widget>[
      const SliverToBoxAdapter(child: GreetingHeader()),
      SliverToBoxAdapter(
        child: Transform.translate(
          offset: const Offset(0, -20),
          child: const BalanceCard(),
        ),
      ),
      const SliverPadding(
        padding: EdgeInsets.only(top: 4, bottom: 24),
        sliver: SliverToBoxAdapter(child: PromoBanner()),
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
    ],
  );
}
