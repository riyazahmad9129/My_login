import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_login/components/my_textfield.dart';
import 'package:my_login/provider/login.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/nl.jpg"), fit: BoxFit.fitWidth),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 150),
          child: Container(
            height: 500,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Login Here",
                    style:
                        GoogleFonts.gabriela(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const MyTextField(
                    obscureText: false,
                    hintText: "Username",
                  ),
                  MyTextField(
                    obscureText:
                        context.watch<PasswordProvider>().PasswordHidden,
                    hintText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        context.read<PasswordProvider>().passwordHidden();
                      },
                      child: Icon(
                          context.watch<PasswordProvider>().PasswordHidden ==
                                  true
                              ? Icons.visibility_off
                              : Icons.visibility),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: Colors.white12),
                      onPressed: () {},
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 13.0),
                          child: Text(
                            "Login",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ).frosted(
            blur: 3.0,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
