
import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController{

  var imagePath = ''.obs;
  var profileImageLink = '';
  var isLoading = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  changeImage(context)async{
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(img==null) return;
      imagePath.value = img!.path;

    }on PlatformException catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }


  uploaProfileImage()async{
    var filename = basename(imagePath.value);
    var destination = 'images/${currentUser?.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(imagePath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  uploadProfile({name, password, imgUrl})async{
    var store = firestore.collection(userCollection).doc(currentUser?.uid);
    await store.update({
      'name' : nameController.text,
      'password' : newPassController.text,
      'imageUrl' : imgUrl,
  });
    isLoading.value = false;
  }

  changeAuthPassword({email, password, newPassword, context})async{
    final cred = EmailAuthProvider.credential(email: email,password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((error){
      print(error.toString);
      VxToast.show(context, msg: error.toString());
      isLoading.value = false;
    });
    isLoading.value = false;
  }
}