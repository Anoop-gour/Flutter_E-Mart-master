import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/services/fiirestore_services.dart';
import 'package:emart_app/view/account_screen/details_card.dart';
import 'package:emart_app/view/account_screen/edit_profile_screen.dart';
import 'package:emart_app/view/auth_screen/login_screen.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return bgWidget(
       child:  Scaffold(
      body: StreamBuilder(
        stream: FirestoreServices.getUser(FirebaseAuth.instance.currentUser?.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          // var data;
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(color: redColor,),);
          }else {
                var data = snapshot.data!.docs.first;
                 debugPrint('----------------------------------------------------------User data found');

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:
                     Column(
                      children: [
                        // 20.heightBox,
                        Row(
                          children: [

                            data['imageUrl']==''
                            ?Image.asset(imgUnkownProfile,width:80,fit: BoxFit.cover,).box.margin(EdgeInsets.symmetric(vertical: 15)).size(80, 80).roundedFull.clip(Clip.antiAlias).make( )
                            :Image.network(data['imageUrl'],width:80,fit: BoxFit.cover,).box.margin(EdgeInsets.symmetric(vertical: 15)).roundedFull.size(80, 80).clip(Clip.antiAlias).make( ),
                            (Get.height*.01).widthBox,
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                '${data['name']}'.text.semiBold.white.make(),
                                (Get.height*.005).heightBox,
                                '${data['email']}'.text.white.make(),
                                (Get.height*.005).heightBox,
                              ],
                            )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Align(alignment: Alignment.topRight,child: Icon(Icons.edit,color: Colors.white,size: 30,)).onTap(() {Get.to(()=> EditProfileScreen(data: data,));}),
                                (Get.height*.005).heightBox,
                                OutlinedButton(
                                    onPressed: ()async{
                                      await Get.put(AuthController()).signOutMethod(context: context);
                                      await Get.offAll(()=> LoginScreen());
                                      Get.reset();
                                    },
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: whiteColor
                                        )
                                    ),
                                    child: 'logout'.text.white.semiBold.make()),
                              ],
                            ),
                            (Get.height*.01).widthBox
                          ],
                        ),
                        // 20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            detailsCard(title: 'in your cart', count: '${data['cart_count']}'),
                            detailsCard(title: 'in your wishlist', count: '${data['whishlist']}'),
                            detailsCard(count: '${data['order']}', title: 'you ordered'),
                          ],
                        ),
                        (Get.height*.01).heightBox
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
            );
          }}
      )
    )
    );
  }
}
