import 'package:flutter/material.dart';
import './Home.dart';


class HomePage extends StatelessWidget {
  String userInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height / 2,
            width: MediaQuery
                .of(context)
                .size
                .width,
            // color: Colors.indigo,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Enter your city name: ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "City Name",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  onSubmitted: (userInput) {
                    print("User Input : $userInput");
                    // homeStateObj.country = userInput; // Passing the user input into the second screen
                  },
                ),
                ElevatedButton(onPressed: () {
                  // HomeState(userInput);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(),),
                  );},
                    child: Text("View City Details"))
              ], //children
            ),
          ),
        ],
      ),
    );
  }
}
