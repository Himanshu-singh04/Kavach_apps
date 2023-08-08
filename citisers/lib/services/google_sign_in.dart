import 'package:citisers/database/userDatabase/insert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        User user = userCredential.user!;

        final result = await insertUserData(
          name: user.displayName!,
          email: user.email!,
        );
        if (result == 'Something went wrong while inserting data') {
          print('Something went wrong while inserting data');
        }
        print(userCredential); //

        // if (userCredential.user != null) {
        //   // if (userCredential.additionalUserInfo!.isNewUser) {
        //   //   // Basically a currently created new user}
        //   Navigator.of(context)
        //       .pushNamedAndRemoveUntil(home_page, (route) => false);
        // }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
