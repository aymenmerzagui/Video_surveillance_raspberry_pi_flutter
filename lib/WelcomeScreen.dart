import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello brother'),),
      body: Column(children: [
        Text('getStarted'),
        SizedBox(height: 10,),
        ElevatedButton(onPressed : (){
         Navigator.pushNamed(context, '/auth');
  }
        ,child: Text('sign in'))
      ],),
    );
  }
}
