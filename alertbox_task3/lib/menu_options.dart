import 'package:flutter/material.dart';
import 'dart:async';

class MenuOptions extends StatefulWidget {
  @override
  _MenuOptionsState createState() => _MenuOptionsState();
}

class _MenuOptionsState extends State<MenuOptions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 480,
      child: Column(
        children: [
          Container(
            height: 30,
            color: Colors.grey.shade200,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Ongoing Summary Generation',
                ),
                Tab(
                  text: 'Summary Generated',
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [FirstBox(), SecondBox()],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class FirstBox extends StatelessWidget {
  const FirstBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.ac_unit_outlined),
                  SizedBox(
                    width: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'India Vs New-Zealand',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      CustomStepper(),
                    ],
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.ac_unit_outlined),
                  SizedBox(
                    width: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'India Vs England',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      CustomStepper(),
                    ],
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.ac_unit_outlined),
                  SizedBox(
                    width: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'India Vs Australia',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      CustomStepper(),
                    ],
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}

class SecondBox extends StatelessWidget {
  const SecondBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.purple.shade100,
              child: DropdownButton<String>(
                value: 'Delete',
                isDense: true,
                dropdownColor: Colors.purple.shade100,
                style: TextStyle(color: Colors.purple.shade800),
                onChanged: (String? newValue) {},
                items: <String>['Delete'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  List<String> title = [
    '● Preparing Document',
    '● Organizing Information',
    '● Generating Summary',
  ];
  int currentStep = 0;
  double loadingProgress = 0.0;

  @override
  void initState() {
    super.initState();

    const double loadingStep = 0.1;
    const int loadingSteps = 10;
    const int loadingInterval = 500;

    int loadingCount = 0;

    // Start the timer to increment the loading progress gradually
    Timer.periodic(Duration(milliseconds: loadingInterval), (timer) {
      setState(() {
        loadingCount++;
        if (loadingCount >= loadingSteps) {
          if (currentStep < title.length - 1) {
            currentStep++;
            loadingCount = 0;
          } else {
            timer.cancel(); // Stop the timer when loading is complete
          }
        }

        loadingProgress = loadingCount * loadingStep;

        if (loadingProgress >= 1.0) {
          loadingProgress = 1.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = 550 * 0.02;

    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 250 * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              stepperTitle(0, titleFontSize),
              SizedBox(height: 2),
              SizedBox(width: 700 * 0.29, child: lineStepper(0))
            ],
          ),
          SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              stepperTitle(1, titleFontSize),
              SizedBox(height: 2),
              SizedBox(width: 700 * 0.29, child: lineStepper(1))
            ],
          ),
          SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              stepperTitle(2, titleFontSize),
              SizedBox(height: 2),
              SizedBox(width: 700 * 0.29, child: lineStepper(2))
            ],
          ),
        ],
      ),
    );
  }

  Widget stepperTitle(int index, double fontSize) {
    return Flexible(
      child: Text(
        title.elementAt(index),
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.purple.shade700,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget lineStepper(int index) {
    return Container(
      height: 10, // Adjust as needed
      color:
          index < currentStep ? Colors.purple.shade700 : Colors.purple.shade100,
      width: double.infinity,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: index == currentStep ? loadingProgress : 0.0,
        child: Container(
          color: Colors.purple.shade700,
        ),
      ),
    );
  }
}
