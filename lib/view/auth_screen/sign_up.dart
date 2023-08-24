

import 'dart:convert';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/view/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../widget_common/applogo_widget.dart';
import '../../widget_common/bg_widget.dart';
import '../../widget_common/custom_textfield.dart';
import '../../widget_common/our_button.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isCheck = false;
  bool circlularprogress = false;
  AuthController controller = Get.put(AuthController());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  var  formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset:false,
      body: Center(
        child: Column(

          children: [
            (Get.height*0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Join to $appname".text.white.fontFamily(bold).size(18).make(),
            30.heightBox,
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customTextField(
                      title: name,
                      hint: nameHint,
                      controller: nameController,
                    validator: (value){
                        if(value== ''){
                          return 'This field is required';
                        }
                    }
                  ),
                  10.heightBox,
                  customTextField(
                      hint: emailHint,
                      title: email,
                      controller: emailController,
                  validator: (value){
                    if(value== ''){
                      return 'This field is required';
                    }else if(!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',caseSensitive: false,multiLine: false).hasMatch(value)){
                      return 'Invalid email';
                    }
                  }
                  ),
                  10.heightBox,
                  customTextField(
                      title: password,
                      hint: passwordHint,
                      controller: passwordController,
                      obscureText: true,
                      validator: (value){
                        if(value== ''){
                          return 'This field is required';
                        }
                      }),
                  10.heightBox,
                  customTextField(
                      title: retypePassword,
                      hint: passwordHint,
                      controller: retypePasswordController,
                      obscureText: true,
                      validator: (value){
                        if(value== '' ){
                          return 'This field is required';
                        }else if(value != passwordController.text){
                          return 'Password does not match';
                        }
                      }),
                  10.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor,
                          checkColor: Vx.white,
                          value: isCheck,
                          onChanged: (newValue){
                            isCheck = newValue!;
                            setState(() {

                            });
                          }),

                      Expanded(
                        child: RichText(text: TextSpan(
                            children:
                            [
                              TextSpan(
                                  text: 'I agree to the ',
                                  style: TextStyle(
                                      color: Colors.black
                                  )
                              ),
                              TextSpan(
                                  text: termcondition,
                                  style: TextStyle(
                                      color: redColor,
                                    fontFamily: bold
                                  )
                              ),
                              TextSpan(
                                  text: ' & ',
                                  style: TextStyle(
                                      color: Colors.black
                                  )
                              ),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                      color: redColor,
                                    fontFamily: bold
                                  )
                              ),
                            ]
                        )),
                      )
                    ],
                  ),
                  circlularprogress
                      ?CircularProgressIndicator(color: redColor,)
                      :ourButton(
                      color: isCheck?redColor:lightGrey,
                      title: signup,
                      textColor: whiteColor,
                      onpress: ()async{

                        if(isCheck != false && formKey.currentState!.validate()){
                          setState(() {
                            circlularprogress = true;
                          });
                          try{
                            await controller.signupMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text);
                            await currentUser!=null;
                             await  controller.storeUserData(
                                  context: context,
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  userId: FirebaseAuth.instance.currentUser?.uid);
                              VxToast.show(context, msg: loggedin);
                              await Get.offAll(() => Home());

                               //  .then((value) {
                               //    if(value!=null){
                               // controller.storeUserData(
                               //    name: nameController.text,
                               //    email: emailController.text,
                               //    password: passwordController.text,
                               //     userId: currentUser?.uid.text);
                               //    VxToast.show(context, msg: loggedin);
                               //    // Get.offAll(() => Home());
                               //    setState(() {
                               //      circlularprogress=false;
                               //    });
                               //    }
                               //    else{
                               //      setState(() {
                               //        circlularprogress=false;
                               //      });
                               //
                               //    }
                            // });
                          }catch(e){
                            setState(() {
                              circlularprogress = false;
                            });
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                          }
                        }
                      }).box.width(context.screenWidth-50).make(),
                  10.heightBox,
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyhaveaccount,
                        style: TextStyle(
                          color: Colors.black,
                        )
                      ),
                      TextSpan(
                        text: login,
                        recognizer: TapGestureRecognizer(
                        )..onTap = (){Get.back();},
                        style: TextStyle(
                          color: redColor,
                          fontFamily: bold
                        )
                      )
                    ]
                  ))
                ],
              ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadow.make(),
            )
          ],
        ),
      ),
    ));
  }
}
