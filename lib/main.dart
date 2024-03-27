import 'package:crud/RIVER.dart';
import 'package:crud/Riverrrrr.dart';
import 'package:crud/adduser.dart';
import 'package:crud/api.dart';
import 'package:crud/banner.dart';
import 'package:crud/deletepage.dart';
import 'package:crud/edituser.dart';
import 'package:crud/homepage.dart';
import 'package:crud/logins/logins.dart';
import 'package:crud/otp.dart';
import 'package:crud/phone.dart';
import 'package:crud/product_page.dart';
import 'package:crud/signup.dart';
import 'package:crud/splashscreen.dart';
import 'package:crud/total_page.dart';
import 'package:crud/useredit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logins/login_login.dart';

var w;
var h;
var username;
final users = Provider<int>((ref) {
  return 1;
});
final a = StateProvider<int>((ref) => 0);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        home: productPage(),
      ),
    );
  }
}
