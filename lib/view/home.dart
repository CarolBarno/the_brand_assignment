import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:thebrandassignment/model/constants.dart';
import 'package:thebrandassignment/provider/design_details_provider.dart';
import 'package:thebrandassignment/provider/images_provider.dart';
import 'package:thebrandassignment/view/image_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagesProvider>.value(value: ImagesProvider()),
        ChangeNotifierProvider<DesignDetailsProvider>.value(value: DesignDetailsProvider())
      ],
      child: Builder(builder: (context) {
        final imageList = Provider.of<ImagesProvider>(context);
        final imageDetails = Provider.of<DesignDetailsProvider>(context);
        return SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: true,

                leading: Icon(
                  Icons.menu,
                  color: Colors.grey[500],
                  size: 6 * widthm,
                ),
                bottom: TabBar(
                  indicatorColor: teal,
                  indicatorWeight: 3,
                  tabs: [
                    //category 1
                    Tab(
                      child: Text(
                        'Category 1',
                        style: TextStyle(
                          fontSize: 1.7 * textm,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    //category 2
                    Tab(
                      child: Text(
                        'Category 2',
                        style: TextStyle(
                          fontSize: 1.7 * textm,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    //category 3
                    Tab(
                      child: Text(
                        'Category 3',
                        style: TextStyle(
                          fontSize: 1.7 * textm,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    //category 4
                    Tab(
                      child: Text(
                        'Category 4',
                        style: TextStyle(
                          fontSize: 1.7 * textm,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.deepOrange,
                      size: 6 * widthm,
                    ),
                  ),
                ],
              ),
              body: TabBarView(
                children: [
                  ///Category 1
                  SingleChildScrollView(
                    child: Container(
//                      height: MediaQuery.of(context).size.height,
                      color: Colors.grey[100],
                      padding: EdgeInsets.fromLTRB(
                          4 * widthm, 1 * heightm, 2 * widthm, 0),
                      child: Column(
                        children: [
                          SizedBox(height: 1 * heightm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'New Designs',
                                    style: TextStyle(
                                        fontSize: 2.3 * textm,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Browse our latest designs',
                                    style: TextStyle(
                                        fontSize: 2 * textm,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.grey[600],
                                size: 6 * widthm,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.4 * heightm,
                          ),
                          imageList.isFetching
                              ? Center(
                                  child: spinKitBlack,
                                )
                              : imageList.getImagesData() != null
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.7,
                                      ),
                                      itemCount:
                                          imageList.getImagesData().length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        List<Images> im =
                                            imageList.getImagesData();
                                        return InkWell(
                                          onTap: () async {
                                            await imageDetails.getDesignDetails(im[index].catalogId, im[index].designId).then((value) =>
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        child: ImageDetails(imageDetails),
                                                        type: PageTransitionType.fade)
                                                )
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Image.network(
                                                  'https://itsthebrand.com/taswira.php?width=500&height=500&quality=100&cropratio=1:1&image=/v/uploads/gallery/${im[index].picture}'),
                                              SizedBox(
                                                height: 0.1 * heightm,
                                              ),
                                              Text(
                                                '${im[index].title}',
                                                style: TextStyle(
                                                    fontSize: 2 * textm),
                                              ),
                                            ],
                                          ),
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
                                    'No images found',
                                    style: TextStyle(
                                      fontSize: 2.5 * textm,
                                      color: Colors.grey[800],
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),

                  ///Category 2
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey[100],
                      ),
                    ],
                  ),

                  ///Category 3
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey[100],
                      ),
                    ],
                  ),

                  ///Category 4
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey[100],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
