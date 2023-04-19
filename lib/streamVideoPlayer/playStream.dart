import 'package:flutter/material.dart';
import 'package:untitled1/second.dart';
class playStream extends StatefulWidget {
  const playStream({Key? key}) : super(key: key);

  @override
  State<playStream> createState() => _playStreamState();
}

class _playStreamState extends State<playStream> {
  final urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream'),),
      body: Column(
        children: [
          Text('Donner url'),
          TextField(
            controller: urlController,
            decoration: InputDecoration(
              labelText: 'Stream',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  VideoPlayerScreen(videoUrl: urlController.text,)))
              , child: Text('Connect'))

        ],
      ),
    );
  }
}