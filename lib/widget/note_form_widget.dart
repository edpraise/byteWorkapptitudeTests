// @dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite_database_example/features/constants/colors.dart';

class NoteFormWidget extends StatefulWidget {
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    this.onChangedImportant,
    this.onChangedNumber,
    this.onChangedTitle,
    this.onChangedDescription,
  }) : super(key: key);

  @override
  _NoteFormWidgetState createState() => _NoteFormWidgetState();
}

class _NoteFormWidgetState extends State<NoteFormWidget> {
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

  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row(
                  //   children: [
                  //     Switch(
                  //       value: isImportant ?? false,
                  //       onChanged: onChangedImportant,
                  //     ),
                  //     Expanded(
                  //       child: Slider(
                  //         value: (number ?? 0).toDouble(),
                  //         min: 0,
                  //         max: 5,
                  //         divisions: 5,
                  //         onChanged: (number) => onChangedNumber(number.toInt()),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  buildDesignation(),
                  SizedBox(height: 20),
                  buildDescription(),
                  // SizedBox(height: 20),
                  // buildName(),
                  SizedBox(height: 20),
                  buildAddress(),
                  SizedBox(height: 20),
                  buildCountry(),
                  SizedBox(height: 20),
                  buildState(),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shadowColor: primaryColor),
                            onPressed: () => _selectDate(context),
                            child: Text('Select date of Birth'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            currentDate.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //////
                  ///

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: getImage,
                          child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                  child: Text(
                                'Select an Image',
                                style: TextStyle(color: secColor),
                              ))),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: primaryColor, shape: BoxShape.rectangle),
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

                  Text(
                    'Select your Gender',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'Male',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'Female',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Radio(
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'none',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      );

  Widget buildDesignation() => Container(
        height: 60,
        child: TextFormField(
          maxLines: 1,
          initialValue: widget.title,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              // borderSide: BorderSid,
              borderRadius: const BorderRadius.all(
                const Radius.circular(6.0),
              ),
            ),
            hintText: ' FULL NAME',
            hintStyle: TextStyle(color: Colors.white70),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The title cannot be empty'
              : null,
          onChanged: widget.onChangedTitle,
        ),
      );

  Widget buildDescription() => Container(
        height: 60,
        child: TextFormField(
          maxLines: 5,
          initialValue: widget.description,
          style: TextStyle(color: Colors.white60, fontSize: 18),
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              // borderSide: BorderSid,
              borderRadius: const BorderRadius.all(
                const Radius.circular(6.0),
              ),
            ),
            hintText: 'Designation',
            hintStyle: TextStyle(color: Colors.white60),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The description cannot be empty'
              : null,
          onChanged: widget.onChangedDescription,
        ),
      );

  // Widget buildName() => Container(
  //       height: 60,
  //       child: TextFormField(
  //         maxLines: 5,
  //         initialValue: widget.description,
  //         style: TextStyle(color: Colors.white60, fontSize: 18),
  //         decoration: InputDecoration(
  //           border: new OutlineInputBorder(
  //             // borderSide: BorderSid,
  //             borderRadius: const BorderRadius.all(
  //               const Radius.circular(6.0),
  //             ),
  //           ),
  //           hintText: 'Last Name',
  //           hintStyle: TextStyle(color: Colors.white60),
  //         ),
  //         validator: (title) => title != null && title.isEmpty
  //             ? 'The description cannot be empty'
  //             : null,
  //         onChanged: widget.onChangedDescription,
  //       ),
  //     );

  Widget buildGender() => Container(
        height: 60,
        child: TextFormField(
          maxLines: 5,
          initialValue: widget.description,
          style: TextStyle(color: Colors.white60, fontSize: 18),
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              // borderSide: BorderSid,
              borderRadius: const BorderRadius.all(
                const Radius.circular(6.0),
              ),
            ),
            hintText: 'Designation',
            hintStyle: TextStyle(color: Colors.white60),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The description cannot be empty'
              : null,
          onChanged: widget.onChangedDescription,
        ),
      );

  Widget buildAddress() => Container(
        height: 60,
        child: TextFormField(
          maxLines: 5,
          initialValue: widget.description,
          style: TextStyle(color: Colors.white60, fontSize: 18),
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              // borderSide: BorderSid,
              borderRadius: const BorderRadius.all(
                const Radius.circular(6.0),
              ),
            ),
            hintText: 'Address',
            hintStyle: TextStyle(color: Colors.white60),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The description cannot be empty'
              : null,
          onChanged: widget.onChangedDescription,
        ),
      );

  Widget buildCountry() => Container(
        height: 60,
        child: TextFormField(
          maxLines: 5,
          initialValue: widget.description,
          style: TextStyle(color: Colors.white60, fontSize: 18),
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              // borderSide: BorderSid,
              borderRadius: const BorderRadius.all(
                const Radius.circular(6.0),
              ),
            ),
            hintText: 'Country',
            hintStyle: TextStyle(color: Colors.white60),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The description cannot be empty'
              : null,
          onChanged: widget.onChangedDescription,
        ),
      );

  Widget buildState() => Container(
        height: 60,
        child: TextFormField(
          maxLines: 5,
          initialValue: widget.description,
          style: TextStyle(color: Colors.white60, fontSize: 18),
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              // borderSide: BorderSid,
              borderRadius: const BorderRadius.all(
                const Radius.circular(6.0),
              ),
            ),
            hintText: 'State',
            hintStyle: TextStyle(color: Colors.white60),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The description cannot be empty'
              : null,
          onChanged: widget.onChangedDescription,
        ),
      );
}
