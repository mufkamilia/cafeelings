import '../component/custbutton.dart';
import '../component/datebar.dart';
import '../component/pickmood.dart';
import '../screen/recap.dart';
import 'package:flutter/material.dart';
import '../commom/utils/custcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  String activeMood = ""; // Melacak mood yang aktif
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloors.dinding,
      appBar: AppBar(
        backgroundColor: Coloors.dinding,
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Cafeelings',
            style: TextStyle(
                color: Coloors.font,
                fontFamily: 'Norquay',
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: _bodyMood(),
    );
  }

  ListView _bodyMood() {
    return ListView(children: [
      Stack(children: [
        Positioned(
            bottom: 0,
            right: 0,
            // width: 600,
            child: SvgPicture.asset(
              'assets/svg/dalamcafe.svg',
              width: 500,
            )),
        Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          // color: Coloors.dinding,
          child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Coloors.font),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Coloors.kertas),
                    child: Text(
                      "Choose your todays' feel, let's see on this menu :)",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 12,
                          color: Coloors.font,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Coloors.papantulis,
                        border: Border.all(color: Coloors.kayu, width: 10)),
                    child: Column(children: [
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        color: Coloors.kertas,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Menu',
                        style: TextStyle(
                            color: Coloors.kertas,
                            fontFamily: 'Norquay',
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ), //Menu
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        color: Coloors.kertas,
                      ),
                      SizedBox(height: 20),
                      Container(
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

                      ), //Select Date
                      SizedBox(height: 20),
                      PickMood(
                          assetName: 'assets/svg/matcha.svg',
                          textdrink: 'Matcha',
                          textmood: 'your day feel so peaceful',
                          textprice: "2.5",
                          isActive: activeMood == "Matcha", // Periksa apakah Matcha aktif
                          ontap: () {
                            setState(() {
                              activeMood = "Matcha"; // Atur mood aktif ke "Matcha"
                            });
                          }),
                      SizedBox(height: 25),
                      PickMood(
                          assetName: 'assets/svg/lemon.svg',
                          textdrink: 'Lemon Tea',
                          textmood: 'today is a happy day!',
                          textprice: "1.5",
                          isActive: activeMood == "Lemon Tea",
                          ontap: () {
                            setState(() {
                              activeMood = "Lemon Tea";
                            });
                          }
                      ),
                      SizedBox(height: 25),
                      PickMood(
                          assetName: 'assets/svg/milktea.svg',
                          textdrink: 'Milk Tea',
                          textmood: 'everything is okay',
                          textprice: "3.5",
                          isActive: activeMood == "Milk Tea",
                          ontap: () {
                            setState(() {
                              activeMood = "Milk Tea";
                            });
                          }
                      ),
                      SizedBox(height: 25),
                      PickMood(
                          assetName: 'assets/svg/coffee.svg',
                          textdrink: 'Black Coffee',
                          textmood: 'im so sad',
                          textprice: "4.5",
                          isActive: activeMood == "Black Coffee",
                          ontap: () {
                            setState(() {
                              activeMood = "Black Coffee";
                            });
                          }
                      ),
                      SizedBox(height: 25),
                      PickMood(
                          assetName: 'assets/svg/redvelvet.svg',
                          textdrink: 'Red Velvet',
                          textmood: 'ammnggryyyyyy',
                          textprice: "1.5",
                          isActive: activeMood == "Red Velvet",
                          ontap: () {
                            setState(() {
                              activeMood = "Red Velvet";
                            });
                          }
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        color: Coloors.kertas,
                      ),
                      SizedBox(height: 10),
                    ]),
                  ),
                  SizedBox(height: 15),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Coloors.font),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: Coloors.kertas),
                      child: Text(
                        "Write your today's story on this notes!",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 12,
                            color: Coloors.font,
                            fontWeight: FontWeight.w600),
                      )), //write your notes
                  SizedBox(height: 15),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Coloors.kertas),
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 20, bottom: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Notes',
                                style: TextStyle(
                                    fontFamily: 'Norquay',
                                    fontSize: 17,
                                    color: Coloors.font,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: 9),
                          TextFormField(
                            controller: _noteController,
                            style: const TextStyle(
                                color: Coloors.font,
                                fontFamily: 'Nunito',
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            cursorColor: Coloors.font,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Coloors.kertas)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Coloors.font)),
                              filled: true,
                              fillColor: Color.fromARGB(90, 255, 253, 251),
                              hintText: "Start write",
                              hintStyle: TextStyle(
                                  color: Coloors.font,
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 9),
                          Row(
                            children: [
                              Spacer(),
                              CustomButton(
                                  text: 'Save',
                                  fontsize: 12,
                                  height: 30,
                                  width: 75,
                                  onPressed: () {
                                    // String isiNote = _noteController.text();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RecapPage(
                                                selectedDate: _datecontroller.text.isNotEmpty && _datecontroller.text != "empty"
                                                ? _datecontroller.text
                                                : DateTime.now().toString(), // Default to current date if not valid
                                                selectedMood: activeMood,
                                                selectedNote: _noteController.text.isNotEmpty && _noteController.text != "empty" ?
                                                _noteController.text
                                                : "",
                                    )));
                                  }),
                            ],
                          )
                        ],
                      )) //notes
                ],
              )),
        ),
      ])
    ]);
  }
}
