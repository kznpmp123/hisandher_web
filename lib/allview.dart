import 'package:flutter/material.dart';
import 'package:kzn/responsive.dart';
import 'package:kzn/ui/routes/main_route_mobile.dart';
import 'ui/routes/main_route_mobile.dart';
import 'ui/routes/main_route_web.dart';

class AllView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        // Let's work on our mobile part
        mobile: MainRouteMobile(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: MainRouteWeb(),
            ),
            // Expanded(
            //   flex: 9,
            //   child: CourseRoute(),
            // ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 3 : 4,
              child: MainRouteWeb(),
            ),
            // Expanded(
            //   flex: _size.width > 1340 ? 3 : 5,
            //   child: CourseRoute(),
            // ),
            // Expanded(
            //   flex: _size.width > 1340 ? 10 : 10,
            //   child: EmailScreen(),
            // ),
          ],
        ),
      ),
    );
  }
}
