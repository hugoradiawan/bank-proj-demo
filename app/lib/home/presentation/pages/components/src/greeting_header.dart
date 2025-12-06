// ignore because of it does used
// ignore_for_file: unused_element_parameter

part of '../home.component.dart';

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader({
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
    final AppColors colors = context.colors;
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);
    final bool isTablet = Responsive.isTabletOrLarger(context);
    final double avatarSize = isTablet ? 52 : 44;

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        8 * spacingMultiplier,
        horizontalPadding,
        24 * spacingMultiplier,
      ),
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
                        width: avatarSize,
                        height: avatarSize,
                        fit: BoxFit.cover,
                      )
                    : Ink(
                        width: avatarSize,
                        height: avatarSize,
                        child: ClipOval(
                          child: Image(
                            image: const AssetImage(
                              'assets/images/person.webp',
                            ),
                            width: avatarSize,
                            height: avatarSize,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(width: 14 * spacingMultiplier),
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
              child: VerticalIconButton(
                icon: PhosphorIconsBold.headset,
                onTap: onCustomerServiceTap,
              ),
            ),
            SizedBox(width: 8 * spacingMultiplier),
            VerticalIconButton(
              icon: PhosphorIconsBold.bell,
              onTap: onNotificationTap,
            ),
          ],
        ),
      ),
    );
  }
}
