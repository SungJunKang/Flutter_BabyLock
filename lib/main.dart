import 'package:flutter/material.dart';
import 'package:babylock/routes.dart' as routes;

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ), 
      routes: routes.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height / 1.3;
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main/main_inactivation.jpg'),
            fit: BoxFit.cover
          )
        ),

        child: Container(
          height: deviceHeight,
          
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: GridView.count(
          primary: false,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          
          children: <Widget>[
            FlatButton(
              
              child: Image.asset('assets/main/main_screenlock.png'),
              onPressed: () {},
            ),
            FlatButton(
              child: Image.asset('assets/main/main_unlockalert.png'),
              onPressed: () {},
            ),
            FlatButton(
              child: Image.asset('assets/main/main_playlist.png'),
              onPressed: () {
                Navigator.pushNamed(context, '/playlist');
              },
            ),
            FlatButton(
              child: Image.asset('assets/main/main_bluelight.png'),
              onPressed: () {},
            ),
            FlatButton(
              child: Image.asset('assets/main/main_tutorial.png'),
              onPressed: () {
                Navigator.pushNamed(context, '/tutorial');
              },
            )
          ],
          ),
        ),
      ),
    );
  }
}