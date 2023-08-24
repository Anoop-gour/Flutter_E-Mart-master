import 'dart:convert';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/models/category_model.dart';
import 'package:flutter/services.dart';

class ProductController extends GetxController{
  var subcat = [];

  getSubCategories(title)async{
    subcat.clear();
    var data = await rootBundle.loadString('lib/services/category_model.json');
    var decoded = await Categorymodel.fromJson(jsonDecode(data));
    var s = await decoded.categories?.where((element) => element.name==title).toList();
    List<String>? ss = s?.first.subcategory;
    for(var e in ss!){
      subcat.add(e);
    }

  }
}