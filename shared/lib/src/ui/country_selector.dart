import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart'
    show
        Border,
        BorderRadius,
        BoxConstraints,
        BoxDecoration,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Color,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        FontWeight,
        GestureDetector,
        Icon,
        Icons,
        InkWell,
        ListTile,
        ListView,
        MainAxisSize,
        MediaQuery,
        Navigator,
        Padding,
        Radius,
        RoundedRectangleBorder,
        Row,
        SafeArea,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Theme,
        ThemeData,
        ValueChanged,
        Widget,
        showModalBottomSheet;
import 'package:phosphor_flutter/phosphor_flutter.dart'
    show PhosphorIcon, PhosphorIconsBold;

/// A country model for selection
class Country {
  const Country({
    required this.name,
    required this.code,
    required this.flag,
  });

  final String name;
  final String code;
  final String flag;
}

// TODO(me): Replace with API call to fetch countries.
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
    final LightColors colors = LightColors();

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

class _CountryPickerBottomSheet extends StatelessWidget {
  const _CountryPickerBottomSheet({
    required this.countries,
    this.selectedCountry,
  });

  final List<Country> countries;
  final Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LightColors colors = LightColors();

    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.gray300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Select Country',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Country list
            Expanded(
              child: countries.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(color: colors.primary),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: countries.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Country country = countries[index];
                        final bool isSelected =
                            selectedCountry?.code == country.code;

                        return InkWell(
                          onTap: () => Navigator.of(context).pop(country),
                          child: ListTile(
                            leading: Text(
                              country.flag,
                              style: const TextStyle(fontSize: 24),
                            ),
                            title: Text(
                              country.name,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colors.textPrimary,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                            trailing: isSelected
                                ? PhosphorIcon(
                                    PhosphorIconsBold.check,
                                    color: colors.primary,
                                    size: 20,
                                  )
                                : null,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
