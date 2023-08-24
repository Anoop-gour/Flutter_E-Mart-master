
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

Widget detailsCard({required String? title,required count}){
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        '${count}'.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
        5.heightBox,
        title!.text.color(darkFontGrey).make(),
      ],
    )).box.rounded.white.width(Get.width/3.4).height(80).padding(EdgeInsets.all(8)).makeCentered()
  ;
}