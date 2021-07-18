import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'TAMBOLA GAME SCREEN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  bool _hasBeenPressed = false;

  Widget build(BuildContext context) {
    List<Widget> myRowChildren = [];
    List<List<Widget>> numbers = [];
    List<Widget> columnNumbers = [];
    int z = 0;
    for (int i = 1; i <= 9; i++) {
      int maxColNr = 10;
      for (int y = 1; y <= maxColNr; y++) {
        int currentNumber = z + y; // 0,1,2,3,4,5,6,7,8,9,10, 10,11, 12, 13,14
        columnNumbers.add(Container(
          height: 40,
          width: 35,
          //color: _hasBeenPressed ? Colors.black : Colors.greenAccent,
          child: TextButton(
              child: Text('$currentNumber'),
              style: TextButton.styleFrom(
                primary: _hasBeenPressed ? Colors.black : Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  _hasBeenPressed = !_hasBeenPressed;
                  // _hasBeenPressed = false;
                });
              }),
        ));
      }
      z += maxColNr;
      numbers.add(columnNumbers);
      columnNumbers = [];
    }

    myRowChildren = numbers
        .map(
          (columns) => Card(
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.vertical,

              children: columns.map((n) {
                return Container(
                  child: n,
                );
              }).toList(),
            ),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: myRowChildren,
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
