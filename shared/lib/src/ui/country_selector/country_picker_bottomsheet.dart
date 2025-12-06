part of 'country_selector.dart';

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
    final AppColors colors = context.colors;

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
                            leading: country.flag != null
                                ? Image.network(
                                    country.flag!,
                                    width: 24,
                                    height: 24,
                                  )
                                : null,
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
