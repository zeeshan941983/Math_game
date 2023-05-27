import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../addition/buttons.dart';
import '../addition/result_msg.dart';

class multi extends StatefulWidget {
  multi({super.key});

  @override
  State<multi> createState() => _multiState();
}

class _multiState extends State<multi> {
  List<String> numberpad = [
    'C',
    'Del',
    '9',
    '8',
    '7',
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    '0',
    '=',
  ];
  int count = 0;
  int number1 = 10;
  int number2 = 10;
  String answer = '';

  void buttontapped(String Button) {
    setState(() {
      if (Button == '=') {
        checkresult();
      } else if (Button == 'C') {
        answer = '';
      } else if (Button == 'Del') {
        answer = answer.substring(0, answer.length - 1);
      } else if (answer.length < 3) {
        answer += Button;
      }
    });
  }

  void checkresult() {
    if (number1 * number2 == int.parse(answer)) {
      showDialog(
          context: context,
          builder: (context) {
            return result_msg(
                icon: Icons.arrow_forward, msg: "Correct", ontap: gottonext);
          });
      setState(() {
        count++;
      });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return result_msg(
                icon: Icons.rotate_left,
                msg: "Incorrect Try Again",
                ontap: tryagain);
          });
      if (count > 0) {
        setState(() {
          count--;
        });
      }
    }
  }

/////get random number
  var randomnumber = Random();
  /////for try again
  void tryagain() {
    Navigator.pop(context);
    setState(() {
      answer = '';
    });
  }

  //////for next
  void gottonext() {
    //////pop the dialog
    Navigator.pop(context);
    //////blank page
    setState(() {
      answer = '';
    });
    number1 = randomnumber.nextInt(9);
    number2 = randomnumber.nextInt(9);
    if (count > 10) {
      number1 = randomnumber.nextInt(99);
      number2 = randomnumber.nextInt(99);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.deepPurple[400],
          ),
          //////////screen
          Expanded(
              child: Container(
            color: Colors.deepPurple[300],
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Score = ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            count.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /////questions

                    Text(
                      number1.toString() + '*' + number2.toString() + '=',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            answer,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              ],
            ),
          )),
          ////////numberpad
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: numberpad.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: ((context, index) {
                      return button(
                        child: numberpad[index],
                        ontap: () => buttontapped(numberpad[index]),
                      );
                    })),
              )),
        ],
      ),
    );
  }
}
