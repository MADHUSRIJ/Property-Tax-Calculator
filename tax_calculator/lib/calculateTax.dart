import 'package:flutter/material.dart';

class calculateTax extends StatefulWidget {
  final String dist, zone, age, type, occ, area;
  const calculateTax(
      this.dist, this.zone, this.age, this.type, this.occ, this.area);

  @override
  _calculateTaxState createState() =>
      _calculateTaxState(dist, zone, age, type, occ, area);
}

class _calculateTaxState extends State<calculateTax> {
  String? dist, zone, age, type, occ, area;

  _calculateTaxState(String text1, String text2, String text3, String text4,
      String text5, String text6) {
    this.dist = text1;
    this.zone = text2;
    this.age = text3;
    this.type = text4;
    this.occ = text5;
    this.area = text6;
  }

  double tR = 0;
  double MRV = 0;
  double ARV = 0;
  double PV = 0;
  double BV = 0;
  double MBV = 0;
  double Basic = 0;
  double disAge = 0;
  double disType = 0;
  double AV = 0;
  double GT = 0;
  double LC = 0;
  double ET = 0;
  double PT = 0;
  double Penalty = 0;
  double TT = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double a = double.parse(area.toString());
    h /= 100;
    switch (zone!) {
      case "A ZONE":
        {
          tR = 1.0;
        }

        break;
      case "B ZONE":
        {
          tR = 0.8;
        }

        break;
      case "C ZONE":
        {
          tR = 0.6;
        }

        break;
      default:
        tR = 0;
    }

    MRV = tR * a;
    ARV = MRV * 12;
    PV = ARV * (1 / 6);
    BV = ARV - PV;
    MBV = BV / 10;
    Basic = ARV - MBV;

    switch (age!) {
      case "Below 5 Years":
        {
          disAge = 0;
        }

        break;
      case "5 To 15 Years":
        {
          disAge = Basic / 10;
        }

        break;
      case "15 To 25 Years":
        {
          disAge = Basic / 15;
        }

        break;
      case "Above 25 Years":
        {
          disAge = Basic / 20;
        }

        break;
      default:
    }

    switch (type!) {
      case "Rcc Roof":
        {
          disType = Basic / 1;
        }

        break;

      case "Thatched":
        {
          disType = Basic / 4;
        }

        break;

      case "Tiled":
        {
          disType = Basic / 6;
        }

        break;

      case "Madras Terrace":
        {
          disType = Basic / 5;
        }

        break;

      case "Zinc Sheet":
        {
          disType = Basic / 7;
        }

        break;
      default:
    }

    AV = (Basic - (disAge + disType));
    GT = AV / 10;
    LC = GT / 10;
    ET = 0;
    PT = GT + LC + ET;
    Penalty = 0;
    TT = PT + Penalty;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              "assets/prop.png",
              height: 2 * h,
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: Image.asset("assets/1.jfif", fit: BoxFit.fill),
                    height: h * 30,
                    width: MediaQuery.of(context).size.width - 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: h * 100,
                    width: MediaQuery.of(context).size.width - 20,
                    // decoration: BoxDecoration(
                    //     border: Border.all(width: 2, color: Colors.black12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h * 2,
                            ),
                            Container(
                              child: Text(
                                "PROPERTY DETAILS",
                                style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: h * 2,
                            ),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "TOTAL AREA                           ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    area!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "TAX RATE                                ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    tR.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "MONTHLY RENTAL VALUE      ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    MRV.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "ANNUAL RENTAL VALUE ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    ARV.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "BUILDING VALUE                   ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    BV.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "BASIC VALUE                          ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    Basic.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "BUILDING AGE DISCOUNT    ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    disAge.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "BUILDING TYPE DISCOUNT  ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    disType.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Divider(
                              height: h * 2,
                              color: Colors.black,
                            ),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "ANNUAL VALUE",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                  child: Text(
                                    AV.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "GENERAL TAX",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    GT.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "LIBRARY CESS",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    LC.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "EDUCATIONAL TAX",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    ET.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "PROPERTY TAX",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    PT.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "PENALTY",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )),
                                Expanded(
                                  child: Text(
                                    Penalty.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                            Divider(
                              height: h * 2,
                              color: Colors.black,
                            ),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "TOTAL TAX",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                  child: Text(
                                    TT.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                      width: MediaQuery.of(context).size.width - 250,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.share),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Share",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
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
