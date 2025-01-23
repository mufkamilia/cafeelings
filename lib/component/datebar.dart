import 'package:flutter/material.dart';
import '../commom/utils/custcolor.dart';

class DateBar extends StatefulWidget {
  const DateBar({
    Key? key,
  }) : super(key: key);

  @override
  State<DateBar> createState() => _DateBarState();
}

class _DateBarState extends State<DateBar> {
  TextEditingController _datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 150,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Coloors.kertas),
      child: TextFormField(
            controller: _datecontroller,
            style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 15,
                color: Coloors.font,
                fontWeight: FontWeight.w600),
            decoration: const InputDecoration(
              hintText: "Select Date",
              hintStyle: TextStyle(
                  color: Coloors.font,
                  fontFamily: 'Nunito',
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 0),
            ),
        textAlign: TextAlign.center,
            readOnly: true, // Prevent manual typing
            onTap: () async {
              // Show date picker when the field is tapped
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                setState(() {
                  // Set the selected date to the controller
                  _datecontroller.text = "${pickedDate.toLocal()}".split(' ')[0];
                });
              }
            },
          ),

    );}
}