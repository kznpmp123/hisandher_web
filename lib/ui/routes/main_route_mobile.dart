import 'package:flutter/material.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:kzn/ui/components/combine/app_drawer.dart';
import 'package:kzn/ui/components/combine/course_list.dart';
import 'package:kzn/ui/components/combine/intro_slider.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainRouteMobile extends StatefulWidget {
  static const routeName = '/main_route';
  @override
  _MainRouteMobileState createState() => _MainRouteMobileState();
}

class _MainRouteMobileState extends State<MainRouteMobile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<CourseProvider>(context,listen: false).getCourseListForOneTime();
    //Provider.of<UserProvider>(context,listen: false).login(username: "admin", password: "admin");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child: Text("His's and Her's Learning", style: TextStyle(fontSize: 18.0,
              color: Colors.black
          )),
        ),
          actions: [Container(
            margin: EdgeInsets.only(
              top: 7,
              bottom: 10,
              right: 7,
            ),
            width: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                )),
                overlayColor: MaterialStateProperty.all(Colors.black12),
              ),
              onPressed: () async {
                try {
                  await launch('https://www.facebook.com/hisandhermyanmar');
                } catch (e) {
                  print(e);
                }
              },

              child: FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.indigo,
                size: 20,
              ),
            ),
          ),
            Container(
              margin: EdgeInsets.only(
                top: 7,
                bottom: 10,
                right: 7,
              ),
              width: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  )),
                  overlayColor: MaterialStateProperty.all(Colors.black12),
                ),
                onPressed: () async {
                  try {
                    await launch('https://m.me/hisandhermyanmar');
                  } catch (e) {
                    print(e);
                  }
                },
                child: FaIcon(
                  FontAwesomeIcons.facebookMessenger,
                  color: Colors.indigo,
                  size: 20,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                top: 7,
                bottom: 10,
                right: 7,
              ),
              width: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  )),
                  overlayColor: MaterialStateProperty.all(Colors.black12),
                ),
                onPressed: () async {
                  try {
                    await launch('https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/hiss-and-hers-knowledge-vlogs');
                  } catch (e) {
                    print(e);
                  }
                },
                child: FaIcon(
                  FontAwesomeIcons.bloggerB,
                  color: Colors.indigo,
                  size: 20,
                ),
              ),
            ),

          ]
      ),


      body: ListView(
        children: [
          IntroSlider(photos: introSliderImages,),
          _courseListFutureBuilder(),
        ],
      ),
      drawer: AppDrawer(),
      // floatingActionButton: AppFab(),
    );
  }

  // 1 Course List Future Builder
  Widget _courseListFutureBuilder(){
    return FutureBuilder(
        future: Provider
            .of<CourseProvider>(context, listen: true)
            .courseList,
        builder: (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0){
              return Container(child: Center(child: Text('no course')),);
            }
            else{
              return  CourseList(courses: snapshot.data) ;
            }
          }
          else if (snapshot.hasError) {
            //_refreshController.refreshCompleted();
            return Container(child: Center(
                child: Text('error ${snapshot.error.toString()}')),);
          }
          else {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('loading courses...')),);
          }
        }
    );
  }
}
