import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: FadeInUp(
        from: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Banking App',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/pale-bank.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildcard(
                    context,
                    'All User',
                    () => Navigator.pushNamed(context, '/2'),
                    'assets/customer.png'),
                buildcard(
                    context,
                    'Transfer Money',
                    () => Navigator.pushNamed(context, '/3'),
                    'assets/money-transfer.png')
              ],
            ),
            Card(
              margin: const EdgeInsets.all(25),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/4'),
                child: Container(
                  height: size.height * .2 + 20,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/transaction-history.png',
                          height: 90, fit: BoxFit.cover),
                      const Spacer(),
                      const Text('Transaction History',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1)),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildcard(
    BuildContext context, String title, Function() onPressed, String imageUrl) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: onPressed,
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      child: Container(
        height: size.height * .2 + 20,
        width: size.width * .4,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(12.5),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              imageUrl,
              height: 60,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1)),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}
