import 'package:core/core.dart' show BlocBuilder, LightColors, ReadContext;
import 'package:flutter/material.dart'
    show BorderRadius, BoxDecoration, BuildContext, Color, Column, Container, CrossAxisAlignment, EdgeInsets, FilledButton, FontWeight, GestureDetector, MainAxisSize, Padding, Positioned, Radius, RoundedRectangleBorder, Row, SafeArea, Size, SizedBox, StatelessWidget, Text, TextInputAction, TextInputType, Theme, ThemeData, Widget;
import 'package:premium/src/presentation/cubits/registration_cubit.dart'
    show RegistrationCubit, RegistrationState;
import 'package:shared/shared.dart'
    show AppTextField, CountrySelector, PhosphorIcon, PhosphorIconsBold;

part 'src/full_name_field.component.dart';
part 'src/email_field.component.dart';
part 'src/country_field.component.dart';
part 'src/password_field.component.dart';
part 'src/password_validation_check_list.component.dart';
part 'src/validation_item.component.dart';
part 'src/register_button.component.dart';

typedef FullNameField = _FullNameField;
typedef EmailField = _EmailField;
typedef CountryField = _CountryField;
typedef PasswordField = _PasswordField;
typedef PasswordValidationChecklist = _PasswordValidationChecklist;
typedef RegisterButton = _RegisterButton;
