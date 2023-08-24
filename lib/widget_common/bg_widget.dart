import 'package:emart_app/consts/consts.dart';

Widget bgWidget({Widget? child}){
  return SafeArea(
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imgBackground),fit: BoxFit.fill),
      ),
      child: child ,
    ),
  );
}