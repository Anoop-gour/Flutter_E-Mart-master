import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';
import 'package:emart_app/widget_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imgProfile, width: 100,fit: BoxFit.cover,).box.clip(Clip.antiAlias).roundedFull.make(),
            10.heightBox,
            ourButton(onpress: (){},title: 'Update',color: redColor,textColor: whiteColor),
            10.heightBox,
            customTextField(title: name, hint: nameHint),
            10.heightBox,
            customTextField(title: password, hint: passwordHint),
            10.heightBox,
            ourButton(title: 'Save', textColor: whiteColor, color: redColor,onpress: (){}),
            10.heightBox
          ],
        ).box.white.roundedSM.padding(EdgeInsets.symmetric(horizontal: 12)).margin(EdgeInsets.symmetric(horizontal: 10)).shadowSm.make(),
      )
    );
  }
}
