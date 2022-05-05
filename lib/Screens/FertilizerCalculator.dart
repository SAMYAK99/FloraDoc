import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih/utils/navigationDrawer.dart';

class FertilizerCalculator extends StatefulWidget {
  @override
  _FertilizerCalculatorState createState() => _FertilizerCalculatorState();
}

var unit = 1;
var kg = "kg";

class _FertilizerCalculatorState extends State<FertilizerCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Fertilizer Calculator',
        ),
      ),
      backgroundColor: Color(0xffECF4F3),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.add_circle,
                              size: 50,
                            ),
                            onTap: () {
                              setState(() {
                                unit += 1;
                              });
                            },
                          ),
                          Text(
                            unit.toString(),
                            style: TextStyle(fontSize: 30),
                          ),
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.remove_circle),
                            iconSize: 50,
                            onPressed: () {
                              setState(() {
                                if (unit > 1) {
                                  unit -= 1;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                kg = "kg";
                                unit = 1;
                              });
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    50.0, 15.0, 50.0, 15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Acre",
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: kg == "kg"
                                      ? Color(0xffFE7E67)
                                      : Colors.black38,
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                kg = "g";
                                unit = 500;
                              });
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    50.0, 15.0, 50.0, 15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Sq.ft",
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: kg == "g"
                                      ? Color(0xffFE7E67)
                                      : Colors.black38,
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Choose your Preferred Combination",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "DAP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              kg == "kg"
                                  ? Text(
                                      acreCalculate1(unit)[0]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      sqftCalculate1(unit)[0]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "MOP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              kg == "kg"
                                  ? Text(
                                      acreCalculate1(unit)[1]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      sqftCalculate1(unit)[1]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Urea",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              kg == "kg"
                                  ? Text(
                                      acreCalculate1(unit)[2]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      sqftCalculate1(unit)[2]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "SSP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              kg == "kg"
                                  ? Text(
                                      acreCalculate2(unit)[0]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      sqftCalculate2(unit)[0]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "MOP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              kg == "kg"
                                  ? Text(
                                      acreCalculate2(unit)[1]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      sqftCalculate2(unit)[1]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Urea",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              kg == "kg"
                                  ? Text(
                                      acreCalculate2(unit)[2]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      sqftCalculate2(unit)[2]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "10-26-26",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              kg == "kg"
                                  ? Text(
                                      acreCalculate3(unit)[0]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      sqftCalculate3(unit)[0]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Urea",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              kg == "kg"
                                  ? Text(
                                      acreCalculate3(unit)[1]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      sqftCalculate3(unit)[1]
                                              .toStringAsFixed(0) +
                                          " " +
                                          kg,
                                      style: TextStyle(fontSize: 20),
                                    )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

acreCalculate1(acre) {
  var dap = 53 * acre;
  var mop = 34 * acre;
  var urea = 81 * acre;

  return [dap, mop, urea];
}

acreCalculate2(acre) {
  var mop = 34 * acre;
  var ssp = 152 * acre;
  var urea = 101 * acre;

  return [ssp, mop, urea];
}

acreCalculate3(acre) {
  var t2626 = 81 * acre;
  var urea = 81 * acre;

  return [t2626, urea];
}

//in gram
sqftCalculate1(sqft) {
  var dap = 1.19 * sqft;
  var mop = 0.77 * sqft;
  var urea = 1.27 * sqft;

  return [dap, mop, urea];
}

sqftCalculate2(sqft) {
  var mop = 0.77 * sqft;
  var ssp = 3.48 * sqft;
  var urea = 1.76 * sqft;

  return [ssp, mop, urea];
}

sqftCalculate3(sqft) {
  var t2626 = 1.83 * sqft;
  var urea = 1.3 * sqft;

  return [t2626, urea];
}
