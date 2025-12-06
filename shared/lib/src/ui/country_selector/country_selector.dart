import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'country_picker_bottomsheet.dart';

class Country {
  const Country({required this.name, required this.code, required this.flag});

  final String name;
  final String code;
  final String? flag;
}

const List<Country> kDefaultCountries = <Country>[
  Country(name: 'Indonesia', code: 'ID', flag: '🇮🇩'),
  Country(name: 'United States', code: 'US', flag: '🇺🇸'),
  Country(name: 'United Kingdom', code: 'GB', flag: '🇬🇧'),
  Country(name: 'Japan', code: 'JP', flag: '🇯🇵'),
  Country(name: 'Australia', code: 'AU', flag: '🇦🇺'),
];

class CountrySelector extends StatelessWidget {
  const CountrySelector({
    required this.selectedCountry,
    required this.onCountrySelected,
    this.hintText = 'Select country',
    this.countries = kDefaultCountries,
    super.key,
  });

  final Country? selectedCountry;
  final ValueChanged<Country> onCountrySelected;
  final String hintText;
  final List<Country> countries;

  Future<void> _showCountryPicker(BuildContext context) async {
    final Country? result = await showModalBottomSheet<Country>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) => _CountryPickerBottomSheet(
        countries: countries,
        selectedCountry: selectedCountry,
      ),
    );

    if (result != null) {
      onCountrySelected(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors colors = context.colors;

    final bool hasSelection = selectedCountry != null;
    final Color borderColor = colors.gray200;

    return GestureDetector(
      onTap: () => _showCountryPicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: <Widget>[
            PhosphorIcon(
              PhosphorIconsBold.globe,
              color: colors.gray400,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                hasSelection ? selectedCountry!.name : hintText,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: hasSelection ? colors.textPrimary : colors.gray400,
                  fontWeight: hasSelection ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: colors.gray400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
