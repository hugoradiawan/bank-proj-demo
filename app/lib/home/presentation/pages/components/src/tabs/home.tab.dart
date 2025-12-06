part of '../../tabs.dart';

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
    return CustomScrollView(
      slivers: <Widget>[
        _appBar(
          heights: (85, 30),
          backgroundColor: colors.primary,
          systemOverlayStyle: overlayStyle,
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
          backgroundColor: colors.surface,
          systemOverlayStyle: overlayStyle,
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
    required Color backgroundColor,
    SystemUiOverlayStyle? systemOverlayStyle,
  }) => SliverAppBar(
    backgroundColor: backgroundColor,
    systemOverlayStyle: systemOverlayStyle,
    elevation: 0,
    toolbarHeight: 0,
    expandedHeight: heights.$1,
    collapsedHeight: heights.$2,
    flexibleSpace: FlexibleSpaceBar(background: child),
  );
}
