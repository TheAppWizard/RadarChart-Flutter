import 'package:flutter/material.dart';
import 'package:radarchart/core/line_dot.dart';
import 'package:radarchart/core/radar_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _valueA = 6;
  double _valueB = 6;
  double _valueC = 6;



  void _incrementA() {
    setState(() {
      _valueA++;
    });
  }
  void _decrementA() {
    setState(() {
      _valueA--;
    });
  }

  void _incrementB() {
    setState(() {
      _valueB++;
    });
  }
  void _decrementB() {
    setState(() {
      _valueB--;
    });
  }


  void _incrementC() {
    setState(() {
      _valueC++;
    });
  }
  void _decrementC() {
    setState(() {
      _valueC--;
    });
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:    Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadarChart(
                data: [3, 3, 3],
                labels: ['A', 'B', 'C'],
                maxValues: [_valueA, _valueB, _valueC],
                designInterval: 20,
              ),




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [



                 Container(
                   color: Colors.red.withOpacity(0.2),
                   child: Row(
                                   children: [
                    const Text("A",style: TextStyle(fontSize: 20),),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: _incrementA,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _decrementA,
                    ),
                   
                   
                                   ],
                   
                   
                                 ),
                 ),


                Container(
                  color: Colors.blue.withOpacity(0.2),
                  child: Row(
                    children: [
                      const Text("B",style: TextStyle(fontSize: 20),),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: _incrementB,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _decrementB,
                      ),
                    ],
                  ),
                ),

                Container(
                  color: Colors.green.withOpacity(0.2),
                  child: Row(
                    children: [
                      const Text("C",style: TextStyle(fontSize: 20),),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: _incrementC,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _decrementC,
                      ),
                    ],
                  ),
                )
            ],)
            ],
          ),
        ),

        // body: Center(
        //   child: LineWithDot(),
        // ),
      )
    );
  }
}


