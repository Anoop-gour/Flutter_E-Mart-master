import 'package:emart_app/consts/consts.dart';

Widget customTextField({
  String? title,String? hint,dynamic? controller,bool obscureText=false, validator
}){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(bold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey
          ),
          isDense: true,
          filled: true,
          fillColor: lightGrey,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
          )
        ),
        validator: validator,
      )
    ],
  );
}