//
// MaterialApp(
// // supportedLocales: const [
// // Locale("af"),
// // Locale("am"),
// // Locale("ar"),
// // Locale("az"),
// // Locale("be"),
// // Locale("bg"),
// // Locale("bn"),
// // Locale("bs"),
// // Locale("ca"),
// // Locale("cs"),
// // Locale("da"),
// // Locale("de"),
// // Locale("el"),
// // Locale("en"),
// // Locale("es"),
// // Locale("et"),
// // Locale("fa"),
// // Locale("fi"),
// // Locale("fr"),
// // Locale("gl"),
// // Locale("ha"),
// // Locale("he"),
// // Locale("hi"),
// // Locale("hr"),
// // Locale("hu"),
// // Locale("hy"),
// // Locale("id"),
// // Locale("is"),
// // Locale("it"),
// // Locale("ja"),
// // Locale("ka"),
// // Locale("kk"),
// // Locale("km"),
// // Locale("ko"),
// // Locale("ku"),
// // Locale("ky"),
// // Locale("lt"),
// // Locale("lv"),
// // Locale("mk"),
// // Locale("ml"),
// // Locale("mn"),
// // Locale("ms"),
// // Locale("nb"),
// // Locale("nl"),
// // Locale("nn"),
// // Locale("no"),
// // Locale("pl"),
// // Locale("ps"),
// // Locale("pt"),
// // Locale("ro"),
// // Locale("ru"),
// // Locale("sd"),
// // Locale("sk"),
// // Locale("sl"),
// // Locale("so"),
// // Locale("sq"),
// // Locale("sr"),
// // Locale("sv"),
// // Locale("ta"),
// // Locale("tg"),
// // Locale("th"),
// // Locale("tk"),
// // Locale("tr"),
// // Locale("tt"),
// // Locale("uk"),
// // Locale("ug"),
// // Locale("ur"),
// // Locale("uz"),
// // Locale("vi"),
// // Locale("zh")
// // ],
// // localizationsDelegates: const [
// // CountryLocalizations.delegate,
// // GlobalMaterialLocalizations.delegate,
// // GlobalWidgetsLocalizations.delegate,
// // ],
// ),

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhoneNumberField extends StatelessWidget {
 const PhoneNumberField({ this.key,this.controller}) : super(key: key);
 final Key? key ;
  final TextEditingController? controller ;

  @override

  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        // prefixIcon: CountryCodePicker(
        //   onChanged: print,
        //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        //   initialSelection: 'EG',
        //   favorite: ['+39', 'FR'],
        //   // optional. Shows only country name and flag
        //   showCountryOnly: false,
        //
        //   // optional. Shows only country name and flag when popup is closed.
        //   showOnlyCountryWhenClosed: false,
        //   // optional. aligns the flag and the Text left
        //   alignLeft: false,
        //
        // ),
        hintText: 'enter your phone number',
      ),
      // onFieldSubmitted: (value) {},
      validator: (String? value) {
        if (value!.length < 8 || value.isEmpty) {
          return 'please enter valid number';
        }
        return null;
      },
      keyboardType: TextInputType.phone,
      controller: controller,
      maxLength: 12,
      key: key,
    );
  }
}
