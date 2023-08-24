
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  RxBool process = false.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;

    try{
     userCredential = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text, );
    }on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString(),position: VxToastPosition.top);
    }
    return userCredential;
  }


  Future<UserCredential?> signupMethod({email, password, context}) async{
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString(),position: VxToastPosition.top);
    }
    return userCredential;

}


storeUserData({name, email, password, userId})async{
    DocumentReference store = await firestore.collection(userCollection).doc(userId);
    store.set({
      'name' : name,
      'password' : password,
      'email' : email,
      'imageUrl' : '',
      'id' : '${userId}'
    });
}


signOutMethod({context}) async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
}


}