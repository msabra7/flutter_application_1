// ignore_for_file: file_names, unused_import, avoid_function_literals_in_foreach_calls, prefer_const_constructors, unused_local_variable, avoid_unnecessary_containers, empty_catches, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'dart:math' as math;

// ignore: must_be_immutable
class ContributorTile extends StatelessWidget {
  var name;
  var description;
  var description2;
  var image;
  var cvAvail;
  var cv;
  ContributorTile(this.name, this.description, this.description2, this.image,
      this.cvAvail, this.cv,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showInfo(data) {
      final _aboutdialog = StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Column(
              children: [Text(name), Text(description)],
            ),
            content: Container(
                height: 250,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Directionality(
                    child: Text(description2),
                    textDirection: TextDirection.rtl,
                  ),
                  cvAvail
                      ? InkWell(
                          onTap: () {
                            // Navigator.of(context).push(new MaterialPageRoute(
                            //     builder: (_) => PDFView(cv)));
                          },
                          child: Text(
                            'سيرة ذاتية',
                            style: TextStyle(color: Colors.blue),
                          ))
                      : Container(height: 0)
                ]))));
      });
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => _aboutdialog);
    }

    return GestureDetector(
        onTap: () {
          showInfo('test');
        },
        child: Container(
            width: 100,
            height: 100,
            color: Color(0xFFCCAF41),
            // elevation: 10,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 110.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                        // shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                      child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "Bahij",
                    ),
                  )),
                  Center(
                      child: Text(
                    description,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: "Bahij",
                    ),
                  ))
                ],
              ),
            )));
  }
}
