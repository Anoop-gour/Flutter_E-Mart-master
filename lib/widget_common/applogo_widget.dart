import 'package:emart_app/consts/consts.dart';

Widget appLogoWidget(){
  //Using velocity X here
  return Image.asset(icAppLogo).box.white.size(77, 77).padding(EdgeInsets.all(8)).rounded.make();
}