import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late Future<String> future1;
  late Future<String> future2;
  late Future<String> future3;

  @override
  void initState() {
    super.initState();
    future1 = fetchData1();
    future2 = fetchData2();
    future3 = fetchData3();
  }

  Future<String> fetchData1() async {
    const executeTimeSeconds = 2;
    await Future.delayed(const Duration(seconds: executeTimeSeconds));
    return "прошло ${executeTimeSeconds} сек";
  }

  Future<String> fetchData2() async {
    const executeTimeSeconds = 3;
    await Future.delayed(const Duration(seconds: executeTimeSeconds));
    return "прошло ${executeTimeSeconds} сек";
  }

  Future<String> fetchData3() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Второй экран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<String>(
              future: future1,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Задача 1 выполняется...');
                } else if (snapshot.hasError) {
                  return Text('Ошибка в задаче 1: ${snapshot.error}');
                } else {
                  return Text('Задача 1 завершена: ${snapshot.data}');
                }
              },
            ),
            FutureBuilder<String>(
              future: future2,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Задача 2 выполняется...');
                } else if (snapshot.hasError) {
                  return Text('Ошибка в задаче 2: ${snapshot.error}');
                } else {
                  return Text('Задача 2 завершена: ${snapshot.data}');
                }
              },
            ),
            FutureBuilder<String>(
              future: future3,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Задача 3 выполняется...');
                } else if (snapshot.hasError) {
                  return Text('Ошибка в задаче 3: ${snapshot.error}');
                } else {
                  return Text('Задача 3 завершена: ${snapshot.data}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
