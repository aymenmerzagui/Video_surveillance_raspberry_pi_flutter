import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class playStream extends StatelessWidget {
  final String streamUrl='http://192.168.251.130:8081';


  void _launchURL() async {
    if (!await canLaunch(streamUrl)) {
      throw 'Could not launch $streamUrl';
    }
    await launch(streamUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Stream'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: const Text('Play Stream'),
        ),
      ),
    );
  }
}
