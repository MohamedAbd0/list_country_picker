// ignore_for_file: library_private_types_in_public_api

library list_country_picker;

import 'package:flutter/material.dart';
import 'dialog/country_picker_dialog.dart';
import 'helper/countries.dart';
export 'helper/countries.dart';

class ListCountryPiker extends StatefulWidget {
  /// The widget below this widget in the tree.
  ///
  final Widget child;

  /// 2 letter ISO Code or country dial code.
  ///
  /// ```dart
  /// initialCountryCode: 'EG', // Egypt
  /// initialCountryCode: '+20', // Egypt code
  /// ```
  final String? initialCountryCode;

  /// List of 2 Letter ISO Codes of countries to show. Defaults to showing the inbuilt list of all countries.
  final List<String>? countries;

  /// Optional set of styles to allow for customizing the country search
  /// & pick dialog
  final InputDecoration? searchFieldInputDecoration;

  /// Localalization.
  ///
  /// Default is Locale('en','')
  final Locale locale;

  /// Message to be displayed on dialog title
  ///
  /// Default value is `Select Country`.
  final String? dialogTitle;

  /// TextStyle of TextFormField when search
  ///
  /// Default value is null.
  final TextStyle? searchTextStyle;

  /// on Country Changed
  ///
  /// to return country are selected
  final ValueChanged<Country> onCountryChanged;

  const ListCountryPiker({
    super.key,
    required this.child,
    required this.onCountryChanged,
    this.initialCountryCode,
    this.locale = const Locale('en', ''),
    this.countries,
    this.dialogTitle = "Select Country",
    this.searchFieldInputDecoration,
    this.searchTextStyle,
  });

  @override
  _ListCountryPikerState createState() => _ListCountryPikerState();
}

class _ListCountryPikerState extends State<ListCountryPiker> {
  late List<Country> _countryList;
  late List<Country> filteredCountries;

  @override
  void initState() {
    CountriesHelper.init(widget.locale.languageCode.toLowerCase());

    super.initState();

    _countryList = widget.countries == null
        ? countries
        : countries
            .where((country) => widget.countries!.contains(country.code))
            .toList();

    final List<Country> unSortcountryList = [..._countryList];
    unSortcountryList.sort((a, b) => a.name.compareTo(b.name));

    _countryList = unSortcountryList;
    filteredCountries = _countryList;

    if (widget.initialCountryCode != null &&
        _countryList
            .map((e) => e.code.toString())
            .toList()
            .contains(widget.initialCountryCode)) {
      Future.delayed(Duration.zero, () {
        widget.onCountryChanged(_countryList.firstWhere(
          (element) => element.code == widget.initialCountryCode,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CountriesHelper.init(widget.locale.languageCode.toLowerCase());

    return InkWell(
      onTap: _changeCountry,
      child: widget.child,
    );
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => CountryPickerDialog(
          searchFieldInputDecoration: widget.searchFieldInputDecoration,
          filteredCountries: filteredCountries,
          countryList: _countryList,
          locale: widget.locale,
          dialogTitle: widget.dialogTitle!,
          searchTextStyle: widget.searchTextStyle,
          onCountryChanged: (Country country) {
            setState(() {
              widget.onCountryChanged(country);
            });
          },
        ),
      ),
    );
    if (mounted) setState(() {});
  }
}
