import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({
    this.userName = 'John Doe',
    this.avatarUrl,
    this.onNotificationTap,
    this.onRefreshTap,
    super.key,
  });

  final String userName;
  final String? avatarUrl;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onRefreshTap;

  String get _greeting {
    final int hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning,';
    if (hour < 17) return 'Good Afternoon,';
    return 'Good Evening,';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LightColors colors = LightColors();

    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      decoration: BoxDecoration(color: colors.primary),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              backgroundImage: avatarUrl != null
                  ? NetworkImage(avatarUrl!)
                  : null,
              child: avatarUrl == null
                  ? const ClipOval(
                      child: Image(
                        image: AssetImage('assets/images/person.webp'),
                        width: 64,
                        height: 64,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    _greeting,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  Text(
                    userName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Transform.flip(
              flipX: true,
              child: _IconButton(
                icon: PhosphorIconsBold.headset,
                onTap: onRefreshTap,
              ),
            ),
            const SizedBox(width: 8),
            _IconButton(icon: PhosphorIconsBold.bell, onTap: onNotificationTap),
          ],
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 40,
      height: 40,
      child: Center(child: PhosphorIcon(icon, color: Colors.white, size: 20)),
    ),
  );
}
