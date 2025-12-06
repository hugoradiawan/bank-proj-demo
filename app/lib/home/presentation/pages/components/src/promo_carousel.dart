// ignore because of it does used
// ignore_for_file: unused_element_parameter
part of '../home.component.dart';

class _PromoCarousel extends StatefulWidget {
  const _PromoCarousel({this.onMorePromo, super.key});

  final VoidCallback? onMorePromo;

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  final PageController _pageController = PageController(viewportFraction: .875);
  int _currentPage = 0;

  static const List<_PromoData> _promos = <_PromoData>[
    _PromoData(assetPath: 'assets/images/promo1.webp'),
    _PromoData(assetPath: 'assets/images/promo2.webp'),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);
    const double promoAspectRatio = 1.73;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: SectionHeader(
            title: 'Promo',
            actionText: 'More promo',
            onActionTap: widget.onMorePromo,
          ),
        ),
        SizedBox(height: 16 * spacingMultiplier),
        AspectRatio(
          aspectRatio: promoAspectRatio / 0.875,
          child: PageView.builder(
            controller: _pageController,
            padEnds: false,
            onPageChanged: (int index) => setState(() => _currentPage = index),
            itemCount: _promos.length,
            itemBuilder: (BuildContext context, int index) {
              final _PromoData promo = _promos[index];
              return Padding(
                padding: EdgeInsets.only(left: horizontalPadding),
                child: _PromoCard(assetPath: promo.assetPath),
              );
            },
          ),
        ),
        SizedBox(height: 14 * spacingMultiplier),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            _promos.length,
            (int index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? colors.primary
                    : colors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PromoData {
  const _PromoData({required this.assetPath});
  final String assetPath;
}
