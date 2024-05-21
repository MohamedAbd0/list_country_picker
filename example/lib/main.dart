import 'package:flutter/material.dart';
import 'package:list_country_picker/list_country_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Country? _country;

  String selectedLang = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Country Piker"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: ['ar', 'en', 'fr']
                  .map((e) => Expanded(
                          child: GestureDetector(
                        onTap: () {
                          selectedLang = e;
                          _country = null;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: selectedLang == e
                                ? Colors.green
                                : Colors.green.withOpacity(0.1),
                          ),
                          child: Text(
                            e.toString(),
                            textScaleFactor: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )))
                  .toList(),
            ),

            // Arabic
            if (selectedLang == 'ar')
              ListTile(
                title: Text(_country?.name ?? 'إختر الدوله'),
                trailing: ListCountryPiker(
                  //initialCountryCode: "20",
                  dialogTitle: 'إختر الدوله',
                  locale: const Locale('ar'),
                  onCountryChanged: (value) {
                    print(value);
                    setState(() {
                      _country = value;
                    });
                  },
                  child: const Icon(Icons.arrow_drop_down),
                ),
              ),

            //English
            if (selectedLang == 'en')
              ListTile(
                title: Text(_country?.name ?? 'Select country'),
                trailing: ListCountryPiker(
                  locale: const Locale('en'),
                  onCountryChanged: (value) {
                    setState(() {
                      _country = value;
                    });
                  },
                  child: const Icon(Icons.arrow_drop_down),
                ),
              ),

            // French
            if (selectedLang == 'fr')
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
          ],
        ),
      ),
    );
  }
}
