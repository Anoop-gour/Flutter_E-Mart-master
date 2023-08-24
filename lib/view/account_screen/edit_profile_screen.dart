
import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';
import 'package:emart_app/widget_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {

    var controller  = Get.put(ProfileController());
    controller.nameController.text =data['name'];
    var formkey = GlobalKey<FormState>();

    return bgWidget(
    child:   Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: whiteColor
          ),
        ),
        body: Obx(() =>
           Form(
             key: formkey,
             child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                20.heightBox,
                data['imageUrl']=='' && controller.imagePath.value.isEmpty
                    ?Image.asset(imgUnkownProfile,width: 100,fit: BoxFit.cover,).box.margin(EdgeInsets.all(8)).clip(Clip.antiAlias).size(100, 100).roundedFull.make()
                  :controller.imagePath.value.isEmpty
                    ?Image.network(data['imageUrl'],width: 100,fit: BoxFit.cover,).box.clip(Clip.antiAlias).size(100, 100).roundedFull.make()
                :Image.file(File(controller.imagePath.value),width: 100,fit: BoxFit.cover,).box.clip(Clip.antiAlias).size(100, 100).roundedFull.make(),

                10.heightBox,
                ourButton(onpress: (){
                  controller.changeImage(context);
                },title: 'Select image',color: redColor,textColor: whiteColor),
                10.heightBox,
                customTextField(title: name, hint: nameHint, controller: controller.nameController, validator: (value){
                  if(value==''){
                    return 'This field is required!';
                  }
                }),
                10.heightBox,
                customTextField(title: oldPass, hint: passwordHint, controller: controller.oldPassController,obscureText: true,
                validator: (value){
                  if(value==''){
                    return 'This field is required';
                  }
                }),
                10.heightBox,
                customTextField(title: newPass, hint: passwordHint, controller: controller.newPassController,obscureText: true,validator: (value){
                  if(value==''){
                    return 'This field is required';
                  }
                }),
                30.heightBox,
                controller.isLoading.value
                ?CircularProgressIndicator(color: redColor,)
                :SizedBox(
                  width: context.screenWidth,
                  child: ourButton(title: 'Save', textColor: whiteColor, color: redColor,onpress: ()async{
                    if(formkey.currentState!.validate()){
                      controller.isLoading.value = true;

                      if(controller.profileImageLink.isNotEmpty){
                        await controller.uploaProfileImage();
                        VxToast.show(context, msg: 'Profile image updated');
                      }else{
                        controller.profileImageLink = data['imageUrl'];
                        print('Image found');
                      }

                      if(data['password'] == controller.oldPassController.text) {
                        await controller.changeAuthPassword(
                            email: data['email'],
                            password: controller.oldPassController.text,
                            context: context,
                            newPassword: controller.newPassController.text
                        );
                        await controller.uploadProfile(
                            imgUrl: controller.profileImageLink);
                        VxToast.show(context, msg: 'Profile Updated');
                        Get.back();
                      }else{
                        VxToast.show(context, msg: 'Old password not matched');
                        controller.isLoading.value = false;
                      }
                    }else return;
                  }),
                ),
                10.heightBox
              ],
          ).box.white.roundedSM.padding(EdgeInsets.symmetric(horizontal: 12)).margin(EdgeInsets.symmetric(horizontal: 10)).shadowSm.make(),
           ),
        ),
      )
    );
  }
}
