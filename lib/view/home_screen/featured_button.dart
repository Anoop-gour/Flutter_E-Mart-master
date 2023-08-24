import 'package:emart_app/consts/consts.dart';

Widget featuredButton({
  required String? title, required icon
}){
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),

    ],
  ).box.width(200).rounded.white.margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(4)).outerShadowSm.make();
}