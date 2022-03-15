import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: AgeCalculator(),));
}

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  DateTime now= DateTime.now();
  late DateTime pickedDate;
  String presentDate= "";
  String birthDate="";
  int day=0, month=0, year=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presentDate= DateFormat("dd/MM/yyyy").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Age Calculator"),),
      body: Container(
        height: Size.infinite.height,
        width: Size.infinite.width,
        margin: EdgeInsets.all(30),
        child: ListView(
          children: [
            Image.network("https://www.calculatorall.com/images/Age-Calculator2.jpg", height: 200,width: 300, fit: BoxFit.fill,),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Todays Date : ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),),
                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.calendar_today), label: Text(presentDate, style: TextStyle(fontSize: 24),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Date of Birth : ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),),
                ElevatedButton.icon(onPressed: () async {
                  pickedDate = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1971),
                    lastDate: DateTime.now(),
                    initialDatePickerMode: DatePickerMode.day,
                  ))!;
                  setState(() {
                    birthDate= DateFormat("dd/MM/yyyy").format(pickedDate);
                  });
                }, icon: Icon(Icons.calendar_today), label: Text(birthDate, style: TextStyle(fontSize: 24),)),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        day= now.difference(pickedDate).inDays;
                        year= (day/365).toInt();
                        month= year*12;
                      });
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        day=0;
                        month=0;
                        year=0;
                        birthDate="";
                      });
                    },
                    child: Text(
                      "Clear",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ],
            ),
            SizedBox(height: 30,),
            Text("Day :  $day  Month :  $month  Year :  $year  ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
