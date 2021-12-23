import 'package:flutter/material.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/ui/components/single/course_thumb.dart';

class CourseList extends StatelessWidget {
  final List<Course> courses;
  CourseList({this.courses});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
          padding: const EdgeInsets.only(top: 0, bottom: 20, left: 10, right: 10),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Card(
              elevation: 5,
              child: CourseThumb(course: courses[index])),
          itemCount: courses.length
      ),
    );
  }
}

class CourseListWeb extends StatelessWidget {
  final List<Course> courses;
  CourseListWeb({this.courses});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
          padding: const EdgeInsets.only(top: 0, bottom: 20, left: 10, right: 10),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 5),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Card(
              elevation: 5,
              child: CourseThumb(course: courses[index])),
          itemCount: courses.length
      ),
    );
  }
}
