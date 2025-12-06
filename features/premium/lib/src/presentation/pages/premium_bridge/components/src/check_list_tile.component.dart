part of 'premium_bridge.component.dart';

class _CheckListTile extends StatelessWidget {
  //
  // ignore: unused_element_parameter
  const _CheckListTile(this.text, {this.isTablet = false});

  final String text;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final double iconSize = isTablet ? 24 : 19;
    final double fontSize = isTablet ? 20 : 16;
    final double spacing = isTablet ? 14 : 10;
    final double verticalPadding = isTablet ? 6 : 3;

    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(Icons.check_circle, color: colors.surface, size: iconSize),
          SizedBox(width: spacing),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: AutoSizeText(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: colors.textOnPrimary.withValues(alpha: 0.9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
