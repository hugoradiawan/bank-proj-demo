part of '../tabs.dart';

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(_) => CustomScrollView(
    slivers: <Widget>[
      _appBar(
        heights: (85, 30),
        backgroundColor: LightColors().primary,
        child: GreetingHeader(
          onNotificationTap: () {},
          onProfileTap: () {},
          onCustomerServiceTap: () {},
        ),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: BalanceCard(
                onDeposit: () {},
                onTransfer: () {},
                onSavings: () {},
                onMyQr: () {},
              ),
            ),
          ],
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.only(bottom: 24, top: 12),
        sliver: SliverToBoxAdapter(child: PromoBanner(onTap: () {})),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 0, 20, 0),
        sliver: SliverToBoxAdapter(
          child: FinanceGrid(
            onBills: () {},
            onElectricity: () {},
            onGold: () {},
            onInsurance: () {},
            onViewMore: () {},
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        sliver: SliverToBoxAdapter(child: PromoCarousel(onMorePromo: () {})),
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
