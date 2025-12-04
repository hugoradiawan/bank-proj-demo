// ignore because of it does used
// ignore_for_file: unused_element_parameter

part of '../home.component.dart';

class _AppBottomNavBar extends StatelessWidget {
  const _AppBottomNavBar({super.key});

  @override
  Widget build(_) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(height: 1, color: LightColors().gray200),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: TabsEnum.values
              .map(
                (TabsEnum tab) => BlocBuilder<AppBottomNavBarCubit, int>(
                  builder: (BuildContext context, int currentIndex) => _NavItem(
                    icon: currentIndex == TabsEnum.values.indexOf(tab)
                        ? tab.iconFilled
                        : tab.iconBold,
                    label: tab.label,
                    isQris: tab.isQris,
                    isSelected: currentIndex == TabsEnum.values.indexOf(tab),
                    onTap: () =>
                        context.read<AppBottomNavBarCubit>().onTap(tab),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
}
