
import 'package:emart_app/consts/consts.dart';

Widget ourButton({
    onpress, color, textColor,String? title}){
  return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.all(12)
    ),
      child: title?.text.color(textColor).fontFamily(bold).make());
}