part of '../../tabs.dart';

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);

    return BlocProvider<_HomeTabCubit>(
      create: (_) => _HomeTabCubit(),
      child: Builder(
        builder: (BuildContext context) =>
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) => context
                  .read<_HomeTabCubit>()
                  .changeTab(notification.metrics.pixels),
              child: CustomScrollView(
                slivers: <Widget>[
                  _appBar(
                    heights: (85, 30),
                    backgroundColor: colors.primary,
                    isDarkMode: isDarkMode,
                    child: GreetingHeader(
                      onNotificationTap: context.read<ThemeCubit>().toggleTheme,
                      onProfileTap: () {},
                      onCustomerServiceTap: () {},
                    ),
                  ),
                  BlocBuilder<_HomeTabCubit, double>(
                    builder: (BuildContext context, double state) => _appBar(
                      heights: (178, 60),
                      backgroundColor: colors.surface,
                      isDarkMode: isDarkMode,
                      isSwitchStatusBar: state > 230,
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
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      bottom: 24 * spacingMultiplier,
                      top: 12 * spacingMultiplier,
                    ),
                    sliver: const SliverToBoxAdapter(child: PremiumBanner()),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      0,
                      horizontalPadding + 4,
                      0,
                    ),
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
                    padding: EdgeInsets.symmetric(
                      vertical: 24 * spacingMultiplier,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: PromoCarousel(onMorePromo: () {}),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 400)),
                ],
              ),
            ),
      ),
    );
  }

  SliverAppBar _appBar({
    required (double, double) heights,
    required Widget child,
    required Color backgroundColor,
    required bool isDarkMode,
    bool isSwitchStatusBar = false,
  }) => SliverAppBar(
    backgroundColor: backgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: !isSwitchStatusBar
          ? Brightness.light
          : (isDarkMode ? Brightness.light : Brightness.dark),
      statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
    ),
    elevation: 0,
    toolbarHeight: 0,
    expandedHeight: heights.$1,
    collapsedHeight: heights.$2,
    flexibleSpace: FlexibleSpaceBar(background: child),
  );
}

class _HomeTabCubit extends Cubit<double> {
  _HomeTabCubit() : super(0);

  bool changeTab(double index) {
    emit(index);
    return false;
  }
}
