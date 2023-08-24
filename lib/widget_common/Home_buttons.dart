import 'package:emart_app/consts/consts.dart';

Widget HomeButton({
  required String title,
  required icon,
  required width,
  required height,
  onpress }){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 26,),
      10.heightBox,
      title.text.fontFamily(bold).color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}