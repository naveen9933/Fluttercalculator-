import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1=0,num2=0,sum=0;
  String op="Output:";
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  void doAddition(){
    setState(() {
      num1=int.parse(t1.text);
      num2=int.parse(t2.text);
      op="Output:";
      sum=num1+num2;
    });
  }
  void doSubtraction(){
    setState(() {
      num1=int.parse(t1.text);
      num2=int.parse(t2.text);
      op="Output:";
      sum=num1-num2;
    });
  }
  void doMultiplication(){
    setState(() {
      num1=int.parse(t1.text);
      num2=int.parse(t2.text);
      op="Output:";
      sum=num1*num2;
    });
  }
  void doDivision(){
    if(int.parse(t2.text)==0){
      setState(() {
        sum=0;
        op="Invalid == DivisionByZero";
      });
    }
    else {
      setState(() {
        num1 = int.parse(t1.text);
        num2 = int.parse(t2.text);
        op="Output:";
        sum = num1 ~/ num2;
      });
    }
  }
  void doClear(){
    setState(() {
      num1=0;
      num2=0;
      t1.text="";
      t2.text="";
      op="Output:";
      sum=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Text(
              op+"$sum",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Number 1"
              ),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Number 2"
              ),
              controller: t2,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    onPressed: doAddition,
                    color: Colors.greenAccent,
                    child: Text("+"),
                ),
                MaterialButton(
                  onPressed: doSubtraction,
                  color: Colors.greenAccent,
                  child: Text("-"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: doMultiplication,
                  color: Colors.greenAccent,
                  child: Text("*"),
                ),
                MaterialButton(
                  onPressed: doDivision,
                  color: Colors.greenAccent,
                  child: Text("/"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: doClear,
                  color: Colors.greenAccent,
                  child: Text("Clear"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

