import 'package:flutter/material.dart';
import 'package:untitled1/streamVideoPlayer/playStream.dart';
import 'SSH_client/sshScreenConnection.dart';
import 'list_video.dart';
import 'package:firebase_core/firebase_core.dart';
import 'second.dart';
import 'firebase_options.dart';
import 'WelcomeScreen.dart';
import 'authentification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PCD APP',
        initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/auth': (context) => SignInScreen(),
       // '/home': (context) => VideoListScreen(),
        '/home' : (context) =>playStream()

      },
    );
  }
}