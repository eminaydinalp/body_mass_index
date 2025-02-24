import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  TextEditingController _heightController =  TextEditingController();

  TextEditingController _weightController =  TextEditingController();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Body Mass İndex"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _result.toStringAsFixed(2),
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                  label: Text("Your height"),
                  suffixText: "m",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                  label: Text("Your weight"),
                  suffixText: "kg",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: calculateBodyIndex,
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }

  void calculateBodyIndex() {
    String heightText = _heightController.text.trim();
    String weightText = _weightController.text.trim();

    try{
      double height = double.parse(heightText);
      double weight = double.parse(weightText);

      setState(() {
        _result = weight / (height * height);
      });
    }
    catch(e){
      print("Bir hata oluştu: ${e.toString()}");
    }
  }
}
