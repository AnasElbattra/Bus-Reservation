
import 'package:flutter/material.dart';
import '../screens/sign_up_screen.dart';

import '../widgets/text_form_field.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  'Sign In',
                  style: TextStyle(color: Colors.grey[500], fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sign in to booking your bus',
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
                padding: const EdgeInsets.all(16.0),
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
                                      borderRadius:
                                          BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('forget password?')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, SignUpScreen.routeName);
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style:
                                        TextStyle(color: Colors.deepOrange),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 450,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Card(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Icon(Icons.account_circle,size: 40),
                      Icon(Icons.directions_bus_rounded,size: 40,),
                      Icon(Icons.directions_bus_rounded,size: 40,),
                      Icon(Icons.directions_bus_rounded,size: 40,),
                    ],
                  ),
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
