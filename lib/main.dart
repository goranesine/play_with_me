import 'package:flutter/material.dart';
import 'package:play_with_me/object_state.dart';
import 'package:play_with_me/painter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ObjectState>(
          create: (context) => ObjectState(),
        )
      ],
      child: MaterialApp(theme: ThemeData.dark(), home: MyApp()),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onPanUpdate: (details) {
              RenderBox renderBox = context.findRenderObject();

              Provider.of<ObjectState>(context, listen: false)
                  .addOffset(renderBox.globalToLocal(details.globalPosition));
            },
            onPanEnd: (details) {
              Provider.of<ObjectState>(context, listen: false).points.add(null);
            },
            child: Consumer<ObjectState>(
              builder: (context, data, child) {
                return CustomPaint(
                  size: Size(_width, _height),
                  painter: DrawingPainter(data.points),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
