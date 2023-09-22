import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/st_menue.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StMenu()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg',height: 130,),
            const SizedBox(height: 30,),
            if(Platform.isIOS)
              const CupertinoActivityIndicator(
                radius: 20,
              )
            else
              const CircularProgressIndicator(
                color: Colors.black,
              ),
            const SizedBox(height: 30,),
            Text("Powered by"),
            Text("DEBUGGERS"),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Home'),
      ),
    );
  }
}

