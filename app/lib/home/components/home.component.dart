import 'package:app/home/cubits/home_cubit.dart' show AppBottomNavBarCubit;
import 'package:app/home/enums/tabs.enum.dart' show TabsEnum;
import 'package:core/core.dart' show BlocBuilder, LightColors, ReadContext;
import 'package:flutter/material.dart'
    show
        Alignment,
        AnimatedContainer,
        AssetImage,
        BorderRadius,
        BorderSide,
        BoxDecoration,
        BoxFit,
        BoxShadow,
        BoxShape,
        BuildContext,
        Clip,
        ClipOval,
        ClipRRect,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        Divider,
        EdgeInsets,
        Expanded,
        FontWeight,
        GestureDetector,
        HitTestBehavior,
        Icon,
        IconData,
        Icons,
        Image,
        Ink,
        InkWell,
        MainAxisAlignment,
        MainAxisSize,
        Material,
        MaterialType,
        Matrix4,
        NetworkImage,
        Offset,
        Padding,
        PageController,
        PageView,
        Positioned,
        RoundedRectangleBorder,
        Row,
        SafeArea,
        SizedBox,
        Stack,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        Theme,
        ThemeData,
        Transform,
        VoidCallback,
        Widget;
import 'package:shared/shared.dart'
    show
        PhosphorIcon,
        PhosphorIconsBold,
        QuickActionButton,
        SectionHeader,
        VerticalIconButton;

part 'src/app_bottom_nav_bar.dart';
part 'src/balance_card.dart';
part 'src/deposit_button.dart';
part 'src/finance_grid.dart';
part 'src/greeting_header.dart';
part 'src/nav_item.dart';
part 'src/promo_banner.dart';
part 'src/promo_card.dart';
part 'src/promo_carousel.dart';

typedef FinanceGrid = _FinanceGrid;
typedef GreetingHeader = _GreetingHeader;
typedef PromoCarousel = _PromoCarousel;
typedef AppBottomNavBar = _AppBottomNavBar;
typedef BalanceCard = _BalanceCard;
typedef PromoBanner = _PromoBanner;
