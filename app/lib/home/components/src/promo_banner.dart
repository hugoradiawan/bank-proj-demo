// ignore because of it does used
// ignore_for_file: unused_element_parameter

part of '../home.component.dart';

class _PromoBanner extends StatelessWidget {
  const _PromoBanner({this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LightColors colors = LightColors();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            decoration: BoxDecoration(
              gradient: colors.premiumGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'More Benefit, More Fun!',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colors.gold2,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: <Widget>[
                          Text(
                            'Upgrade to Premium',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                          const SizedBox(width: 4),
                          PhosphorIcon(
                            PhosphorIconsBold.caretRight,
                            color: Colors.white.withValues(alpha: 0.9),
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: 'premium_crown',
                  child: Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(0.28)
                      ..scaleByDouble(2.1, 2.1, 1, 1),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/crown.webp',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  splashColor: colors.gold2.withValues(alpha: 0.4),
                  highlightColor: Colors.white10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
