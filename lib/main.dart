import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application
        primarySwatch: Colors.blue,
      ),
      //Adjust the name of the application here
      home: MyHomePage(title: 'CIS 3334 Tip Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//Our code goes here
class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values.
  //     _counter++;
  //   });
  // }

  //Declare and Initialize textField Controller, connection to the widget
  final billTextField = TextEditingController();

  //Local Variables to determine the tip and total bill
  bool isSwitched = false;
  double _amount = 0;
  double _tipPercent = 0;
  double _totalTip = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(
      appBar: AppBar(

        // Use the title declared above in the application scaffold
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tip Calculator',
              //Increase the font size of the text
              style: Theme.of(context).textTheme.headline4,
               //TextStyle(
                //color: Colors.cyan,
              //),
              ),
            SizedBox(height: 50),
            Text(
              'Bill Amount:',
            ),
            TextField(
              controller: billTextField,
            ),
            Row(
              children: [
                Switch(
                  //Set up the switch button
                    value: isSwitched,
                    onChanged: (value){
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    }
                ),
                Text("Great Service?"),
              ],
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    //Set the amount to the number entered in the controller
                    _amount = double.parse(billTextField.text);
                    //Determine the tip percentage
                  if(isSwitched == true){
                    _tipPercent = .20;
                  }
                  else{
                    _tipPercent = .15;
                  }
                  //Calculate the top tip
                    _totalTip = _amount * _tipPercent;

                  });

                },
                child: Text("Calculate Tip")),
            SizedBox(height: 50),
            Text(
              'Total Tip: $_totalTip'
            ),

          ],
        ),
      ),
    );
  }
}
