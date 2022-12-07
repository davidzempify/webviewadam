import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => MyHomePage(title: 'title')

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        if (await controller.canGoBack()){
          controller.goBack();
          return false;
        }
        else{
          return true;
        }

      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async{
                controller.goBack();
              },
              icon: Icon(Icons.arrow_back_ios,color: Colors.black),
            )
          ],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://ph.yhb.org.il/es/',
          onWebViewCreated: (controller){
            this.controller=controller;
          },
        ),

      ),
    );
  }
}
