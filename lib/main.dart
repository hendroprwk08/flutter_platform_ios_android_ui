import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'Platform';
  String desc = 'iOS dan Android Design';

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      body: Center(
          child: isIOS
              ? CupertinoButton.filled(
              child: Text(title),
              onPressed: showPlatformDialog
          )
              : ElevatedButton(
              child: Text(title),
              onPressed: showPlatformDialog
          )
      ),
    );
  }

  Future showPlatformDialog() async {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    if(isIOS){
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(desc),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          )
      );
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(desc),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          )
      );
    }
  }
}
