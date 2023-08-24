
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/view/home_screen/featured_button.dart';
import 'package:emart_app/widget_common/Home_buttons.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: context.screenHeight*0.075,
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    border: InputBorder.none,
                    hintText: search,
                    hintStyle: TextStyle(
                        color: textfieldGrey
                    )
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics:BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        itemCount: slidersList.length,
                        height: context.screenHeight*.15,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        // autoPlayAnimationDuration: Duration(seconds: 1),
                        itemBuilder: (context, index){
                          return Image.asset(
                            slidersList[index],
                            fit: BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 1)).make();
                        }
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(2, (index) => HomeButton(
                        height: Get.height*0.15,
                        width: Get.width/2.5,
                        icon: index == 0?icTodaysDeal:icFlashDeal,
                        title: index == 0?todayDeal:flashSale,
                      )),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                        itemCount: slidersList.length,
                        height: context.screenHeight*.15,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        // autoPlayAnimationDuration: Duration(seconds: 1),
                        itemBuilder: (context, index){
                          return Image.asset(
                            secondSlidersList[index],
                            fit: BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 1)).make();
                        }
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: List.generate(3, (index) =>
                          HomeButton(
                              title: index == 0?topCatogories: index == 1?brand:topSeller,
                              icon: index == 0?icTopCategories: index == 1?icBrands:icTopSeller,
                              width: Get.width/3.5,
                              height: Get.height*.13)),
                    ),

                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                        child: featuredCatogories.text.color(darkFontGrey).size(18).fontFamily(bold).make()),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) => Column(
                          children: [
                            featuredButton(title: featuredTitles1.elementAt(index),icon: featuredImages1.elementAt(index)),
                            10.heightBox,
                            featuredButton(title: featuredTitles2.elementAt(index),icon: featuredImages2.elementAt(index)),
                            ],
                        )),
                      ),
                    ),
                    //featured products
                    20.heightBox,
                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: redColor
                      ),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProducts.text.white.fontFamily(bold).size(18).make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(6, (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(imgP1,width: 150,fit: BoxFit.cover,),
                                  10.heightBox,
                                  'Laptop 4GB/64GB'.text.semiBold.make(),
                                  10.heightBox,
                                  'Rs 600'.text.color(redColor).fontFamily(semibold).size(16).make()
                                ],
                              ).box.roundedSM.white.margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(8)).make()),
                            ),
                          )
                        ],
                      ),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                        itemCount: slidersList.length,
                        height: context.screenHeight*.15,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        // autoPlayAnimationDuration: Duration(seconds: 1),
                        itemBuilder: (context, index){
                          return Image.asset(
                            secondSlidersList[index],
                            fit: BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 1)).make();
                        }
                    ),

                    //All Products
                    20.heightBox,
                    GridView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 300,

                        ),
                        itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Vx.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imgP5,width: 200,fit: BoxFit.fill,),
                            const Spacer(),
                            10.heightBox,
                            'Bag'.text.semiBold.make(),
                            10.heightBox,
                            'Rs 500'.text.color(redColor).size(18).make()
                          ],
                        ),
                      );
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
