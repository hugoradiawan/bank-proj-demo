part of '../../tabs.dart';

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    return CustomScrollView(
      slivers: <Widget>[
        _appBar(
          heights: (85, 30),
          backgroundColor: colors.primary,
          child: GreetingHeader(
            onNotificationTap: () {
              context.read<ThemeCubit>().toggleTheme();
            },
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
                  Expanded(child: Container(color: colors.primary)),
                  Expanded(child: Container(color: colors.surface)),
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
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 24, top: 12),
          sliver: SliverToBoxAdapter(child: PremiumBanner()),
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
        const SliverToBoxAdapter(child: SizedBox(height: 400)),
      ],
    );
  }

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
