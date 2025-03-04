import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pizza_app/model/user_model.dart';
import 'package:pizza_app/roots/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Reactive variables
  var isLoading = false.obs; // To track loading state
  var errorMessage = ''.obs; // To store error messages
  var isLoggedOut = false.obs;

  /// **Register User**
  Future<void> registerUser(UserModel user) async {
    try {
      isLoading(true); // Start loading
      errorMessage(''); // Clear any previous error

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: user.email, password: user.password);

      await firestore.collection("users").doc(userCredential.user!.uid).set(
          user.toMap());

      Get.snackbar("Success", "Registration successful!",
          snackPosition: SnackPosition.BOTTOM);

      // Navigate to login screen after successful registration
      Get.offAllNamed(AppRoutes.login);
    } on FirebaseAuthException catch (e) {
      handleAuthErrors(e);
    } catch (e) {
      errorMessage(e.toString()); // Set error message
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false); // Stop loading
    }
  }

  /// **Login with Phone Number & Password**
  Future<void> loginWithPhoneNumber(String phoneNumber, String password) async {
    try {
      isLoading(true); // Start loading
      errorMessage(''); // Clear any previous error

      QuerySnapshot querySnapshot = await firestore
          .collection("users")
          .where("phone", isEqualTo: phoneNumber) 
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        Get.snackbar("Login Failed", "No user found with this phone number.",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      var email = userData['email'];

      if (email == null || email.isEmpty) {
        Get.snackbar(
            "Login Failed", "No email associated with this phone number.",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Login using retrieved email and entered password
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Get.snackbar("Success", "Login successful!",
          snackPosition: SnackPosition.BOTTOM);

      // Navigate to dashboard after login
      Get.offAllNamed(AppRoutes.dashboard);
    } on FirebaseAuthException catch (e) {
      handleAuthErrors(e);
    } catch (e) {
      errorMessage(e.toString()); // Set error message
      Get.snackbar("Login Failed", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false); // Stop loading
    }
  }
  Future<void> logout() async {
    try {
      await _auth.signOut(); // Sign out the user
      isLoggedOut(true); // Update the reactive variable
      Get.offAllNamed(AppRoutes.login); // Navigate to the login screen
    } catch (e) {
      Get.snackbar("Error", "Failed to log out: ${e.toString()}");
    }
  
}
  /// **Handle Firebase Authentication Errors**
  void handleAuthErrors(FirebaseAuthException e) {
    String message = "An error occurred. Please try again.";

    switch (e.code) {
      case 'email-already-in-use':
        message = "This email is already registered. Try logging in.";
        break;
      case 'invalid-email':
        message = "Invalid email format. Please check and try again.";
        break;
      case 'weak-password':
        message = "Password is too weak. Please use a stronger password.";
        break;
      case 'user-not-found':
        message = "No user found with these credentials.";
        break;
      case 'wrong-password':
        message = "Incorrect password. Please try again.";
        break;
      case 'too-many-requests':
        message = "Too many login attempts. Try again later.";
        break;
    }

    errorMessage(message); // Set error message
    Get.snackbar("Error", message, snackPosition: SnackPosition.BOTTOM);
  }
}