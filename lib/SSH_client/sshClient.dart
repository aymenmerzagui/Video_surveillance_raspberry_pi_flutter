import 'package:flutter/material.dart';
import 'package:ssh2/ssh2.dart';

class SshScreen extends StatefulWidget {
  final String ipAddress;
  final String username;
  final String password;

  SshScreen({
    required this.ipAddress,
    required this.username,
    required this.password,
  });

  @override
  _SshScreenState createState() => _SshScreenState();
}

class _SshScreenState extends State<SshScreen> {
  final _commandController = TextEditingController();
  SSHClient? _ssh;


  String _output = '';

  @override
  void initState() {
    super.initState();

    _connectToSsh();
  }

  Future<void> _connectToSsh() async {
    _ssh = SSHClient(
      host: widget.ipAddress,
      port: 22,
      username: widget.username,
      passwordOrKey: widget.password,

    );
    try {
      await _ssh?.connect();
    } on Exception catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _executeCommand() async {
    final command = _commandController.text.trim();

    if (command.isNotEmpty) {
      try {
        final result = await _ssh?.execute(command);
        setState(() {
          _output = result!;
        });
      } on Exception catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  void dispose() {
    _ssh?.disconnect();
    _commandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SSH'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _commandController,
              decoration: InputDecoration(
                labelText: 'Command',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _executeCommand,
              child: Text('Execute'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_output),
              ),
            ),
          ],
        ),
      ),
    );
  }
}