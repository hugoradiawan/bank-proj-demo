part of '../country_search_cubit.dart';

class _CountrySearchCubit extends Cubit<_CountrySearchState> {
  _CountrySearchCubit({
    required List<Country> countries,
    Country? selectedCountry,
  }) : super(
         _CountrySearchState(
           allCountries: countries,
           filteredCountries: countries,
           selectedCountry: selectedCountry,
         ),
       );

  Timer? _debounceTimer;

  static const Duration _debounceDuration = Duration(milliseconds: 300);

  void search(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () {
      _performSearch(query);
    });
  }

  void _performSearch(String query) {
    final String trimmedQuery = query.trim();

    if (trimmedQuery.isEmpty) {
      emit(state.copyWith(query: '', filteredCountries: state.allCountries));
      return;
    }

    final Fuzzy<Country> fuse = Fuzzy<Country>(
      state.allCountries,
      options: FuzzyOptions<Country>(
        keys: <WeightedKey<Country>>[
          WeightedKey<Country>(
            name: 'name',
            getter: (Country country) => country.name,
            weight: 1,
          ),
        ],
        threshold: 0.4,
        findAllMatches: true,
      ),
    );

    final List<CountrySearchResult> results = fuse.search(trimmedQuery);
    final List<Country> filteredCountries = results
        .map((CountrySearchResult r) => r.item)
        .toList();

    emit(
      state.copyWith(query: trimmedQuery, filteredCountries: filteredCountries),
    );
  }

  void clearSearch() {
    _debounceTimer?.cancel();
    emit(state.copyWith(query: '', filteredCountries: state.allCountries));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
