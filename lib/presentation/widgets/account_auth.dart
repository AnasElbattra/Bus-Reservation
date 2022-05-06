import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gobusss/app/app_container.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';
import 'card_icons.dart';
import 'components_for_field/suffix_eye.dart';
import 'components_for_field/text_form_field.dart';

class AccountForm extends StatefulWidget {
  AccountForm({
    Key? key,
    this.submitFn,
    this.isLoading,
  }) : super(key: key);
  final void Function(
    String email,
    String password,
    String userName,
    bool isSignIn,
    BuildContext ctx,
  )? submitFn;
  final bool? isLoading;

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  bool isSecure = true;
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _userNameController = TextEditingController();

  //final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isSignIn = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn!(
        _userEmail.trim(),
        _userPassword,
        _userName.trim(),
        _isSignIn,
        context,
      );
    }
  }

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
                  _isSignIn ? StringManager.signIn.tr(): StringManager.signUp.tr(),
                  style: TextStyle(color: Colors.grey[500], fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _isSignIn
                      ? StringManager.headSignIn.tr()
                      :StringManager.headSignUp.tr() ,
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
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                primary: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (!_isSignIn)
                                  TextFormFieldCustom(
                                    key: ValueKey(StringManager.userName),
                                    hint: StringManager.userName.tr(),
                                    prefixIcon: const Icon(
                                      Icons.account_circle,
                                    ),
                                    onSaved: (value) {
                                      _userName = value??Constants.empty;
                                    },
                                    textInputAction: TextInputAction.next,
                                    controller: _userNameController,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(_emailFocusNode);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 3) {
                                        return StringManager.validName.tr();
                                      }
                                      return null;
                                    },
                                  ),
                                TextFormFieldCustom(
                                  key: ValueKey(StringManager.email),
                                  focusNode:
                                      !_isSignIn ? _emailFocusNode : null,
                                  hint: StringManager.email.tr(),
                                  keyBoardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_passwordFocusNode);
                                  },
                                  prefixIcon: const Icon(
                                    Icons.email,
                                  ),
                                  onSaved: (value) {
                                    _userEmail = value??Constants.empty;
                                  },
                                  validator: (value) {
                                    if (!value!.contains('@') || value.isEmpty)
                                      return StringManager.validEmail.tr();
                                    return null;
                                  },
                                ),
                                TextFormFieldCustom(
                                  key: ValueKey(StringManager.password),
                                  focusNode: _passwordFocusNode,
                                  hint: StringManager.password.tr(),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                  ),
                                  obscure: isSecure ? true : false,
                                  suffixIcon: SuffixEyePassword(
                                      isSecure: isSecure,
                                      setState: () {
                                        setState(() {
                                          isSecure = !isSecure;
                                        });
                                      }),
                                  onSaved: (value) {
                                    _userPassword = value??Constants.empty;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 7)
                                      return StringManager.validatePassword.tr();
                                    return null;
                                  },
                                ),
                                if (widget.isLoading!)
                                  CircularProgressIndicator(),
                                if (!widget.isLoading!)
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: SizedBox(
                                      height: 50,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(5),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                          onPressed: _trySubmit,
                                          child: Center(
                                            child: Text(
                                              _isSignIn ? StringManager.signIn.tr() : StringManager.signUp.tr(),
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                          )),
                                    ),
                                  ),
                                _isSignIn
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                  StringManager.forgetPassword.tr())),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  _isSignIn = false;
                                                });
                                              },
                                              child: Text(
                                                StringManager.signUp.tr(),
                                                style: TextStyle(
                                                    color: Colors.deepOrange),
                                              )),
                                        ],
                                      )
                                    : Text.rich(
                                        TextSpan(
                                          text: StringManager.bySigningUp.tr(),
                                          children: [
                                            TextSpan(
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                                text: StringManager.tOServices.tr(),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                             TextSpan(
                                              text: StringManager.and.tr(),
                                            ),
                                            TextSpan(
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                                text: StringManager.policy.tr(),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                            // TextSpan(
                                            //     style:
                                            //         TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),
                                            //     text:
                                            //         '\nSign In',
                                            //     recognizer: TapGestureRecognizer()
                                            //       ..onTap = () {}),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CardIcons(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
