
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/view/auth_screen/login_screen.dart';
import 'package:emart_app/view/home/home.dart';
import 'package:emart_app/widget_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      //Using getx
      auth
      .authStateChanges().listen((User? user) {
        if(user!=null && mounted){
        Get.offAll(()=>Home());
      }else{
        Get.offAll(() => LoginScreen());
      } });

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg,width: 300,),
            ),
            20.heightBox,
            appLogoWidget(),
          SizedBox(height: 10,),
            Text(appname,style: TextStyle(fontFamily: bold,fontSize: 22,color: Colors.white),),
            5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(bold).make(),
            30.heightBox
          ],
        ),
      ),
    );
  }
}
