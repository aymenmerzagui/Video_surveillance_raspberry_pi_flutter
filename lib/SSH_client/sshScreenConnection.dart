import 'package:flutter/material.dart';
import 'sshClient.dart';
class sshConnectionScreen extends StatefulWidget {
  const sshConnectionScreen({Key? key}) : super(key: key);

  @override
  State<sshConnectionScreen> createState() => _sshConnectionScreenState();
}

class _sshConnectionScreenState extends State<sshConnectionScreen> {
  final ipadressController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("connect via ssh"),
      ),
      body:Column(
        children: [
          TextField(
            controller:ipadressController ,
            decoration: InputDecoration(
              labelText: 'ipAdress',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller:usernameController ,
            decoration: InputDecoration(
              labelText: 'username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller:passwordController ,
            decoration: InputDecoration(
              labelText: 'password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: ()=>
             Navigator.push(context, MaterialPageRoute(builder: (context) =>
                 SshScreen( ipAddress: ipadressController.text,username: usernameController.text,password: passwordController.text,)))
          , child: Text('Connect'))
          
        ],
      ) ,
    );
  }
}
