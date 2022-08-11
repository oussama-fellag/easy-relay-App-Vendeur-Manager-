import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test12/Screens/Login/login_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:test12/providers/vendeur_provider.dart';

import 'bloc/vendeur_bloc.dart';
import 'constants.dart';
import 'models/models.dart';

void main() async {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VendeurBloc>(
          create: (context) => VendeurBloc(),
        ),
      ],
      child: ChangeNotifierProvider<VendeurProvider>(
        create: (context) => VendeurProvider(),
        lazy: false,
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Auth',
            theme: ThemeData(
                primaryColor: kPrimaryColor,
                scaffoldBackgroundColor: Color.fromARGB(255, 245, 240, 244),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: kPrimaryColor,
                    // shape: const StadiumBorder(),
                    //maximumSize: const Size(double.infinity, 56),
                    //minimumSize: const Size(double.infinity, 56),
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                  filled: true,
                  fillColor: kPrimaryColor.withOpacity(0.1),
                  iconColor: kPrimaryColor,
                  prefixIconColor: kPrimaryColor,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                )),
            home: SplashScreenView(
    navigateRoute: AfterSplash(),
    duration: 3000,
    imageSize: 200,
    imageSrc: "assets/images/easy_relay.jpg",
    backgroundColor: Colors.white,
    )
      ),)
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
