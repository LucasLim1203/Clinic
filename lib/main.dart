import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:petfinder_user/providers/pets_provider.dart';
import 'package:petfinder_user/providers/theme_provider.dart';
import 'package:petfinder_user/root_screen.dart';
import 'package:petfinder_user/screens/inner_screen/pet_details.dart';
import 'package:petfinder_user/screens/inner_screen/viewed_recently.dart';

import 'consts/theme_data.dart';
import 'providers/user_provider.dart';
import 'providers/viewed_recently_provider.dart';
import 'providers/wishlist_provider.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';
import 'screens/inner_screen/wishlist.dart';
import 'screens/search_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: SelectableText(snapshot.error.toString()),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return ThemeProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return PetsProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return WishlistProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ViewedPetProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return UserProvider();
              }),
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Pet Finder',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                home: const RootScreen(),
                // home: const LoginScreen(),
                routes: {
                  RootScreen.routeName: (context) => const RootScreen(),
                  PetDetailsScreen.routName: (context) =>
                      const PetDetailsScreen(),
                  WishlistScreen.routName: (context) => const WishlistScreen(),
                  ViewedRecentlyScreen.routName: (context) =>
                      const ViewedRecentlyScreen(),
                  RegisterScreen.routName: (context) => const RegisterScreen(),
                  LoginScreen.routeName: (context) => const LoginScreen(),
                  SearchScreen.routeName: (context) => const SearchScreen(),
                },
              );
            }),
          );
        });
  }
}