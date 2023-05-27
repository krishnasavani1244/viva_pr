import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krishna_1879/Model/joke_Model.dart';
import 'package:krishna_1879/cantroller/joke_controller.dart';

import 'package:provider/provider.dart';

import '../../Model/joke_Model.dart';

class detail_page extends StatefulWidget {
  const detail_page({Key? key}) : super(key: key);

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {





  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text(
          "Random Joke Generator",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,

          ),
        ),
      ),
      body: Consumer<JokeController>(builder:(context,value,_){
          return FutureBuilder<JokeModel>(
              future: value.getJoke(),
              builder: (context,snapshot){
            if(snapshot.hasData){
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50,
                horizontal: 16,
              ),
                child: Column(
                  children: [
                    Image.network(snapshot.data!.icon_url,
                    height: 100,
                    width: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(snapshot.data!.id,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(snapshot.data!.value,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),)

                  ],
                ),

              );
            }else{
              return Center(
                child: CircularProgressIndicator()
              );
            }

      });
      }
      )
    );
  }
}