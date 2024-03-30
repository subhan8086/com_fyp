import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp_pro/Bloc/News_bloc.dart';
import 'package:fyp_pro/firebase_options.dart';
import 'package:fyp_pro/screen/favorite_news_provider.dart';
import 'package:fyp_pro/screen/splash.dart';
import 'package:provider/provider.dart';
//firebase cpnnection//start//
void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
      MultiProvider(
        providers: [
          Provider<NewsBloc>(create: (_) => NewsBloc()),
  ChangeNotifierProvider(create: (_) => FavoriteNewsProvider()),
         // Provider<NewsBloc>(create: (_) => NewsBloc()),
          // other providers if any
        ],

        child: MyApp(),
      ));

}
//firebase cpnnection//END//
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter FYP',
      // theme: ThemeData(
      //  // brightness: Brightness.dark,
      //          primaryColor: Colors.purple,
      // // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //
      // ),
      home: const splash(),
    );
  }
}


