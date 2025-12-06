import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:premium/src/data/models/country_with_flag.model.dart';
import 'package:premium/src/domain/usecases/fetch_country_with_flag.dart';
import 'package:premium/src/route/premium.route.dart';
import 'package:shared/shared.dart';

part 'src/registration/registration.cubit.dart';
part 'src/registration/registration.state.dart';

typedef RegistrationCubit = _RegistrationCubit;
typedef RegistrationState = _RegistrationState;
