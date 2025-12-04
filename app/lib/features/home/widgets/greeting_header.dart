import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({
    this.userName = 'John Doe',
    this.avatarUrl,
    this.onNotificationTap,
    this.onCustomerServiceTap,
    this.onProfileTap,
    super.key,
  });

  final String userName;
  final String? avatarUrl;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onCustomerServiceTap;
  final VoidCallback? onProfileTap;

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
            Material(
              color: colors.gray200.withValues(alpha: 0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(
                  color: colors.primaryLight.withValues(alpha: 0.5),
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                splashColor: Colors.white,
                onTap: onProfileTap,
                child: avatarUrl != null
                    ? Ink.image(
                        image: NetworkImage(avatarUrl!),
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      )
                    : Ink(
                        width: 44,
                        height: 44,
                        child: const ClipOval(
                          child: Image(
                            image: AssetImage('assets/images/person.webp'),
                            width: 44,
                            height: 44,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
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
                onTap: onCustomerServiceTap,
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
  Widget build(BuildContext context) {
    final LightColors colors = LightColors();
    return Material(
      color: colors.primary,
      child: InkWell(
        splashColor: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(200),
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: PhosphorIcon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}
