import 'dart:async';

import 'package:core/core.dart';
import 'package:fuzzy/data/result.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:shared/src/ui/country_selector/country_selector.dart';

part 'src/country_search.cubit.dart';
part 'src/country_search.state.dart';

typedef CountrySearchCubit = _CountrySearchCubit;
typedef CountrySearchState = _CountrySearchState;
typedef CountrySearchResult = Result<Country>;
