part of 'country_selector.dart';

class _CountryPickerBottomSheet extends StatelessWidget {
  const _CountryPickerBottomSheet();

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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _SearchTextField(
                onChanged: (String value) =>
                    context.read<CountrySearchCubit>().search(value),
                onClear: () => context.read<CountrySearchCubit>().clearSearch(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<CountrySearchCubit, CountrySearchState>(
                builder: (BuildContext context, CountrySearchState state) {
                  if (state.allCountries.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(color: colors.primary),
                    );
                  }

                  if (state.isEmpty) {
                    return _EmptySearchState(query: state.query);
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.filteredCountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Country country = state.filteredCountries[index];
                      final bool isSelected =
                          state.selectedCountry?.code == country.code;

                      return InkWell(
                        onTap: () => Navigator.of(context).pop(country),
                        child: ListTile(
                          leading: country.flag != null
                              ? CachedNetworkImage(
                                  imageUrl: country.flag!,
                                  width: 24,
                                  height: 24,
                                  placeholder:
                                      (BuildContext context, String url) =>
                                          SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: colors.primary,
                                    ),
                                  ),
                                  errorWidget: (BuildContext context,
                                          String url, Object error) =>
                                      const SizedBox.shrink(),
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

class _SearchTextField extends StatefulWidget {
  const _SearchTextField({
    required this.onChanged,
    required this.onClear,
  });

  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  State<_SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<_SearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleClear() {
    _controller.clear();
    widget.onClear();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors colors = context.colors;

    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: 'Search country',
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.gray400,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: PhosphorIcon(
          PhosphorIconsBold.magnifyingGlass,
          color: colors.gray400,
          size: 20,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (BuildContext context, TextEditingValue value, _) {
            if (value.text.isEmpty) {
              return const SizedBox.shrink();
            }
            return GestureDetector(
              onTap: _handleClear,
              child: PhosphorIcon(
                PhosphorIconsBold.x,
                color: colors.gray400,
                size: 20,
              ),
            );
          },
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),
        filled: true,
        fillColor: colors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.gray200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.gray200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.primary),
        ),
      ),
    );
  }
}

class _EmptySearchState extends StatelessWidget {
  const _EmptySearchState({required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors colors = context.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(
              PhosphorIconsBold.magnifyingGlass,
              color: colors.gray300,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'No countries found',
              style: theme.textTheme.titleSmall?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No results for "$query".\nTry a different search term.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.gray400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
