import '../component/custbutton.dart';
import '../screen/mood.dart';
import '../screen/login.dart';
import 'package:flutter/material.dart';
import '../commom/utils/custcolor.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecapPage extends StatefulWidget {
  final String selectedDate;
  final String selectedMood;
  final String selectedNote;

  const RecapPage(
      {super.key, required this.selectedDate, required this.selectedMood, required this.selectedNote});

  @override
  State<RecapPage> createState() => _RecapPageState();
}

class _RecapPageState extends State<RecapPage> {
  DateTime today = DateTime.now();
  DateTime? selectedDate;
  TextEditingController _datecontroller = TextEditingController();
  Map<String, Color> moodColors = {
    "Matcha": Coloors.matcha,
    "Lemon Tea": Coloors.lemon,
    "Milk Tea": Coloors.milktea,
    "Black Coffee": Coloors.coffee,
    "Red Velvet": Coloors.redvelvet,
  };
  Map<Color, Map<String, String>> moodDetails = {
    Coloors.matcha: {
      'name': 'Matcha',
      'price': '1.5',
      'condition': 'peace',
    },
    Coloors.lemon: {
      'name': 'Lemon Tea',
      'price': '2.0',
      'condition': 'happy',
    },
    Coloors.milktea: {
      'name': 'Milk Tea',
      'price': '1.8',
      'condition': 'okay',
    },
    Coloors.coffee: {
      'name': 'Black Coffee',
      'price': '2.5',
      'condition': 'sad',
    },
    Coloors.redvelvet: {
      'name': 'Red Velvet',
      'price': '3.0',
      'condition': 'angry',
    },
  };

  void initState() {
    super.initState();
    // Set the received date to the controller
    _datecontroller.text = widget.selectedDate;
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color dotColor = moodColors[widget.selectedMood] ?? Coloors.kertas;
    Map<String, String> moodInfo = moodDetails[dotColor] ?? {
      'name': '-',
      'price': '0.0',
      'condition': '',
    };
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
      body: _bodyRecap(dotColor, widget.selectedMood, moodInfo),
    );
  }

  Widget _bodyRecap(Color dotColor, String selectedMood, Map<String, String> moodInfo) {
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
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Coloors.kertas,
                  border: Border.all(width: 5, color: Coloors.kayu),
                ),
                padding: const EdgeInsets.all(10),
                child: TableCalendar(
                  rowHeight: 43,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                  focusedDay: selectedDate ?? today,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030),
                  onDaySelected: _onDaySelected,
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _datecontroller.text.isNotEmpty &&
                                isSameDay(DateTime.parse(_datecontroller.text),
                                    selectedDate)
                            ? dotColor // Ganti dengan warna yang diinginkan jika tanggal sama
                            : Coloors.kayu, // Default border warna coklat,
                        width: 2,
                      ),
                    ),
                    selectedTextStyle: TextStyle(
                      color: Coloors
                          .kayu, // Pastikan nomor tanggal terlihat dengan warna teks yang diinginkan
                    ),
                    todayDecoration: BoxDecoration(
                      border: Border.all(
                        color: Coloors.button.withOpacity(0.5),
                        // Coklat untuk border
                        width: 2, // Lebar border
                      ),
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(color: Coloors.kayu),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, date, events) {
                      // Periksa apakah _datecontroller.text berisi tanggal yang valid
                      DateTime? selectedDate;
                      try {
                        selectedDate = DateTime.parse(_datecontroller.text);
                      } catch (e) {
                        selectedDate = null;
                      }

                      // Jika tanggal valid, periksa apakah tanggal saat ini sama dengan yang dipilih
                      if (selectedDate != null &&
                          isSameDay(date, selectedDate)) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Coloors.kertas, // Warna latar belakang tanggal
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${date.day}',
                                  style: TextStyle(
                                      color:
                                          Coloors.kayu), // Warna teks tanggal
                                ),
                                // Dot merah hanya akan muncul jika tanggal yang dipilih
                                Container(
                                  width: 8,
                                  height: 8,
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: dotColor, // Warna tanda merah
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        // Kembalikan default jika tanggal tidak dipilih atau tidak sesuai
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Coloors.kertas,
                          ),
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle(color: Coloors.kayu),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                )),
            SizedBox(height: 15),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: 250,
                  decoration: BoxDecoration(color: Coloors.kertas),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'cafeelings',
                          style: TextStyle(
                              color: Coloors.button,
                              fontFamily: 'Norquay',
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Coloors.kertas,
                            borderRadius:
                                BorderRadius.circular(5), // Radius sudut kotak
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Center(
                            child: Text(
                              '${moodInfo['condition']}',
                              style: TextStyle(
                                  color: (selectedDate != null &&
                                      isSameDay(selectedDate!, DateTime.parse(widget.selectedDate)))
                                      ? dotColor // Ubah warna sesuai mood jika tanggal sama
                                      : Coloors.kertas,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              selectedDate == null
                                  ? 'Select Date' // Jika belum ada tanggal yang dipilih
                                  : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                              style: TextStyle(
                                  color: Coloors.button,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            // tempat buat warna mood
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 2, color: Coloors.button),
                        SizedBox(height: 15),
                        const Row(
                          children: [
                            Text(
                              'Order',
                              style: TextStyle(
                                  color: Coloors.button,
                                  fontFamily: 'Nunito',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'Price',
                              style: TextStyle(
                                  color: Coloors.button,
                                  fontFamily: 'Nunito',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            _getTextMenuForMood(dotColor, selectedDate, widget.selectedDate),
                            Spacer(),
                            _getTextPriceForMood(dotColor, selectedDate, widget.selectedDate),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 2, color: Coloors.button),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Note',
                                style: TextStyle(
                                    color: Coloors.button,
                                    fontFamily: 'Nunito',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              _getNote(selectedDate, widget.selectedDate)
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 2, color: Coloors.button),
                      ]),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CustomButton(
                    text: 'Back to menu',
                    fontsize: 12,
                    height: 30,
                    width: 150,
                    radius: 8,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MoodPage()));
                    }), //back to menu
                Spacer(),
                CustomButton(
                    text: 'Log out',
                    fontsize: 12,
                    height: 30,
                    width: 150,
                    radius: 8,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }) //log out
              ],
            ),
          ]),
        ),
      ])
    ]);
  }

  Widget _getTextMenuForMood(Color dotColor, DateTime? selectedDate, String selectedDateStr) {
    // Pastikan tanggal yang dipilih valid
    bool isSelectedDate = selectedDate != null && isSameDay(selectedDate, DateTime.parse(selectedDateStr));

    // Mengambil moodInfo berdasarkan dotColor
    Map<String, String> moodInfo = moodDetails[dotColor] ?? {
      'name': 'Unknown',
      'price': '0.0',
      'condition': 'neutral',
    };

    return Text(
      isSelectedDate ? moodInfo['name']! : '-',
      style: TextStyle(
        color: isSelectedDate ? Coloors.button : Coloors.button.withOpacity(0.6),
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
  Widget _getTextPriceForMood(Color dotColor, DateTime? selectedDate, String selectedDateStr) {
    // Pastikan tanggal yang dipilih valid
    bool isSelectedDate = selectedDate != null && isSameDay(selectedDate, DateTime.parse(selectedDateStr));

    // Mengambil moodInfo berdasarkan dotColor
    Map<String, String> moodInfo = moodDetails[dotColor] ?? {
      'name': 'Unknown',
      'price': '0.0',
      'condition': 'neutral',
    };

    return Text(
      isSelectedDate ? moodInfo['price']! : '0.0',
      style: TextStyle(
        color: isSelectedDate ? Coloors.button : Coloors.button.withOpacity(0.6),
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
  Widget _getNote(DateTime? selectedDate, String selectedDateStr) {
    // Pastikan tanggal yang dipilih valid
    bool isSelectedDate = selectedDate != null && isSameDay(selectedDate, DateTime.parse(selectedDateStr));

    return Text(
      isSelectedDate ? widget.selectedNote ?? '' : '',
      style: TextStyle(
        color: isSelectedDate ? Coloors.button : Coloors.button.withOpacity(0.6),
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

}
