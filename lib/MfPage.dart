import 'package:bmi_plus/color.dart';
import 'package:bmi_plus/resultPage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MfPage extends StatefulWidget {
  bool isMale = true;
  MfPage({super.key, required this.isMale});

  @override
  State<MfPage> createState() => _MfPageState();
}

class _MfPageState extends State<MfPage> {
  int Weight = 25;
  int height = 100;

  @override
  Widget build(BuildContext context) {
    Color kMainColor = widget.isMale ? cGrenn : cPink;
    return Scaffold(
      body: Stack(
        //hydi bt3ni ennu fini kaddes 2eshya fo2 ba3da y3ni k2nnu saf7a fo2 saf7a
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 36,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: kMainColor,
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              "BMI",
                              style: TextStyle(color: kMainColor, fontSize: 25),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.isMale
                                    ? "Male".toUpperCase()
                                    : "female".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                widget.isMale ? Icons.male : Icons.female,
                                color: kMainColor,
                                size: 90,
                              ),
                              Text(
                                "Weight [Kg]",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics:
                                BouncingScrollPhysics(), //hay krmel list view ma t3tini mn fa2 bas t5las l list hayda l shakl nsf de2ra ennu 5lset l list
                            itemCount: 40,
                            itemBuilder: (context, index) {
                              int i = (index + 5) * 5;
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Weight = i;
                                      //print(height);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    child: Center(
                                      child: Text(
                                        "$i",
                                        style: TextStyle(
                                          fontSize: Weight == i ? 30 : 20,
                                          color: Weight == i
                                              ? kMainColor
                                              : Colors.black,
                                        ),
                                      ),
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
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(color: kMainColor),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 48,
                        ),
                        Text(
                          "Height \n (Cm)",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics:
                                BouncingScrollPhysics(), //hay krmel list view ma t3tini mn fa2 bas t5las l list hayda l shakl nsf de2ra ennu 5lset l list
                            itemCount: 45,
                            itemBuilder: (context, index) {
                              int i = (index + 20) * 5;
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        height = i;
                                        //print(height);
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: height == i
                                          ? Colors.white
                                          : kMainColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "$i",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: height == i
                                                ? kMainColor
                                                : Colors.white),
                                      ),
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
              ),
            ],
          ),
          Positioned(
            //hon bkbos ctrl + space --> bytl3li bottom left top right ya3ni wen badde yeha 3al screen

            left: MediaQuery.sizeOf(context).width * 2 / 3 - 80,

            bottom: 10,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => resultPage(
                        height: height,
                        weight: Weight,
                        isMale: widget.isMale,
                      ),
                    ),
                  );
                });
              },
              child: Row(
                children: [
                  Text("go to result".toUpperCase(),style: TextStyle(fontSize: 16 ,color: kMainColor),),
                  Icon(Icons.arrow_forward_rounded, color: kMainColor,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
