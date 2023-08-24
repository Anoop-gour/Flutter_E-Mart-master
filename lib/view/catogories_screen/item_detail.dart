import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widget_common/our_button.dart';

class ItemDetail extends StatelessWidget {
   final String? title;
   ItemDetail({Key? key, required this.title}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: title?.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(itemCount: 2, itemBuilder: (context, index){
                    return Image.asset(imgFc5, width: double.infinity, fit: BoxFit.cover,);
                  }),
                  10.heightBox,
                  title!.text.color(darkFontGrey).semiBold.make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (value){},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,),
                  10.heightBox,
                  'Rs 500'.text.color(redColor).fontFamily(bold).size(18).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            mainAxisAlignment : MainAxisAlignment.center,
                        children: [
                          'Seller'.text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          'In House Brands'.text.fontFamily(semibold).color(darkFontGrey).make()
                        ],
                      )),
                      CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Icon(Icons.message_rounded,color: darkFontGrey,),
                      )
                    ],
                  ).box.height(60).color(textfieldGrey).padding(EdgeInsets.symmetric(horizontal: 16)).make(),
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: 'Color: '.text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(3, (index) =>
                                VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomColor)
                                    .margin(EdgeInsets.symmetric(horizontal: 6))
                                    .make()),
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                      //Quantity
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: 'Quantity: '.text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children:[
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                              '0'.text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                              '(0 Available)'.text.color(textfieldGrey).make()
                            ]
                          ),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      //Total
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: 'Total: '.text.color(textfieldGrey).make(),
                          ),
                          '\$0.00'.text.color(redColor).size(16).bold.make()

                        ],
                      ).box.padding(EdgeInsets.all(8)).make()
                    ],
                  ).box.white.shadowSm.make(),
                  20.heightBox,

                  //Description section
                  'Description'.text.color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  'This is dummy item and dummy description here '.text.color(textfieldGrey).make(),

                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(itemDetailsList.length, (index) => ListTile(
                      title: itemDetailsList[index].text.semiBold.color(darkFontGrey).make(),
                      trailing: Icon(Icons.arrow_forward),
                    )),
                  ),
                  10.heightBox,
                  productsmayyouLike.text.bold.color(darkFontGrey).make(),
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
          )),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(color: redColor,title: 'Add to Cart',onpress: (){},textColor: whiteColor),
          )
        ],
      ),
    );
  }
}
