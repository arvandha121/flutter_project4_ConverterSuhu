import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'flutter/result.dart';
import 'flutter/input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suhu Converter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'My App - Suhu Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = new TextEditingController();

  //Menentukan variabel input
  double input = 0;
  double result = 0;
  double celcius = 0;
  double kelvin = 0;
  double fahrenheit = 0;
  double reamur = 0;

  // Membuat variabel list dropdown suhu
  var listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropdown = "Kelvin";
  List<String> listHasil = [];
  final formKey = GlobalKey<FormState>();

  // Melakukan konversi
  konversi() {
    //dengan state
    setState(
      () {
        if (formKey.currentState!.validate()) {
          // ignore: avoid_print
          print(listHasil.length);
          input = double.parse(etInput.text);
          switch (selectedDropdown) {
            case "Kelvin":
              {
                // statements;
                result = input + 273;
                listHasil.add("Konversi dari input " +
                    "$input" +
                    " ke Kelvin adalah : " +
                    "$result");
              }
              break;

            case "Reamur":
              {
                //statements;
                result = input * 4 / 5;
                listHasil.add("Konversi dari input " +
                    "$input" +
                    " ke Reamur adalah : " +
                    "$result");
              }
              break;

            case "Fahrenheit":
              {
                //statements;
                result = 9 / 5 * input + 32;
                listHasil.add("Konversi dari input " +
                    "$input" +
                    " ke Fahrenheit adalah : " +
                    "$result");
                ;
              }
              break;
          }
        }
      },
    );
    // celcius = double.parse(etInput.text);
    // reamur = 4 / 5 * celcius;
    // fahrenheit = (9 / 5 * celcius) + 32;
    // kelvin = 273.15 + celcius;
  }

  // Membuat Dropdown values
  DropdownChanged(value) {
    setState(() {
      selectedDropdown = value.toString();
    });
    konversi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   controller: etInput,
                    //   decoration: InputDecoration(
                    //     hintText: "Masukkan nilai suhu",
                    //   ),
                    // ),
                    Form(
                      key: formKey,
                      child: Input(etInput: etInput),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        child: DropdownButton(
                          items: listSatuanSuhu.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: selectedDropdown,
                          onChanged: DropdownChanged,
                          isExpanded: true,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Result(
                          result: result,
                        ),
                      ],
                    ),
                    // Center(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: <Widget>[
                    //       Column(
                    //         children: <Widget>[
                    //           Text(
                    //             "Reamur",
                    //             style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Text(
                    //             "$reamur",
                    //             style: TextStyle(fontSize: 18),
                    //           ),
                    //         ],
                    //       ),
                    //       Column(
                    //         children: <Widget>[
                    //           Text(
                    //             "Fahrenheit",
                    //             style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Text(
                    //             "$fahrenheit",
                    //             style: TextStyle(fontSize: 18),
                    //           ),
                    //         ],
                    //       ),
                    //       Column(
                    //         children: <Widget>[
                    //           Text(
                    //             "Kelvin",
                    //             style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Text(
                    //             "$kelvin",
                    //             style: TextStyle(fontSize: 18),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 100),
                          ),
                          onPressed: konversi,
                          child: const Text(
                            'Konversi Suhu',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Result Riwayat Konversi Suhu",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    // TextButton(
                    //   onPressed: konversi,
                    //   child: Text(
                    //     'Konversi',
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listHasil.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            listHasil[index],
                            style: const TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
