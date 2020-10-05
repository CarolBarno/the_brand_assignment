import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:thebrandassignment/model/constants.dart';
import 'package:thebrandassignment/provider/design_details_provider.dart';
import 'package:thebrandassignment/provider/image_text_provider.dart';
import 'package:thebrandassignment/view/design_text.dart';

class ImageDetails extends StatefulWidget {
  DesignDetailsProvider d;

  ImageDetails(this.d);

  @override
  _ImageDetailsState createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DesignTextProvider>.value(
            value: DesignTextProvider()),
      ],
      child: Builder(builder: (context) {
        final textList = Provider.of<DesignTextProvider>(context);

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 6 * widthm,
                  color: Colors.grey[500],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'MarketPlace',
                style: TextStyle(
                    fontSize: 2.3 * textm,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w800),
              ),
              actions: [
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey[500],
                      size: 6 * widthm,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey[500],
                      size: 6 * widthm,
                    ),
                  ],
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.fromLTRB(
                    3 * widthm, 3 * heightm, 3 * widthm, 3 * widthm),
                child: widget.d.getDesignDetailsData() != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.d.getDesignDetailsData().length,
                        itemBuilder: (BuildContext context, int index) {
                          List<DesignDetails> imd =
                              widget.d.getDesignDetailsData();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 15 * heightm,
                                        width: 30 * widthm,
                                        child: Image.network(
                                            'https://itsthebrand.com/taswira.php?width=500&height=500&quality=100&cropratio=1:1&image=/v/uploads/gallery/${imd[index].picture}'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 4 * widthm,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${imd[index].title}',
                                          style: TextStyle(
                                              fontSize: 2.5 * textm,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87),
                                        ),
                                        SizedBox(
                                          height: 1 * heightm,
                                        ),
                                        Text(
                                          '${imd[index].alias}',
                                          style: TextStyle(
                                              fontSize: 2.3 * textm,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green),
                                        ),
                                        SizedBox(
                                          height: 2 * heightm,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 27 * widthm,
                                              height: 6 * heightm,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        4 * widthm),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.2 * widthm),
                                              ),
                                              child: MaterialButton(
                                                padding: EdgeInsets.fromLTRB(
                                                    3 * widthm,
                                                    3 * widthm,
                                                    3 * widthm,
                                                    3 * widthm),
                                                onPressed: () {},
                                                child: Text(
                                                  'Category 1',
                                                  style: TextStyle(
                                                    fontSize: 2.2 * textm,
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2 * widthm,
                                            ),
                                            Container(
                                              width: 28 * widthm,
                                              height: 6 * heightm,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        4 * widthm),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.2 * widthm),
                                              ),
                                              child: MaterialButton(
                                                padding: EdgeInsets.fromLTRB(
                                                    3 * widthm,
                                                    3 * widthm,
                                                    3 * widthm,
                                                    3 * widthm),
                                                onPressed: () {},
                                                child: Text(
                                                  'Category 2',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 2.2 * textm,
                                                    color: Colors.grey[500],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2 * heightm,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 45 * widthm,
                                    height: 6 * heightm,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(2 * widthm),
                                      color: Colors.green,
                                    ),
                                    child: MaterialButton(
                                      disabledColor: Colors.grey,
                                      padding: EdgeInsets.fromLTRB(3 * widthm,
                                          3 * widthm, 3 * widthm, 3 * widthm),
                                      onPressed: () async {
                                        await textList.getDesignText(imd[index].id).then((value) =>
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    child: DesignTexts(imd[index].picture, textList),
                                                    type: PageTransitionType.fade)
                                            )
                                        );
                                      },
                                      child: Text(
                                        'Button',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 2.2 * textm,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2 * heightm,
                              ),
                              Divider(),
                              SizedBox(
                                height: 2 * heightm,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${imd[index].category}',
                                    style: TextStyle(
                                        fontSize: 2 * textm,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    '${imd[index].public}',
                                    style: TextStyle(
                                        fontSize: 2 * textm,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    '${imd[index].addDate}',
                                    style: TextStyle(
                                        fontSize: 2 * textm,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    '${imd[index].viewNum}',
                                    style: TextStyle(
                                        fontSize: 2 * textm,
                                        color: Colors.black87),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4 * heightm),
                              Divider(),
                              SizedBox(
                                height: 2 * heightm,
                              ),
                              Container(
                                child: Image.network(
                                  'https://itsthebrand.com/taswira.php?width=500&height=500&quality=100&cropratio=1:1&image=/v/uploads/gallery/${imd[index].picture}',
                                  height: 30 * heightm,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 2 * heightm,
                              ),
                              Text(
                                '${imd[index].description}',
                                style: TextStyle(
                                    fontSize: 2 * textm, color: Colors.black87),
                              ),
                            ],
                          );
                        },
                      )
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
                            'No details found for this design',
                            style: TextStyle(
                              fontSize: 2.5 * textm,
                              color: Colors.grey[800],
                            ),
            )
            ],
          ))),
          ),
        );
      }),
    );
  }
}
