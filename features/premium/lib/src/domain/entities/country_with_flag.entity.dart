abstract class CountryWithFlag {
  String get cca2;
  Name get name;
  Flag? get flags;
}

abstract class Flag {
  String? get png;
  String? get svg;
  String? get alt;
}

abstract class Name {
  String? get common;
  String? get official;
}
