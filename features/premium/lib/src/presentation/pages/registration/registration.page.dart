import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premium/src/presentation/pages/registration/components/registration.component.dart';
import 'package:shared/shared.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: isDarkMode
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarIconBrightness: isDarkMode
            ? Brightness.light
            : Brightness.dark,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: colors.surface,
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: <Widget>[
              FloatingBackButton(
                iconColor: colors.textPrimary,
                backgroundColor: colors.surface,
                borderColor: colors.gray200,
              ),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 80 * spacingMultiplier),
                    Expanded(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Premium Registration',
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: colors.textPrimary,
                                      ),
                                ),
                                SizedBox(height: 4 * spacingMultiplier),
                                Text(
                                  'Fill the information below',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colors.textSecondary,
                                  ),
                                ),
                                SizedBox(height: 24 * spacingMultiplier),
                                const FullNameField(),
                                SizedBox(height: 16 * spacingMultiplier),
                                const EmailField(),
                                SizedBox(height: 16 * spacingMultiplier),
                                const CountryField(),
                                SizedBox(height: 16 * spacingMultiplier),
                                const PasswordField(),
                                SizedBox(height: 12 * spacingMultiplier),
                                const PasswordValidationChecklist(),
                                SizedBox(height: 100 * spacingMultiplier),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
