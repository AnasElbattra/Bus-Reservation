import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gobusss/widgets/text_form_field.dart';
import 'card_icons.dart';

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
  bool isScure = true;
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
                  _isSignIn ? 'Sign In' : 'Sign Up',
                  style: TextStyle(color: Colors.grey[500], fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _isSignIn
                      ? 'Sign in to booking your bus'
                      : 'Sign up to discover amazing thing',
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
                                    key: ValueKey('user name'),
                                    hint: 'User Name',
                                    prefixIcon: const Icon(
                                      Icons.account_circle,
                                    ),
                                    onSaved: (value) {
                                      _userName = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    controller: _userNameController,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(_emailFocusNode);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 3) {
                                        return 'Please enter at least 3 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                TextFormFieldCustom(
                                  key: ValueKey('email'),
                                  focusNode:
                                      !_isSignIn ? _emailFocusNode : null,
                                  hint: "Email",
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
                                    _userEmail = value!;
                                  },
                                  validator: (value) {
                                    if (!value!.contains('@') || value.isEmpty)
                                      return 'please enter valid email';
                                    return null;
                                  },
                                ),
                                TextFormFieldCustom(
                                  key: ValueKey('password'),
                                  focusNode: _passwordFocusNode,
                                  hint: "Password",
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                  ),
                                  obscure: isScure?true:false,
                                  suffixIcon: IconButton(
                                   splashColor:Colors.transparent ,
                                    enableFeedback: false,
                                    onPressed: () {
                                      setState(() {
                                        isScure = !isScure;
                                      });
                                    },
                                    icon: Icon(!isScure
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash),
                                    iconSize: 20,
                                  ),
                                  onSaved: (value) {
                                    _userPassword = value!;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 7)
                                      return 'please enter valid password';
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
                                              _isSignIn ? "Sign In" : "Sign Up",
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
                                              child: const Text(
                                                  'forget password?')),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  _isSignIn = false;
                                                });
                                              },
                                              child: const Text(
                                                'Sign Up',
                                                style: TextStyle(
                                                    color: Colors.deepOrange),
                                              )),
                                        ],
                                      )
                                    : Text.rich(
                                        TextSpan(
                                          text: 'By signing up you accept our',
                                          children: [
                                            TextSpan(
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                                text: ' Terms Of Service ',
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                            const TextSpan(
                                              text: 'and ',
                                            ),
                                            TextSpan(
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                                text: 'Privacy Policy',
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
