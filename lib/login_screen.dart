import 'package:flutter/material.dart';
import 'package:my_login/components/my_card.dart';
import 'package:my_login/provider/login.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent.shade700, Colors.blue.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Center(
                  child: Card(
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Login Here',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                MyCard(
                  obscureText: false,
                  hintText: "Username",
                  validator: (st) {
                    if (st == null || st.isEmpty) {
                      return "This field is required";
                    }

                    return null;
                  },
                ),
                MyCard(
                  hintText: "Password",
                  obscureText: context.watch<PasswordProvider>().PasswordHidden,
                  controller: PasswordController,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      context.read<PasswordProvider>().passwordHidden();
                    },
                    child: Icon(
                        context.watch<PasswordProvider>().PasswordHidden == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF0063eb),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF0063eb),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Text(
                          "Change Language",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
