import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double rating = 1.0;
  double score = 0.0;
  int count = 0;
  List<String> question = [
    'How fun is the show?',
    'How is our sanitation?',
    'How was the Sound Quality?',
    'How was the lighting?',
    'How do you rate our service?',
    'How was your overall experience?'
  ];

  Color color = Colors.black;
  String get resultText {
    String text;
    if (score <= 10) {
      text = "Sorry for the inconvenience";
      color = Colors.red;
    } else if (score <= 20) {
      text = "Hope we serve you better next time";
      color = Colors.yellow;
    } else {
      text = "We hope you come back next time";
      color = Colors.green;
    }

    return text;
  }

  void reset() {
    setState(() {
      score = 0.0;
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Feedback'),
          centerTitle: true,
        ),
        body: count < 6
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        question[count],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[750],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              rating.toInt().toString(),
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              value: rating,
                              onChanged: (newRating) {
                                setState(() {
                                  rating = newRating;
                                });
                              },
                              divisions: 4,
                              min: 1,
                              max: 5,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            score += rating;
                            count++;
                            rating = 1.0;
                          });
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                          fontSize: 24,
                          color: color,
                        ),
                      ),
                      SizedBox(height: 20),
                      IconButton(
                          onPressed: reset,
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.blue,
                            size: 40.0,
                          ))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
