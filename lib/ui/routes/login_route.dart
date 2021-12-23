import 'package:flutter/material.dart';
import 'package:kzn/data/models/user.dart';
import 'package:kzn/providers/user_provider.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

import 'main_route_mobile.dart';
import 'main_route_web.dart';

class LoginRoute extends StatefulWidget {
  static final routeName = "/login_route";

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute>
    with SingleTickerProviderStateMixin {
  String username;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("[Route] LoginRoute");
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // heading
            Container(
              height: size.height / 4,
              //color: Colors.white,
              child: Stack(
                children: [
                  // custom painter
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomPaint(
                      size: Size(size.width / 2, size.height / 4),
                      // painter: CustomCardShapePainter(
                      //     startColor: Colors.black,
                      //     endColor: Colors.black),
                    ),
                  ),
                  // app title logo
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Container(
                  //     width: size.width * 0.2,
                  //     child: AppLogoWidget(),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      //color: Colors.green,
                      // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 100,
                      child: Image(
                        image: AssetImage('assets/images/appicon.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // login form
            Column(
              children: [
                // username input
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.white)
                        ),
                    child: TextField(
                      onChanged: (String str) {
                        setState(() {
                          username = str;
                        });
                      },
                      //style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors.white)
                            ),
                        focusedBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors.white)
                            ),
                        disabledBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors.red)
                            ),
                        hintText: 'Enter username',
                        labelText: 'Username',
                        //hintStyle: TextStyle(color: Colors.white),
                        //labelStyle: TextStyle(color: Colors.white),
                        //fillColor: Colors.white
                      ),
                    ),
                  ),
                ),
                // password input
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.white)
                        ),
                    child: TextField(
                      obscureText: true,
                      onChanged: (String str) {
                        setState(() {
                          password = str;
                        });
                      },
                      //style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors.white)
                            ),
                        focusedBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors.white)
                            ),
                        disabledBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors.red)
                            ),
                        hintText: '****',
                        labelText: 'Password',
                        //hintStyle: TextStyle(color: Colors.white),
                        //labelStyle: TextStyle(color: Colors.white),
                        //fillColor: Colors.white
                      ),
                    ),
                  ),
                ),
                // sign in button
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        print('login onTap');
                        // validate username and password
                        //if(this.username == null || username = "" || password == null || password = ""){

                        //}
                        if (username == "" ||
                            password == "" ||
                            username == null ||
                            password == null) {
                          print('invalid input value');
                          return;
                        }
                        loginAccount(
                            username: username,
                            password: password,
                            context: context);
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.indigo[900], Colors.indigo[900]]),
                          border: Border.all(color: Colors.indigo[900]),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: MaterialButton(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // forget password text link
                Builder(
                  builder: (context) => InkWell(
                    onTap: () {
                      print('Forget Password onTap');
                      forgetPassword(context);
                    },
                    child: Container(
                        // padding: EdgeInsets.only(right: 600, top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // don't have an account, register here
            Container(
              //height: size.height /6,
              //color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text("Don't have an account? Register Here"),
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        print('register onTap');
                        registerAccount(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text("Don't have an account ?  Register Here",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // login status
          ],
        ),
      ),
    );
  }

  void forgetPassword(BuildContext context) {
    print('forgetPassword is called');
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("📞 to reset password, please contact to admin."),
    ));
  }

  void registerAccount(BuildContext context) {
    print('registerAccount is called');

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("📞 to register account, please contact to admin."),
    ));

    // Navigator.pushNamed(context, SignUpRoute.routeName);
  }

  void loginAccount(
      {String username, String password, BuildContext context}) async {
    print('loginAccount is called with username $username, password $password');

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("signing in..."),
    ));
    //Navigator.pushNamedAndRemoveUntil(context, MainRoute.routeName, (route) => false);
    print("signing in START");
    User user = await Provider.of<UserProvider>(context, listen: false)
        .login(username: username, password: password);
    print("signing in END");
    print(user);
    if (user == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("❌ Login Fail ❌ "),
      ));
    } else {
      Navigator.pushReplacementNamed(context, MainRouteMobile.routeName);
    }
  }
}

class CustomCardShapePainter extends CustomPainter {
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter({@required this.startColor, @required this.endColor});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double radius = 24;
    Paint paint = Paint();
    paint.shader =
        ui.Gradient.linear(Offset(0, size.height), Offset(size.width, 0), [
      //HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      startColor,
      endColor
    ]);

    final double w = size.width;
    final double h = size.height;
    final pointOneX = -w * 0.2;
    final pointOneY = h * 0.4;

    final pointTwoX = w * 0.4;
    final pointTwoY = h * 0.5;

    final pointThreeX = w * 0.7;
    final pointThreeY = h * 0.6;

    final pointFourX = w * 0.7;
    final pointFourY = h * 0.7;

    final pointFiveX = w * 0.7;
    final pointFiveY = h * 0.9;

    final pointSixX = w * 1.0;
    final pointSixY = h * 1.0;

    Path path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(pointOneX, pointOneY, pointTwoX, pointTwoY)
      ..quadraticBezierTo(pointThreeX, pointThreeY, pointFourX, pointFourY)
      ..quadraticBezierTo(pointFiveX, pointFiveY, pointSixX, pointSixY)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      /*
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)

       */
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //throw UnimplementedError();
    return true;
  }
}

class AppLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/app_icon.png'),
      fit: BoxFit.fitWidth,
    );
  }
}
