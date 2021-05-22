import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite_database_example/features/authentication/register/view/register.dart';
import 'package:sqflite_database_example/features/constants/colors.dart';
import 'package:sqflite_database_example/page/notes_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secColor,
      appBar: AppBar(
        backgroundColor: secColor,
        elevation: 0.0,
      ),
      body: Form(
        key: formKey,
        child: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  child: TextFormField(
                    cursorHeight: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field Cannot be empty';
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  child: TextFormField(
                    cursorHeight: 14,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field Cannot be empty';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'password',
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not an Admin?'),
                  SizedBox(
                    width: 5,
                  ),
                  Ink(
                    child: InkWell(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: Text(
                        'Register as an admin',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Get.to(HomeScreen());
                    if (formKey.currentState!.validate()) {
                      Get.offAll(NotesPage());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('enter credentials')));
                    }
                  },
                  child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: secColor, fontSize: 15),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
