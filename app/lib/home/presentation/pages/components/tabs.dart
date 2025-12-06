import 'package:app/home/presentation/pages/components/home.component.dart'
    show BalanceCard, FinanceGrid, GreetingHeader, PromoCarousel;
import 'package:core/core.dart' show AppColors, AppColorsContextX, ReadContext, ThemeCubit;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
        Container,
        CustomScrollView,
        EdgeInsets,
        Expanded,
        FlexibleSpaceBar,
        MainAxisSize,
        Padding,
        SizedBox,
        SliverAppBar,
        SliverPadding,
        SliverToBoxAdapter,
        Stack,
        StatelessWidget,
        Text,
        Theme,
        ThemeData,
        Widget;
import 'package:premium/components.dart' show PremiumBanner;

part 'src/tabs/home.tab.dart';
part 'src/tabs/placeholder.tab.dart';

typedef HomeTab = _HomeTab;
typedef PlaceholderTab = _PlaceholderTab;
