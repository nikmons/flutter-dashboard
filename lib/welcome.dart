import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_front/widgets/ui/dashboard.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Gentelella Flutter Template',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Quicksand',
          //primarySwatch: Colors.purple,
          appBarTheme: AppBarTheme(
            color: Color(0xffEDEDED),
          ),
          primaryTextTheme: TextTheme(
            title: TextStyle(
              color: Color(0xff73879C),
              fontWeight: FontWeight.bold,
            ),
          )
      ),
      home:  DashboardWidget(),



    );
  }
}