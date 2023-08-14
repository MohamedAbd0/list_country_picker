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
            // Arabic

            ListTile(
              title: Text(_country?.name ?? 'إختر الدوله'),
              trailing: ListCountryPiker(
                initialCountryCode: "20",
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

            // French
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
