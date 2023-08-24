import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/product_controller.dart';
import 'package:emart_app/view/catogories_screen/category_details.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return bgWidget(
     child: Scaffold(
         appBar: AppBar(
           elevation: 0,
           title: catogories.text.fontFamily(bold).make(),
         ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 200
              ),
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Image.asset(categoriesImage[index],height: 120,width: 200,fit: BoxFit.cover,),
                    10.heightBox,
                    '${categoriesList[index]}'.text.color(darkFontGrey).align(TextAlign.center).make()


                  ],
                ).box.roundedSM.white.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                  controller.getSubCategories(categoriesList[index]);
                  Get.to(CategoryDetails(title: categoriesList[index]));
                });
              }),
        )
      )
    );
  }
}
