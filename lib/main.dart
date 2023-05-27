import 'package:flutter/material.dart';
import 'package:krishna_1879/Model/joke_Model.dart';
import 'package:krishna_1879/cantroller/joke_controller.dart';
import 'package:krishna_1879/views/screen/detail_page.dart';
import 'package:krishna_1879/views/screen/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Model/themeodel.dart';
import 'cantroller/theme_provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isdark = preferences.getBool('isdark') ?? false;
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=> ThemeProvider(themeModel:ThemeModel(isDarkMode:isdark ))),
        ChangeNotifierProvider<JokeController>(create:(_)=>JokeController())
      ],
        builder: (context,_){return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDarkMode == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          routes: {
            '/' : (context) => home_page(),
            'detail_page' : (context) => detail_page(),
          },
        );},)
  );
}
