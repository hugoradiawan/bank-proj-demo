class CountryFetchFailedError implements Exception {
  CountryFetchFailedError([this.message = 'Failed to fetch countries.']);
  final String message;

  @override
  String toString() => 'CountryFetchFailedError: $message';
}
