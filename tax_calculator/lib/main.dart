import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tax_calculator/calculateTax.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    h /= 100;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 18 * h,
              ),
              Container(
                child: Image.asset(
                  "assets/splash.jpg",
                  fit: BoxFit.cover,
                ),
                height: h * 50,
                width: h * 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _chosenDist = "Select Your District";
  String _chosenZone = "Select Your Zone";
  String _builAge = "Select Building Age";
  String _builType = "Select Building Type";
  String _Occup = "Select Occupancy";

  var _tc = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    h /= 100;
    w /= 100;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              "assets/prop.png",
              height: 2 * w,
            ),
          ),
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "PROPERTY TAX CALCULATOR",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "TAMILNADU",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Container(
                      height: h * 7,
                      width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "** ALL FIELDS ARE REQUIRED **",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: w * 4,
                                fontWeight: FontWeight.w500),
                          )),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: h * 60,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "DISTRICT           :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: Colors.grey.shade200)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: DropdownButton<String>(
                                        underline: Container(
                                            color: Colors.transparent),
                                        isExpanded: true,
                                        elevation: 0,
                                        value: _chosenDist,
                                        onChanged: (value) {
                                          setState(() {
                                            _chosenDist = value!;
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'Select Your District',
                                          'Ariyalur',
                                          'Chengalpattu',
                                          'Chennai',
                                          'Coimbatore',
                                          'Cuddalore',
                                          'Dharmapuri',
                                          'Dindigul',
                                          'Erode',
                                          'Kallakurichi',
                                          'Kanchipuram',
                                          'Kanyakumari',
                                          'Karur',
                                          'Krishnagiri',
                                          'Madurai',
                                          'Nagapattinam',
                                          'Namakkal',
                                          'Nilgiris',
                                          'Perambalur',
                                          'Pudukkottai',
                                          'Ramanathapuram',
                                          'Ranipet',
                                          'Salem',
                                          'Sivaganga',
                                          'Tenkasi',
                                          'Thanjavur',
                                          'Theni',
                                          'Thoothukudu',
                                          'Tirunelveli',
                                          'Thirupathur',
                                          'Tiruppur',
                                          'Tiruvallur',
                                          'Tiruvannamalai',
                                          'Tiruvarur',
                                          'Vellore',
                                          'Viluppuram',
                                          'Virudhunagar',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "ZONE                   :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: Colors.grey.shade200)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: DropdownButton<String>(
                                        underline: Container(
                                          color: Colors.transparent,
                                        ),
                                        isExpanded: true,
                                        focusColor: Colors.white,
                                        elevation: 2,
                                        value: _chosenZone,
                                        onChanged: (value) {
                                          setState(() {
                                            _chosenZone = value!;
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'Select Your Zone',
                                          'A ZONE',
                                          'B ZONE',
                                          'C ZONE',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "BUILDING AGE   :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: Colors.grey.shade200)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: DropdownButton<String>(
                                        underline: Container(
                                          color: Colors.transparent,
                                        ),
                                        isExpanded: true,
                                        focusColor: Colors.white,
                                        elevation: 2,
                                        value: _builAge,
                                        onChanged: (value) {
                                          setState(() {
                                            _builAge = value!;
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'Select Building Age',
                                          'Below 5 Years',
                                          '5 To 15 Years',
                                          '15 To 25 Years',
                                          'Above 25 Years',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "BUILDING TYPE :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: Colors.grey.shade200)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: DropdownButton<String>(
                                        underline: Container(
                                            color: Colors.transparent),
                                        isExpanded: true,
                                        focusColor: Colors.white,
                                        elevation: 2,
                                        value: _builType,
                                        onChanged: (value) {
                                          setState(() {
                                            _builType = value!;
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'Select Building Type',
                                          'Rcc Roof',
                                          'Thatched',
                                          'Tiled',
                                          'Madras Terrace',
                                          'Zinc Sheet',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "OCCUPANCY      :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: Colors.grey.shade200)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: DropdownButton<String>(
                                        underline: Container(
                                          color: Colors.transparent,
                                        ),
                                        isExpanded: true,
                                        focusColor: Colors.white,
                                        elevation: 2,
                                        value: _Occup,
                                        onChanged: (value) {
                                          setState(() {
                                            _Occup = value!;
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'Select Occupancy',
                                          'Own Residence',
                                          'Rent',
                                          'Industrial',
                                          'Commercial',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "TOTAL AREA       :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Area in Sq. Ft.",
                                          focusedBorder: InputBorder.none,
                                        ),
                                        controller: _tc,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      height: h * 7,
                      width: MediaQuery.of(context).size.width - 200,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextButton(
                            onPressed: () {
                              var route = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new calculateTax(_chosenDist, _chosenZone,
                                        _builAge, _builType, _Occup, _tc.text),
                              );
                              Navigator.of(context).push(route);
                            },
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange),
                                side: MaterialStateProperty.all(BorderSide(
                                    width: 1, color: Colors.orangeAccent)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 15))),
                          )),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
