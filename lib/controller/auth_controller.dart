import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/roots/app_routes.dart';
import 'package:pizza_app/model/user_model.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var verificationId = ''.obs;
  var isLoading = false.obs;
  var isLoggedOut = false.obs;
  
  // User data storage
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;

  // Step 1: Send OTP
Future<void> sendOtp(String phone) async {
  try {
    isLoading(true);

    // Ensure phone is in E.164 format
    if (!phone.startsWith("+")) {
      phone = "+92$phone"; // Assuming Pakistan as default country code
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        print("phone number verified : ${credential.smsCode}");
        Get.snackbar(
          "Success", 
          "Phone number verified automatically!",
          backgroundColor: Colors.green, // Green color for success
          colorText: Colors.white,
        );
      },
      verificationFailed: (FirebaseAuthException e) {
       Get.snackbar(
          "Error", 
          e.message ?? "Verification failed",
          backgroundColor: Colors.red, // Red color for error
          colorText: Colors.white,
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        Get.toNamed(AppRoutes.otp);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        
      },
    );
  } catch (e) {
    Get.snackbar("Error", e.toString());
  } finally {
    isLoading(false);
  }
}


  // Step 2: Verify OTP
  Future<void> verifyOtp(String otp) async {
    try {
      isLoading(true);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Save user data after successful OTP verification
      await saveUserData(userCredential.user!.uid);

      Get.snackbar("Success", "Phone verified successfully!",
      backgroundColor: Colors.green, // Green color for success
          colorText: Colors.white,
      );
      Get.offAllNamed(AppRoutes.dashboard);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
        backgroundColor: Colors.red, // Red color for error
          colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
  // **Step 3: Login (Direct Dashboard)**
  Future<void> loginUser(String phone, ) async {
    try {
      isLoading(true);
      QuerySnapshot userQuery = await _firestore
          .collection("users")
          .where("phone", isEqualTo: phone)
          .get();

      if (userQuery.docs.isNotEmpty) {
        Get.snackbar("Success", "Login successful!",
        backgroundColor: Colors.green, // Green color for success
          colorText: Colors.white,);
        Get.offAllNamed(AppRoutes.dashboard); // Direct dashboard per
      } else {
        Get.snackbar("Error", "Invalid phone number or password",
        backgroundColor: Colors.red, // Red color for error
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
  Future<void> logout() async {
    try {
      await _auth.signOut();
      isLoggedOut(true);
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar("Error", "Failed to log out: ${e.toString()}");
    }
  }

  // Step 3: Save User Data in Firestore
  Future<void> saveUserData(String uid) async {
  DocumentSnapshot userDoc = await _firestore.collection("users").doc(uid).get();

  if (!userDoc.exists) { // Check if user data already exists
    UserModel user = UserModel(
      id: uid,
      firstName: firstName.value,
      lastName: lastName.value,
      email: email.value,
      phone: phoneNumber.value,
      password: password.value, // Store password securely (hash it if possible)
    );

    await _firestore.collection("users").doc(uid).set(user.toMap());
  }
}

}