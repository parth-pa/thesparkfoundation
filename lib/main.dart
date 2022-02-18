import 'package:bankapp/Screens/Intropage.dart';
import 'package:bankapp/Screens/TransectionHistory.dart';
import 'package:bankapp/Screens/TransferMoney.dart';
import 'package:bankapp/Screens/alluser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

mixin DefaultFirebaseOptions {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/1',
      routes: {
        '/1': ((context) => const intro()),
        '/2': ((context) => AllUser()),
        '/3': ((context) => const TransferMoney()),
        '/4': ((context) => const TransactionHistory()),
      },
    );
  }
}
