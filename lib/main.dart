import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/binding/auth_binding.dart';
import 'package:randomdog/binding/detail_screen_nav_binding.dart';
import 'package:randomdog/binding/drawer_binding.dart';
import 'package:randomdog/binding/setting_switch_binding.dart';
import 'package:randomdog/screen/detail_screen.dart';
import 'package:randomdog/screen/home_screen.dart';
import 'package:randomdog/screen/landing_screen.dart';
import 'package:randomdog/screen/login_screen.dart';
import 'package:randomdog/screen/registor_screen.dart';
import 'package:randomdog/screen/setting_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      //home: HomeScreen(),
      initialRoute: landingRoute,
      getPages: getPageList,
    );
  }
}

///Route::GetPage
const String homeRoute = "/home";
const String detailRoute = "/detail";
const String settingRoute = "/setting";
const String landingRoute = "/landing";
const String registorRoute = "/registor";
const String loginRoute = "/login";
const String loginWithEmailRoute = "/login/email";
final List<GetPage> getPageList = [
  GetPage(
    name: homeRoute,
    page: () => HomeScreen(),
    bindings: [
      DrawerBinding(homeRoute),
    ],
  ),
  GetPage(
    name: detailRoute,
    page: () => DetailScreen(),
    bindings: [
      DrawerBinding(detailRoute),
      DetailScreenNavBinding(),
    ],
  ),
  GetPage(name: settingRoute, page: () => SettingScreen(), bindings: [
    SettingSwitchBinding(),
  ]),
  GetPage(
    name: landingRoute,
    page: () => LandingScreen(),
  ),
  GetPage(
      name: registorRoute,
      //bindings: [AuthBinding()],
      page: () => AuthScreen(
            loginDescription: "Enter your email and set a password",
            buttonName: "Registor",
          )),
  GetPage(
      name: loginWithEmailRoute,
      //bindings: [AuthBinding()],
      page: () => AuthScreen(
            loginDescription: "Login with email and password",
            buttonName: "Login",
          )),
  GetPage(name: loginRoute, page: () => LoginScreen()),
];

///Theme::LightTheme
ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light()
        .copyWith(primary: const Color.fromRGBO(2, 125, 253, 1)),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
      actionsIconTheme: IconThemeData(color: Colors.grey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(elevation: MaterialStateProperty.all(0))),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.grey,
      textColor: Colors.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        labelStyle: TextStyle(
          color: Colors.black54,
        )));
