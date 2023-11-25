import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../util/constants/colors.dart';
import '../auth_screens/signin_screen.dart';


class YawoWalkThrough extends StatefulWidget {
  static String tag = '/T11WalkThroughScreen';

  const YawoWalkThrough({super.key});

  @override
  YawoWalkThroughState createState() => YawoWalkThroughState();
}

class YawoWalkThroughState extends State<YawoWalkThrough> {
  List<WalkThrough> walkThroughList = generateWalkSections();

  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  bool onLastPage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: context.width(),
                  height: context.height(),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: walkThroughList.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          SizedBox(height: context.statusBarHeight + 50),
                          Image.asset(walkThroughList[i].image, fit: BoxFit.cover, width: context.width()),
                          16.height,
                          Text(walkThroughList[currentIndexPage].title, style: boldTextStyle(size: 24)),
                          16.height,
                          Text(
                            walkThroughList[currentIndexPage].subtitle,
                            style: secondaryTextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                    onPageChanged: (value) {
                      setState(()  {
                        currentIndexPage = value;
                        onLastPage = (value == 2);
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DotIndicator(pageController: pageController, pages: walkThroughList, indicatorColor: mainColor, dotSize: 7.0,),
                      SizedBox(width: 30,),
                    ],
                  ),
                ),

                onLastPage ?
                    Positioned(
                        bottom: 28,
                        right: 20,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return const SignInScreen();
                              })
                            );
                          },
                          child: Text("Done", style: TextStyle(color: mainColor, fontSize: 16),),
                        )

                    )
                    :
                Positioned(
                  bottom: 28,
                    right: 20,
                    child: TextButton(
                        onPressed: (){
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                        child: Text("Next", style: TextStyle(color: mainColor, fontSize: 16),)
                    )
                ),


                Positioned(
                  top: context.statusBarHeight + 10,
                  right: 10,
                  child: TextButton(
                    child: Text('Skip', style: boldTextStyle(size: 14, color: Colors.grey)),
                    onPressed: () {
                      const SignInScreen().launch(context);
                    },
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 20),
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                //   decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: radius(40)),
                //   child: Icon(Icons.arrow_forward, color: Colors.blue, size: 40),
                // ).onTap(() {
                //   if (currentIndexPage == 2) {
                //     finish(context);
                //   }
                //   pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                //   setState(() {});
                // }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



List<WalkThrough> generateWalkSections() {
  List<WalkThrough> allWalkThroughScreen = [];
  allWalkThroughScreen.add(WalkThrough.name("assets/images/1.png", 'Discover and Connect', 'Explore and Connect with travelers\nworldwide in a vibrant group'));
  allWalkThroughScreen.add(WalkThrough.name('assets/images/2.png', 'Share Adventures', 'Share your moments and inspire\nothers with your travel stories'));
  allWalkThroughScreen.add(WalkThrough.name('assets/images/3.png', 'Travel Safe Anywhere', 'Enjoy peace of mind with our safety\nfeatures, ensuring a secure journey'));
  return allWalkThroughScreen;
}

class WalkThrough {
  var image;
  var title;
  var subtitle;

  WalkThrough.name(this.image, this.title, this.subtitle);
}

