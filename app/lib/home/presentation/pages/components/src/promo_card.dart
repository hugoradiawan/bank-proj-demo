// ignore because of it does used
// ignore_for_file: unused_element_parameter
part of '../home.component.dart';

class _PromoCard extends StatelessWidget {
  const _PromoCard({
    required this.title,
    required this.subtitle,
    this.backgroundColor,
    this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(_) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LightColors().premiumGradient,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
