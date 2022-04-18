import 'package:flutter/material.dart';

import './Home.dart';
import './HomePage.dart';


//Package importation
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: "Weather Application",
    home: HomePage(),
  ));
}
