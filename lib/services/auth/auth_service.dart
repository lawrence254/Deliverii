import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   User? getCurrentUser(){
     return _firebaseAuth.currentUser;
   }
//Sign in
   Future<UserCredential> signInWithEmailandPassword (String email, password) async{
     try{
       UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
       return userCredential;
     }on FirebaseAuthException catch(e){
       throw Exception(e.code);
     }
   }
//Sign  Up
   Future<UserCredential> signUpWithEmailandPassword (String email, password) async{
     try{
       UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
       return userCredential;
     }on FirebaseAuthException catch(e){
       throw Exception(e.code);
     } 
   }

   //Sign Out
Future<void> signOut() async{
     return await _firebaseAuth.signOut();
}
}