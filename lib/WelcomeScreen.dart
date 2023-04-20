import 'package:flutter/material.dart';
/*class WelcomeScreen extends StatelessWidget {
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
}*/
import 'package:flutter/material.dart';
import 'package:untitled1/widgets/background-image.dart';
import 'components/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/pallete.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Container(

        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            BackgroundImage(
              image: 'assets/images/img.png',
            ),


            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome to MOTIONEYE !",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,color: kBlue,

                    ),
                  ),
                  SizedBox(height: size.height * 0.05),

                  SizedBox(height: size.height * 0.05),
                  RoundedButton(
                    text: "GET STARTED",
                    color: kBlue,
                    textColor: Colors.white,
                    press: () {
                        Navigator.pushNamed(context, '/auth');
                      },)


                    ],
              ),
            )
          ],
        ),
      ),
    );
  }
}