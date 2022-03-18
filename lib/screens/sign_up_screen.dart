import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "Sign up";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Icon(
          Icons.login,
          color: Colors.deepOrange,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.grey[500],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.grey[500], fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign up to discover amazing thing',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ],
              ),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
            ),
            Center(
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const TextFormFieldCustom(
                              hint: "Full Name",
                              prefixIcon: Icon(
                                Icons.account_circle,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextFormFieldCustom(
                              hint: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextFormFieldCustom(
                              hint: "Password",
                              prefixIcon: Icon(
                                Icons.lock_outline,
                              ),
                              obscure: true,
                              suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(5),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: 'By signing up you accept our',
                                  children: [
                                    TextSpan(
                                      style: TextStyle(color: Colors.blue),
                                        text: ' Terms Of Service ',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {}),
                                    const TextSpan(
                                      text: 'and ',
                                    ),
                                    TextSpan(
                                        style: TextStyle(color: Colors.blue),
                                        text: 'Privacy Policy',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {}),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
