part of '../country_search_cubit.dart';

class _CountrySearchState {
  const _CountrySearchState({
    this.query = '',
    this.allCountries = const <Country>[],
    this.filteredCountries = const <Country>[],
    this.selectedCountry,
  });

  final String query;
  final List<Country> allCountries;
  final List<Country> filteredCountries;
  final Country? selectedCountry;

  bool get hasQuery => query.trim().isNotEmpty;

  bool get isEmpty => hasQuery && filteredCountries.isEmpty;

  _CountrySearchState copyWith({
    String? query,
    List<Country>? allCountries,
    List<Country>? filteredCountries,
    Country? selectedCountry,
  }) =>
      _CountrySearchState(
        query: query ?? this.query,
        allCountries: allCountries ?? this.allCountries,
        filteredCountries: filteredCountries ?? this.filteredCountries,
        selectedCountry: selectedCountry ?? this.selectedCountry,
      );
}
