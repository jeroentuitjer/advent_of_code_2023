import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  listOfElves();
}

listOfElves() async {
  String response = await rootBundle.loadString('assets/day_one_data.txt');

  final listOfStrings = response.split("\n\n");
  final calories = <int>[];
  for (int i = 0; i < listOfStrings.length; i++) {
    int elfCalories = 0;
    final elfCalorieList = listOfStrings[i].split('\n');
    for (int j = 0; j < elfCalorieList.length; j++) {
      elfCalories = elfCalories + int.parse(elfCalorieList[j]);
    }
    calories.add(elfCalories);
  }

  calories.sort();
  print('Elf with most alories${calories[calories.length - 1]}');
  print(
      '${calories[calories.length - 1] + calories[calories.length - 2] + calories[calories.length - 3]}');
}
