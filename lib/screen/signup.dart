import '../component/custbutton.dart';
import '../screen/login.dart';
import 'package:flutter/material.dart';
import '../commom/utils/custcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  late bool is_onpress = true;
  TextEditingController _Namecontroller = TextEditingController();
  TextEditingController _Passcontroller = TextEditingController();
  TextEditingController _Emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Coloors.background,
        body: Column(children: [
          SizedBox(
            height: 70,
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/svg/logo.svg'),
          )),
          SizedBox(
            height: 20,
          ),
          Stack(alignment: Alignment.center, children: [
            Container(
              width: 350,
              height: 600,
              color: Coloors.kayu,
            ),
            Positioned(
                child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Coloors.kertas),
              width: 300,
              height: 550,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/svg/Line.svg'),
                  )),
                  SizedBox(height: 20),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Coloors.font,
                        fontFamily: 'Nunito',
                        fontSize: 17,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/svg/Line.svg'),
                  )),
                  SizedBox(height: 50),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                    style: const TextStyle(
                        color: Coloors.font,
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    controller: _Namecontroller,
                    cursorColor: Coloors.font,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Coloors.kertas)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Coloors.font)),
                      filled: true,
                      fillColor: Color.fromARGB(90, 255, 253, 251),
                      hintText: "Username",
                      hintStyle: TextStyle(
                          color: Coloors.font,
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      // contentPadding: EdgeInsets.all(0),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                        color: Coloors.font,
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    controller: _Emailcontroller,
                    cursorColor: Coloors.font,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Coloors.kertas)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Coloors.font)),
                      filled: true,
                      fillColor: Color.fromARGB(90, 255, 253, 251),
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Coloors.font,
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      // contentPadding: EdgeInsets.all(0),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: is_onpress,
                    style: const TextStyle(
                        color: Coloors.font,
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    controller: _Passcontroller,
                    cursorColor: Coloors.font,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Coloors.kertas)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Coloors.font)),
                      filled: true,
                      fillColor: Coloors.kertas,
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          color: Coloors.font,
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      suffixIcon: IconButton(
                          color: Coloors.font,
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () {
                            setState(() {
                              is_onpress = !is_onpress;
                            });
                          }),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    child: Row(
                      children: [
                        Spacer(),
                        CustomButton(
                            text: 'Sign Up',
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            })
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              'Already became a customer',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 13,
                                  color: Coloors.font),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/svg/Line.svg'),
                  )),
                  SizedBox(width: 10, height: 10),
                ],
              ),
            ))
          ])
        ]));
  }
}
