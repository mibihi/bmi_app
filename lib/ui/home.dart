import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double inches=0.0;
  double result =0.0;
  double resultfinal=0.0;
  String _yourWeightStatus = "";
  void _calculateBmi() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      //inches = height*12;
      double weight = double.parse(_weightController.text);
      if((_ageController.text.isNotEmpty || age >0)&&
          (_heightController.text.isNotEmpty || inches >0 )&&(
          _weightController.text.isNotEmpty || weight >0 ) ){
        result = weight /(height * height) * 703;
        resultfinal = double.parse(result.toStringAsFixed(1));
        //status
        if(resultfinal < 18.5){
          _yourWeightStatus = "Underweight Eat More";
        } else if (resultfinal >= 18.5 && resultfinal < 24.9 ){
          _yourWeightStatus = "Normal BMI";
        } else if (resultfinal >= 25.0 && resultfinal < 29.9 ){
          _yourWeightStatus = "You are over weight eat less";
        } else if (resultfinal >= 30.0 ){
          _yourWeightStatus = "You are Obese Do something";
        }
      }
      else result= 0.0;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(2.0),
          children: <Widget>[
            Image.asset("images/bmilogo.png", width: 75.5, height: 85.0),
            Container(
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,
              margin: EdgeInsets.all(3.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    controller:_ageController ,
                    decoration: InputDecoration(
                      hintText: "eg. 34",
                      labelText: "Age",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _heightController,
                    decoration: InputDecoration(
                      hintText: "eg 6.4",
                      labelText: "Height in feet",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.directions_walk),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    decoration: InputDecoration(
                      hintText: "eg. 165 ",
                      labelText: "Weight in lbs",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.line_weight),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: _calculateBmi,
                      elevation: 5.2,
                      color: Colors.pink,
                      child: Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 16.9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                   Text(
                    "BMI : $result",
                    style: TextStyle(fontSize: 19.0, color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
                  ),
                Padding(padding: EdgeInsets.all(5.5)),
                Center(
                  child: Text(
                    "$_yourWeightStatus",
                    style: TextStyle(fontSize: 19.0, color: Colors.pink,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
