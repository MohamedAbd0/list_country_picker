# list_country_picker

ListCountryPiker is a package for customizable country selection with multi-language support like Arabic, English, and French.

[![Pub Version](https://img.shields.io/pub/v/list_country_picker?logo=flutter&style=for-the-badge)](https://pub.dev/packages/list_country_picker)

-----
![image](https://github.com/MohamedAbd0/list_country_picker/blob/main/cover.png)
![image](https://github.com/MohamedAbd0/list_country_picker/blob/main/screenshots/demo.gif)



Installation
-----
1. Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  list_country_picker: any
```

1. Get the package using your IDE's GUI or via command line with

```bash
$ pub get
```

1. Import the `list_country_picker.dart` file in your app

```dart
import 'package:list_country_picker/list_country_picker.dart';
```

Features
----
- Select country by name or code
- Support arabic & english & french 

Usage
-----
default widget
```dart
ListCountryPiker(
    onCountryChanged: (value) {
        setState(() {
            _country = value;
        });
    },
    child: const Icon(Icons.arrow_drop_down),
)
```
Arabic Example
```dart
ListTile(
    title: Text(_country?.name ?? 'إختر الدوله'),
    trailing: ListCountryPiker(
        dialogTitle: 'إختر الدوله',
        locale: const Locale('ar'),
        onCountryChanged: (value) {
             setState(() {
                _country = value;
            });
        },
        child: const Icon(Icons.arrow_drop_down),
    ),
),
```

English Example
```dart
            ListTile(
              title: Text(_country?.name ?? 'Select country'),
              trailing: ListCountryPiker(
                onCountryChanged: (value) {
                  setState(() {
                    _country = value;
                  });
                },
                child: const Icon(Icons.arrow_drop_down),
              ),
            ),
```

French Example
```dart
            ListTile(
              title: Text(_country?.name ?? 'Choisissez un pays'),
              trailing: ListCountryPiker(
                dialogTitle: 'Choisissez un pays',
                locale: const Locale('fr'),
                onCountryChanged: (value) {
                  setState(() {
                    _country = value;
                  });
                },
                child: const Icon(Icons.arrow_drop_down),
              ),
            ),
```

## Screenshots
![](https://github.com/MohamedAbd0/list_country_picker/blob/main/screenshots/demo.gif)
![](https://github.com/MohamedAbd0/list_country_picker/blob/main/screenshots/1.png)
![](https://github.com/MohamedAbd0/list_country_picker/blob/main/screenshots/2.png)
![](https://github.com/MohamedAbd0/list_country_picker/blob/main/screenshots/3.png)
## Contributions

Contributions of any kind are more than welcome! Feel free to fork and improve list_country_picker in any way you want, make a pull request, or open an issue.
