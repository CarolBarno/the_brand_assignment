import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thebrandassignment/model/constants.dart';
import 'package:thebrandassignment/provider/image_text_provider.dart';

class DesignTexts extends StatefulWidget {
  String picture;
  DesignTextProvider d;

  DesignTexts(this.picture, this.d);

  @override
  _DesignTextsState createState() => _DesignTextsState();
}

class _DesignTextsState extends State<DesignTexts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                3 * widthm, 5 * heightm, 3 * widthm, 3 * widthm),
            child: Column(
              children: [
                Container(
                  height: 15 * heightm,
                  width: 30 * widthm,
                  child: Image.network(
                      'https://itsthebrand.com/taswira.php?width=500&height=500&quality=100&cropratio=1:1&image=/v/uploads/gallery/${widget.picture}'),
                ),
                SizedBox(
                  height: 3 * heightm,
                ),
                widget.d.getDesignTextData() != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.d.getDesignTextData().length,
                        itemBuilder: (BuildContext context, int index) {
                          List<DesignText> imd =
                              widget.d.getDesignTextData();
                          List t = json.decode(imd[index].text);
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: t.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${t[index]['text']}'),
                                  Divider(),

                                ],
                              );
                            },
                          );
                        })
                    : Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 2 * heightm,
                        ),
                        Image.asset(
                          'assets/images/sad.png',
                          height: 10 * heightm,
                          width: 10 * widthm,
                          color: Colors.grey[500],
                        ),
                        SizedBox(
                          height: 2 * heightm,
                        ),
                        Text(
                          'No texts found for this design',
                          style: TextStyle(
                            fontSize: 2.5 * textm,
                            color: Colors.grey[800],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 4 * heightm,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 40 * widthm,
                      height: 6 * heightm,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(2 * widthm),
                        color: Colors.orangeAccent,
                      ),
                      child: MaterialButton(
                        disabledColor: Colors.grey,
                        padding: EdgeInsets.fromLTRB(3 * widthm,
                            3 * widthm, 3 * widthm, 3 * widthm),
                        onPressed: ()  {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 6 * widthm,
                            ),
                            SizedBox(
                              width: 2 * widthm,
                            ),
                            Text(
                              'Reload',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 2.2 * textm,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
