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
    _PromoData(title: 'BLACK FRIDAY', subtitle: 'SALE 30% OFF'),
    _PromoData(title: 'SPECIAL OFFER', subtitle: 'BIG DISCOUNT'),
    _PromoData(title: 'YEAR END SALE', subtitle: 'UP TO 50% OFF'),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(_) {
    final LightColors colors = LightColors();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SectionHeader(
            title: 'Promo',
            actionText: 'More promo',
            onActionTap: widget.onMorePromo,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 190,
          child: PageView.builder(
            controller: _pageController,
            padEnds: false,
            onPageChanged: (int index) => setState(() => _currentPage = index),
            itemCount: _promos.length,
            itemBuilder: (BuildContext context, int index) {
              final _PromoData promo = _promos[index];
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _PromoCard(title: promo.title, subtitle: promo.subtitle),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
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
  const _PromoData({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
}
