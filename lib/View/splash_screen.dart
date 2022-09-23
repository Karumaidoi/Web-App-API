// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:webapp/API%20service/signup.dart';
import 'package:webapp/View/table_users.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String email = '';
  String phone = '';
  String name = '';
  String address = '';
  bool? success;
  bool showSnack = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Webtrick'),
        leading: const Icon(CupertinoIcons.tv_music_note_fill),
        actions: [
          Chip(
              label: Text(
            'Sign Up',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TableScreen();
              }));
            },
            child: Chip(
                label: Text(
              'Table',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            success == false && showSnack == true
                ? Container(
                    // padding: const EdgeInsets.all(20),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      'Submit failed 😡',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  )
                : Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          success == true ? Colors.green : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      success == true ? 'Submit successful 😁' : " ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text('Create an account with Webtrick'),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: 300,
                    child: CupertinoTextField(
                      placeholder: 'Enter Full Name',
                      onChanged: ((value) {
                        setState(() {
                          name = value;
                        });
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: 300,
                    child: CupertinoTextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      placeholder: 'Enter Email address',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: 300,
                    child: CupertinoTextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() {
                          phone = val;
                        });
                      },
                      placeholder: 'Enter phone number',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: 300,
                    child: CupertinoTextField(
                      keyboardType: TextInputType.text,
                      onChanged: (val) {
                        setState(() {
                          address = val;
                        });
                      },
                      placeholder: 'Enter address',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          var res = await APIservice.postData(
                              name, email, phone, address);
                          setState(() {
                            showSnack = true;
                          });
                          if (res.statusCode != 200) {
                            setState(() {
                              success = false;
                            });
                          } else {
                            setState(() {
                              success = true;
                            });
                          }
                        },
                        child: Text('Submit')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
