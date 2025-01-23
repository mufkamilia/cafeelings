import '../component/custbutton.dart';
import '../screen/mood.dart';
import '../screen/signup.dart';
import 'package:flutter/material.dart';
import '../commom/utils/custcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool is_onpress = true;
  TextEditingController _Namecontroller = TextEditingController();
  TextEditingController _Passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloors.background,
      body: ListView(
        children: [
          Stack(children: [
            Positioned(
                bottom: 0,
                right: 0,
                // width: 600,
                child: SvgPicture.asset(
                  'assets/svg/cafe.svg',
                  width: 500,
                )),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/svg/logo.svg'),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    child: Container(
                        width: 250,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            // border: Border.all(color: Coloors.font),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Coloors.kertas),
                        // decoration: ,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                      borderSide:
                                          BorderSide(color: Coloors.kertas)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Coloors.font)),
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
                                      borderSide:
                                          BorderSide(color: Coloors.kertas)),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Coloors.font)),
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
                              SizedBox(height: 1),
                            ])),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      text: 'Login',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoodPage()));
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignPage()));
                      },
                      child: const Text(
                        'Create new customer',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 13,
                            color: Coloors.font),
                      )),
                  SizedBox(height: 320)
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
