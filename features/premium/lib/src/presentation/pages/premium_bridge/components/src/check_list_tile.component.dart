part of 'premium_bridge.component.dart';

class _CheckListTile extends StatelessWidget {
  const _CheckListTile(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(Icons.check_circle, color: colors.surface, size: 19),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: AutoSizeText(
                text,
                style: TextStyle(
                  fontSize: 16,
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
