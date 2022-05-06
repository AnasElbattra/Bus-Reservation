import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gobusss/app/app_container.dart';
import '../../presentation_contatiner.dart';
import '../../widgets/components_for_field/phone_number_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';



class MobileView extends StatefulWidget {

  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  String? verifcationCode;
  GlobalKey<FormFieldState> textFormKey = GlobalKey<FormFieldState>();

  Future<void> _verifyPhone() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          verifcationCode = verificationId;
        });

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: verifcationCode ?? "");

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          verifcationCode = verificationId;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  }

  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final phoneNumberController = TextEditingController();
  bool isOTP = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.indigo,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset('assets/images/otp_screen.png'),
                  ),
                  radius: 40,
                  backgroundColor: Colors.white24,
                ),
                const SizedBox(height: 20),
                Text(
                  !isOTP ? StringManager.mobileNumber.tr() : StringManager.otp.tr(),
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Text(
                  !isOTP
                      ? StringManager.needOtp.tr()
                      : StringManager.enterOtp.tr(),
                  style: GoogleFonts.lato(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    80,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(24),
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  !isOTP
                      ? PhoneNumberField(key:textFormKey,controller: phoneNumberController,)
                      : Column(
                          children: [
                            Pinput(
                              length: 6,
                              focusNode: _pinPutFocusNode,
                              controller: _pinPutController,
                              pinAnimationType: PinAnimationType.fade,
                              onSubmitted: (pin) async {
                                await FirebaseAuth.instance
                                    .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: verifcationCode ??Constants.empty,
                                      smsCode: pin),
                                );
                              },
                              // followingPinTheme: PinTheme(decoration: const BoxDecoration(
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(10),
                              //   ),
                              // ),),

                              // defaultPinTheme: PinTheme(
                              //   textStyle: TextStyle(fontSize: 20),
                              //   height: 40,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     borderRadius: BorderRadius.all(
                              //       Radius.circular(10),
                              //     ),
                              //   ),
                              // ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                 Text(
                                  StringManager.dReceiveOtp.tr(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(),
                                    onPressed: () {},
                                    child: Text(
                                     StringManager.resendOtp.tr(),
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ))
                              ],
                            ),
                          ],
                        ),
                  !isOTP
                      ? ElevatedButton(
                          onPressed: () async {
                            final isValid =
                                textFormKey.currentState!.validate();
                            if (isValid) {
                              if (phoneNumberController.text.length >= 8) {
                                setState(() {
                                  isOTP = true;
                                });
                                await _verifyPhone();
                              }
                            }
                          },
                          child:  Text(
                            StringManager.next.tr(),
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            minimumSize: Size(double.infinity, 50),
                            primary: Colors.deepOrange,
                            padding: const EdgeInsets.all(6),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            //Todo submit
                          },
                          child:  Text(
                           StringManager.submit.tr(),
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            minimumSize: Size(double.infinity, 50),
                            primary: Colors.deepOrange,
                            padding: const EdgeInsets.all(6),
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
