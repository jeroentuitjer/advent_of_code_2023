import 'package:advent_of_code/model/elf_with_calories.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Advent Of Code'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ElfWithCalories elfWithMostCalories;
  late final List<ElfWithCalories> elvesWithCalories;
  late final int firstBatch;
  late final int secondBatch;
  late final int thirdBatch;
  late final int fourthBatch;
  late final int fifthBatch;

  @override
  void initState() {
    elvesWithCalories = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int firstBatch = 1000 + 2000 + 3000;
    int secondBatch = 4000;
    int thirdBatch = 5000 + 6000;
    int fourthBatch = 7000 + 8000 + 9000;
    int fifthBatch = 100000;
    var firstElf = ElfWithCalories(name: 'first', calories: firstBatch);
    var secondElf = ElfWithCalories(name: 'second', calories: secondBatch);
    var thirdElf = ElfWithCalories(name: 'third', calories: thirdBatch);
    var fourthElf = ElfWithCalories(name: 'fourth', calories: fourthBatch);
    var fifthElf = ElfWithCalories(name: 'fifth', calories: fifthBatch);

    elvesWithCalories
        .addAll([firstElf, secondElf, thirdElf, fourthElf, fifthElf]);

    elfWithMostCalories = elvesWithCalories.reduce((value, element) =>
        value.calories > element.calories ? value : element);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Elf with the most calories is: ${elfWithMostCalories.name}',
            ),
            Text(
              'With ${elfWithMostCalories.calories} calories',
            ),
          ],
        ),
      ),
    );
  }
}
