
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/view/catogories_screen/item_detail.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
   CategoryDetails({super.key, required this.title});
final String? title;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: title!.text.fontFamily(bold).make() ,
          iconTheme: IconThemeData(
            color: Vx.white
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:List.generate(6, (index) => 'Baby'.text.fontFamily(semibold).color(darkFontGrey).makeCentered().
                  box.roundedSM.size(120, 50).margin(EdgeInsets.symmetric(horizontal: 4)).white.make()),
                ),
              ),
              20.heightBox,
              Expanded(
                  child: GridView.builder(
                itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 250
                  ),
                  itemBuilder: (context, index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(imgP5,height:150,width:200, fit: BoxFit.fill,),
                        const Spacer(),
                        10.heightBox,
                        'Bag'.text.semiBold.make(),
                        10.heightBox,
                        'Rs 500'.text.color(redColor).size(18).make()
                      ],
                    ).box.roundedSM.color(whiteColor).clip(Clip.antiAlias).padding(EdgeInsets.all(8)).margin(EdgeInsets.symmetric(horizontal: 4)).make().onTap(() {
                      Get.to(() => ItemDetail(title: 'Dummy title'));
                    });
                  }))
            ],
          ),
        ),
      )
    );
  }
}
