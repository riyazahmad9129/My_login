import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_login/components/my_textfield.dart';
import 'package:my_login/my_theme/theme.dart';
import 'package:my_login/provider/checkbox_provider.dart';
import 'package:my_login/provider/password_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                image: const AssetImage("lib/assets/home1.jpg"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    MyColors.primary.withOpacity(0.4), BlendMode.dstATop),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    height: MediaQuery.of(context).size.height * 2,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              color: MyColors.primary,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "Don't have an account? Register now",
                            style: TextStyle(color: Colors.red),
                          ),
                          const Gap(40),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 5),
                            child: Text(
                              "E-Mail Address",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          MyTextField(
                              obscureText: false,
                              validator: (st) {
                                if (st == null || st.isEmpty) {
                                  return "This field is required";
                                }

                                return null;
                              },
                              hintText: "flutter@gmail.co",
                              suffixIcon: const Icon(Icons.check,
                                  color: MyColors.primary),
                              controller: emailController),
                          const Gap(20),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 5),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          MyTextField(
                            obscureText: context
                                .watch<PasswordProvider>()
                                .PasswordHidden,
                            controller: passwordController,
                            validator: (st) {
                              if (st == null || st.isEmpty) {
                                return "This field is required";
                              }
                              if (st.length < 8) {
                                return "To short";
                              }
                              if (st.length < 10) {
                                return "weak password";
                              }
                              return null;
                            },
                            hintText: "*****",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                context
                                    .read<PasswordProvider>()
                                    .passwordHidden();
                              },
                              child: Icon(
                                  context
                                              .watch<PasswordProvider>()
                                              .PasswordHidden ==
                                          true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: MyColors.primary),
                            ),
                          ),
                          const Gap(5),
                          Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                child: Checkbox(
                                  value:
                                      context.watch<CheckBoxProvider>().checked,
                                  onChanged: (newValue) {
                                    context
                                        .read<CheckBoxProvider>()
                                        .checkedBox();
                                  },
                                  checkColor: MyColors.primary,
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  activeColor: Colors.black26,
                                ),
                              ),
                              const Gap(7),
                              const Text("Remember me"),
                              const Gap(56),
                              TextButton(
                                onPressed: () {},
                                child: const Text("I forgot my password"),
                              )
                            ],
                          ),
                          const Gap(22),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 45),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primary,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    return;
                                  }
                                },
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Center(
                            child: Text(
                              "Or login with",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Gap(10),
                          Padding(
                            padding: const EdgeInsets.only(left: 90.0),
                            child: Row(
                              children: [
                                Image.asset("lib/assets/Facebook-logo.png",
                                    height: 35),
                                const Gap(35),
                                Image.asset("lib/assets/twitter_logo.png",
                                    height: 35),
                                const Gap(30),
                                Image.asset("lib/assets/google_logo.png",
                                    height: 37),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 179,
            top: 30,
            child: Icon(
              Icons.location_pin,
              color: Colors.white,
              size: 80,
            ),
          ),
          const Positioned(
            left: 165,
            top: 110,
            child: Text(
              "VISION GO",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
