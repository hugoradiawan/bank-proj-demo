import 'package:core/core.dart' show AppColors, AppColorsContextX;
import 'package:flutter/material.dart'
    show
        AnnotatedRegion,
        Brightness,
        BuildContext,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        FocusScope,
        FontWeight,
        GestureDetector,
        SafeArea,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        Stack,
        StatelessWidget,
        Text,
        Theme,
        ThemeData,
        Widget;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:premium/src/presentation/pages/registration/components/registration.component.dart'
    show
        CountryField,
        EmailField,
        FullNameField,
        PasswordField,
        PasswordValidationChecklist,
        RegisterButton;
import 'package:shared/shared.dart' show FloatingBackButton;

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final ThemeData theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
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
                    const SizedBox(height: 80),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Premium Registration',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Fill the information below',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 24),
                            const FullNameField(),
                            const SizedBox(height: 16),
                            const EmailField(),
                            const SizedBox(height: 16),
                            const CountryField(),
                            const SizedBox(height: 16),
                            const PasswordField(),
                            const SizedBox(height: 12),
                            const PasswordValidationChecklist(),
                            const SizedBox(height: 100),
                          ],
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
