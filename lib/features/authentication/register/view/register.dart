// @dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:sqflite_database_example/features/authentication/login/views/login.dart';
import 'package:sqflite_database_example/features/constants/colors.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: secColor,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/logo.png'))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    child: TextFormField(
                      cursorHeight: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Invalid credentials';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),

                        filled: true,
                        fillColor: Colors.white,
                        // prefixIcon: Icon(
                        //   prefix,
                        //   color: Colors.black38,
                        // ),
                        border: new OutlineInputBorder(
                          // borderSide: BorderSid,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(200.0),
                          ),
                        ),
                        // prefixIconConstraints: BoxConstraints(
                        //     maxHeight: _sizeH * 0.1, minWidth: _sizeH * 0.08),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    child: TextFormField(
                      cursorHeight: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Invalid credentials';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),

                        filled: true,
                        fillColor: Colors.white,
                        // prefixIcon: Icon(
                        //   prefix,
                        //   color: Colors.black38,
                        // ),
                        border: new OutlineInputBorder(
                          // borderSide: BorderSid,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(200.0),
                          ),
                        ),
                        // prefixIconConstraints: BoxConstraints(
                        //     maxHeight: _sizeH * 0.1, minWidth: _sizeH * 0.08),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    child: TextFormField(
                      cursorHeight: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Invalid credentials';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'Address',
                        hintStyle: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),

                        filled: true,
                        fillColor: Colors.white,
                        // prefixIcon: Icon(
                        //   prefix,
                        //   color: Colors.black38,
                        // ),
                        border: new OutlineInputBorder(
                          // borderSide: BorderSid,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(200.0),
                          ),
                        ),
                        // prefixIconConstraints: BoxConstraints(
                        //     maxHeight: _sizeH * 0.1, minWidth: _sizeH * 0.08),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor, shadowColor: primaryColor),
                          onPressed: () => _selectDate(context),
                          child: Text('Select date'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(currentDate.toString()),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text('Select State'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text('Select Country'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: getImage,
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor, shadowColor: primaryColor),
                          child: Text('Tap to Upload a Picture')),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: image == null
                            ? Center(
                                child: Text('No image selected.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: secColor)))
                            : Image.file(
                                image,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    children: [Text('select gender'), Center()],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        Get.to(LoginScreen());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('enter credentials')));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: Get.width * 0.4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Registered?'),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: Text('LOGIN'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
