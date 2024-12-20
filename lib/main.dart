import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Platform'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String nama;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Platform.isIOS
            ? CupertinoNavigationBar(
                backgroundColor: Colors.cyan,
                middle: Text(widget.title, style: TextStyle(color: Colors.white),),
              )
            : AppBar(
                backgroundColor: Colors.cyan,
                centerTitle: true,
                title: Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Platform.isIOS
                  ? CupertinoTextField(
                      placeholder: 'nama Lengkap',
                      placeholderStyle:
                          const TextStyle(color: CupertinoColors.inactiveGray),
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(CupertinoIcons.person),
                      ),
                      padding: const EdgeInsets.all(15),
                      onChanged: (value) => {nama = value},
                    )
                  : TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Siapa namamu?',
                        labelText: 'Nama Lengkap',
                      ),
                      onChanged: (value) => {nama = value},
                    ),
              const SizedBox(height: 20.0),
              Platform.isIOS
                  ? CupertinoButton.filled(
                      child: const Text('Simpan'),
                      onPressed: () {
                        showPlatformDialog(nama);
                      })
                  : ElevatedButton(
                      child: const Text('Simpan'),
                      onPressed: () {
                        showPlatformDialog(nama);
                      },
                    )
            ],
          ),
        ));
  }

  Future showPlatformDialog(String nama) async {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Namaku'),
              content: Text(nama),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Batal'),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Namaku'),
            content: Text(nama),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Batal'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
