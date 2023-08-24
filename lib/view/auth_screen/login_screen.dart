
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/view/auth_screen/sign_up.dart';
import 'package:emart_app/view/home/home.dart';
import 'package:emart_app/widget_common/applogo_widget.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';
import 'package:emart_app/widget_common/our_button.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var controller = Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset:false,
      body: Center(
        child: Column(

          children: [
            (Get.height*0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Log in to $appname".text.white.fontFamily(bold).size(18).make(),
            30.heightBox,
            Form(
              key: formKey,
              child: Column(
               mainAxisSize: MainAxisSize.min,
                children: [
                  customTextField(
                    controller: controller.emailController,
                      hint: emailHint,
                      title: email,
                    validator: (value){
                        if(value == ''){
                          return 'This field is required';
                        }else if(!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',caseSensitive: false,multiLine: false).hasMatch(value)){
                          return 'Invalid email';
                        }
                    }
                  ),
                  10.heightBox,
                  customTextField(
                    controller: controller.passwordController,
                      title: password,
                      hint: passwordHint,
                    obscureText: true,
                    validator: (value){
                        if(value == ''){
                          return 'This field is required';
                        }
                    }
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){},
                        child: forgetPass.text.make()),
                  ),
                  Obx(()=> controller.process.value?CircularProgressIndicator(color: redColor,)
                    :
                      ourButton(
                          color: redColor,
                          title: login,
                          textColor: whiteColor,
                          onpress:(){
                            if(formKey.currentState!.validate()){
                                controller.process.value = true;
                              try{
                                controller.loginMethod(context: context)
                                    .then((value)
                                    {
                                      if(value != null){
                                        VxToast.show(context, msg: loggedin);
                                        controller.process.value = false;
                                        return Get.offAll(() => Home());
                                      }else{
                                        controller.process.value=false;
                                      }
                                    })
                                    .catchError((e){
                                    controller.process.value=false;
                                  VxToast.show(context, msg: e.toString(),position: VxToastPosition.top);});
                              }catch(e){
                                  controller.process.value=false;
                                VxToast.show(context, msg: e.toString(),position: VxToastPosition.top);
                            }
                            }
                          } ).box.width(context.screenWidth-50).make(),
                  ),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  ourButton(color: lightGolden,title: signup,textColor: redColor,onpress: (){
                    Get.to(()=>SignupScreen());
                  }).box.width(context.screenWidth-50).make(),
                  10.heightBox,
                  loginwith.text.color(fontGrey).make(),
                  10.heightBox,
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(socialconstlist.length, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socialconstlist[index],width: 30,),
                      ),
                    )),
                  )

                ],
              ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadow.make(),
            )
          ],
        ),
      ),
    ));
  }
}

