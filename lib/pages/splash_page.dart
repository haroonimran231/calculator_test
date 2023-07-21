import 'package:calculator_test/pages/calculator_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  // static var routeName;

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Calculator()));
    });
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Calculator",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2.0),
                ),
                Text("App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2.0)),
                Lottie.asset(
                  'assets/svgs/calculator.json',
                  repeat: true,
                  height: 250,
                  width: 250,
                  // child: Text('${book.id}'),
                ),
              ],
            ),

            // Image.asset(
            //   "assets/images/splash.png",
            //   height: 160.0,
            //   width: 160,
            // ),
          ],
        ),
      ),
    );
  }
}
