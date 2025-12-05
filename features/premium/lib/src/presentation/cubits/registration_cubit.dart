import 'package:core/core.dart' show Cubit, NoParams;
import 'package:flutter/material.dart' show BuildContext;
import 'package:premium/src/data/models/country_with_flag.model.dart' show CountryWithFlagModel;
import 'package:premium/src/domain/usecases/fetch_country_with_flag.dart';
import 'package:shared/shared.dart' show Country;

part 'src/registration.cubit.dart';
part 'src/registration.state.dart';

typedef RegistrationCubit = _RegistrationCubit;
typedef RegistrationState = _RegistrationState;
