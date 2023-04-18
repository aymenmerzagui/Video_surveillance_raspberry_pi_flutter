import 'package:flutter/material.dart';
import 'second.dart';

import 'main.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<List<String>> getVideoUrls() async {
  final storage = FirebaseStorage.instance;
  final result = await storage.ref().listAll();
  final urls = <String>[];

  for (final ref in result.items) {
    final url = await ref.getDownloadURL();
    urls.add(url);
  }

  return urls;
}


class VideoListScreen extends StatefulWidget {
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late Future<List<String>> _videoUrls;

  @override
  void initState() {
    super.initState();
    _videoUrls = getVideoUrls();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Videos enrégistrés'),
        ),
        body: FutureBuilder<List<String>>(
            future: _videoUrls,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final videoUrls = snapshot.data!;
                print(videoUrls);
                return ListView.builder(
                  itemCount: videoUrls.length,
                  itemBuilder: (context, index) {
                    final url = videoUrls[index];
                    return ListTile(
                      title: Text(url),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>VideoPlayerScreen( videoUrl: url,)));
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error fetching videos'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })


    );
  }
}
