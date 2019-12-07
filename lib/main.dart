import 'package:flutter/material.dart';
import 'package:play_with_me/object_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData.dark(),
    home: MyApp()));

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ObjectState>(
          create: (context)=>ObjectState(_width,_height),
        ),
      ],
      child: Container(
       child : Consumer<ObjectState>(
            builder: (_,data,child){
              return Stack(
                children: <Widget>[
                  Positioned(
                      left: data.width/2,
                      top: data.height/2,
                      child: FlutterLogo()),
                ],
              );
    }

        ),


      ),
    );
  }
}
