import 'dart:async';

import 'package:bankapp/Screens/Intropage.dart';
import 'package:bankapp/Screens/TransectionHistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({Key? key}) : super(key: key);

  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  final controller = TextEditingController(text: "0.00");

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('user').orderBy('id').snapshots();

  String? sender;
  String? reciver;

  CollectionReference ref =
      FirebaseFirestore.instance.collection('Transection');

  addTransaction() async {
    await ref.add({
      'sender': sender,
      'reciver': reciver,
      'Payment Amount': controller.text,
      'Date And Time': DateTime.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => intro()));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Transfer Money',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              FadeInDown(
                from: 100,
                duration: Duration(milliseconds: 1000),
                child: NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                    color: Colors.pink.withOpacity(0.2),
                    shape: NeumorphicShape.concave,
                    boxShape: const NeumorphicBoxShape.circle(),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/pale-bank.png',
                    width: 110,
                    height: 110,
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInUp(
                          from: 60,
                          delay: Duration(milliseconds: 100),
                          duration: Duration(milliseconds: 1000),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Colors.lightBlue[100],
                            margin: const EdgeInsets.only(right: 50, left: 50),
                            elevation: 8,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Sender',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      letterSpacing: 1.3,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15, top: 20, bottom: 40),
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[200],
                                  ),
                                  child: DropdownButton(
                                    value: sender,
                                    isExpanded: true,
                                    hint:
                                        const Text('Please Select Sender Name'),
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.deepPurple,
                                    ),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 0,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        sender = newValue!;
                                      });
                                    },
                                    items: snapshot.data?.docs
                                        .map<DropdownMenuItem<String>>(
                                            (DocumentSnapshot document) {
                                      return DropdownMenuItem<String>(
                                        value: document['name'],
                                        child: Text(
                                          document['name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              letterSpacing: 0.5),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInUp(
                          from: 30,
                          duration: Duration(milliseconds: 1000),
                          child: Image.asset(
                            'assets/icons8-up-down-arrow-64.png',
                            fit: BoxFit.cover,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInUp(
                          from: 60,
                          duration: Duration(milliseconds: 1000),
                          child: Card(
                            elevation: 8,
                            shadowColor: Colors.lightBlue[100],
                            margin: const EdgeInsets.only(left: 50, right: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Reciver',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      letterSpacing: 1.3,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15, top: 25, bottom: 40),
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[200],
                                  ),
                                  child: DropdownButton(
                                    value: reciver,
                                    isExpanded: true,
                                    hint: const Text(
                                      'Please Select Reciver Name',
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.deepPurple,
                                    ),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 0,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        reciver = newValue!;
                                      });
                                    },
                                    items: snapshot.data?.docs
                                        .map<DropdownMenuItem<String>>(
                                            (DocumentSnapshot document) {
                                      return DropdownMenuItem<String>(
                                        value: document['name'],
                                        child: Text(
                                          document['name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              letterSpacing: 0.5),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: FadeInUp(
                      from: 60,
                      duration: const Duration(milliseconds: 1000),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Amount",
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                        keyboardType: TextInputType.number,
                        controller: controller,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        onSubmitted: (value) {
                          setState(() {
                            controller.text = value + ".00";
                          });
                        },
                        onTap: () {
                          setState(() {
                            if (controller.text == "0.00") {
                              controller.text = "";
                            } else {
                              controller.text = controller.text
                                  .replaceAll(RegExp(r'.00'), '');
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        child: MaterialButton(
                          onPressed: () {
                            addTransaction();
                            Timer(
                              Duration(seconds: 3),
                              () => showdialoge(context),
                            );
                            showdialoge(context);
                          },
                          minWidth: double.infinity,
                          height: 50,
                          child: const Text(
                            "Send",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }

  Future<dynamic> showdialoge(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => TransactionHistory()));
          });
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/57767-done.json',
                    height: 200, width: 200, repeat: false),
                Text(
                  "Payment Success".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 25,
                      letterSpacing: 1,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          );
        });
  }
}
