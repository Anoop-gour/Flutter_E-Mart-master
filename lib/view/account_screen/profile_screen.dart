import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/view/account_screen/details_card.dart';
import 'package:emart_app/view/account_screen/edit_profile_screen.dart';
import 'package:emart_app/view/auth_screen/login_screen.dart';
import 'package:emart_app/widget_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                5.heightBox,
                Align(alignment: Alignment.topRight,child: Icon(Icons.edit,color: Colors.white,)).onTap(() {Get.to(()=> EditProfileScreen());}),
                Row(
                  children: [
                    Image.asset(imgProfile,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make( ),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Dummy user'.text.semiBold.white.make(),
                        5.heightBox,
                        'Customer@example.com'.text.white.make(),
                        5.heightBox,
                        // currentUser!.uid.text.make()
                      ],
                    )),
                    OutlinedButton(
                        onPressed: ()async{
                          await Get.put(AuthController()).signOutMethod(context: context);
                          Get.offAll(()=> LoginScreen());
                        },
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: whiteColor
                            )
                        ),
                        child: 'logout'.text.white.semiBold.make()),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    detailsCard(title: 'in your cart', count: '00'),
                    detailsCard(title: 'in your wishlist', count: '25'),
                    detailsCard(count: 85, title: 'you ordered'),
                  ],
                ),
              ],
            ),
          ),
            // 40.heightBox,

            ListView.separated(
              shrinkWrap: true,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: Image.asset(profileButtonIcon[index],height: 22 ,),
                    title: profileButtonList[index].text.color(darkFontGrey).semiBold.make(),
                  );
                },
                separatorBuilder: (context, index){
                  return Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profileButtonList.length)
                .box.margin(EdgeInsets.all(12)).rounded.white.padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make()
            .box.color(redColor).make()
          ],
        ),
      ),
    ));
  }
}
