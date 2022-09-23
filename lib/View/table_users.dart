import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webapp/API%20service/signup.dart';

import '../model/data_model.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  late Future<List<User>> myData;

  @override
  void initState() {
    myData = getData();
    print(myData);
    super.initState();
  }

  Future<List<User>> getData() async {
    return await APIservice.getData();
  }

  @override
  Widget build(BuildContext context) {
    // runs every 5 second
    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        myData = getData();
      });
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Webtrick'),
        leading: const Icon(CupertinoIcons.tv_music_note_fill),
        actions: [],
      ),
      body: FutureBuilder<List<User>>(
          future: myData,
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(snapshot.data![index].id.toString()),
                    title: Text(snapshot.data![index].message),
                    subtitle: Text(snapshot.data![index].age.toString()),
                    trailing: GestureDetector(
                        onTap: () {}, child: const Chip(label: Text("Edit"))),
                  );
                });
          })),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Copyright 2022. All Rights Reserved',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
