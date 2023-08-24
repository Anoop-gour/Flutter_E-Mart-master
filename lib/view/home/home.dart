import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/home_controller.dart';
import 'package:emart_app/view/account_screen/profile_screen.dart';
import 'package:emart_app/view/catogories_screen/category_screen.dart';
import 'package:emart_app/view/home_screen/Home_screen.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {
   Home({super.key});

  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    var navbarItem =[
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,),label:home ),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,),label:catogories ),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,),label:cart ),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,),label:account),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      Container(color: Colors.black,),
      ProfileScreen(),
    ];

    return Scaffold(
      body: Column(children: [
        Obx(()=> Expanded(child: navBody.elementAt(homeController.currentNavIndex.value)))]),
      bottomNavigationBar:
        Obx(()=>
           BottomNavigationBar(
             currentIndex: homeController.currentNavIndex.value,
            type: BottomNavigationBarType.fixed,
             selectedItemColor: redColor,
             selectedLabelStyle: TextStyle(fontFamily: semibold),
             backgroundColor: whiteColor,
             onTap: (value){homeController.currentNavIndex.value=value;},
             items: navbarItem,
          ),
        ),
    );
  }
}
