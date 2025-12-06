// ignore because of it does used
// ignore_for_file: unused_element_parameter
part of '../home.component.dart';

class _PromoCard extends StatelessWidget {
  const _PromoCard({
    required this.assetPath,
    this.onTap,
    super.key,
  });

  final String assetPath;
  final VoidCallback? onTap;

  @override
  Widget build(_) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
