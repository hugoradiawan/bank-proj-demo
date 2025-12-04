part of '../tabs.dart';

class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(child: Text(title, style: theme.textTheme.headlineMedium));
  }
}
