import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_tech/provider/app_provider.dart';
import 'package:quadb_tech/screen/splash_screen.dart';

void main() {
  runApp(const FlutterTest());
}

class FlutterTest extends StatelessWidget {
  const FlutterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Test',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
