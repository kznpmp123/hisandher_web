import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionRoute extends StatefulWidget {
  static const routeName = '/subscription_route';
  @override
  _SubscriptionRouteState createState() => _SubscriptionRouteState();
}

class _SubscriptionRouteState extends State<SubscriptionRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Subscription", style: TextStyle(fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.black
        )),),
      body: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
              //   child: ElevatedButton(style: TextButton.styleFrom(
              //       primary: Colors.blue,
              //     ),
              //         onPressed: () => launch("tel://09954055655"),
              //         child: new Text("Admin ထံသို့ ဖုန်းခေါ်ရန် နှိပ်ပါ", style: TextStyle(color: Colors.white), )),
              // ),


              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 200, right: 250, left: 350),
                child: Text("Admin 09954055655 ထံသို့ ဆက်သွယ် အတန်းအပ်ပြီး သင်ခန်းစာများကို လေ့လာနိုင်ပါတယ် ခင်ဗျာ"),
              ),),

              // Expanded(child: Text("To see this course, please contact to admin")),
          ],),
      // floatingActionButton: AppFab(),
    );
  }
}


