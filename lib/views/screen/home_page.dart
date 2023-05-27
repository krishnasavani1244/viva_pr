import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cantroller/theme_provider.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text(
          "Jokes App",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,

          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Provider.of<ThemeProvider>(context,listen:false).changeTheme();
          },
            icon: Icon(Icons.sunny),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/laugh.png"),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('detail_page');
                },
                child: Text(
                  "Fetch My Laugh",
                ))
          ],
        ),
      ),
    );
  }
}
