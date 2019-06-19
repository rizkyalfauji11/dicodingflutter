import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'model/FoodModel.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Foods",
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FoodModel foods;

  @override
  void initState() {
    super.initState();
    showingData();
  }

  Future<String> _loadData() async{
    print("Dadang Konelo");
    return await rootBundle.loadString('assets/data/meals.json');
  }

  Future showingData() async {
    print("Rizky Alfa Uji G");
    String jsonData = await _loadData();
    final response = json.decode(jsonData);
    foods = FoodModel.fromJson(response);
    print("Response: "+foods.toString());
    setState((){});
  }
  foodBody(ctx) => GridView.count(
      crossAxisCount: 2,
      children: foods.foods
          .map((row) => Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => FoodDetail(
                      food: row,
                    )));
          },
          child: Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(row.image),
                        fit: BoxFit.cover,
                      )),
                ),
                Text(
                  row.name,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      )).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foods"),

      ),

      body: foods == null ? Center(
        child: CircularProgressIndicator(),
      ) : foodBody(context),
    );

  }
}

class FoodDetail extends StatelessWidget{
  final FoodData food;
  FoodDetail({this.food});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

