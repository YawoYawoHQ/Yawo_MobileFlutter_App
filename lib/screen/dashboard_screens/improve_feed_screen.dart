import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../util/constants/colors.dart';



class ImproveFeedScreen extends StatefulWidget {
  static const routeName = '/improve-feed';
  const ImproveFeedScreen({super.key});

  @override
  State<ImproveFeedScreen> createState() => _ImproveFeedScreenState();
}

class _ImproveFeedScreenState extends State<ImproveFeedScreen> {

  List<String> tourismTypes = ['Eco Tourism', 'Cultural Tourism', 'Luxury Tourism', 'Medical Tourism', 'Religious Tourism', 'Volunteer Tourism', 'Beach Tourism', 'City Tourism', 'Mountain Tourism', 'Wildlife Tourism', 'Camping & Adventure' ];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: bgNeutralColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: bgNeutralColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                const SizedBox(height: 50,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 20),
                //       child: IconButton(onPressed: () {
                //         Navigator.pop(context);
                //       },
                //           icon: Icon(Icons.arrow_back)),
                //     )
                //   ],
                // ),
                // const SizedBox(height: 60,),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text("Improve Your Feed", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                  ],
                ),
                const SizedBox(height: 15,),
                const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("By choosing your favorite tags, you help\nus know you better and your taste", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54),),

                    ]
                ),
                const SizedBox(height: 30,),

              //  Add a 3x3 Grid layout with picture cards

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 8.0,

                    ),

                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index){
                      return _buildPictureCard('${tourismTypes[index]}', 'assets/images/tourism/jos.jpg');
                      // return _buildPictureCard('${tourismTypes[index]}', 'assets/images/tourism/$index.png');
                    },
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget _buildPictureCard(String title, String imagePath) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -7, // Adjust the distance from the bottom as needed
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
  // Function to build a picture card with a title at the bottom
  // Widget _buildPictureCard(String title, String imagePath) {
  //   return Card(
  //     clipBehavior: Clip.antiAlias,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(2.0),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: <Widget>[
  //         Expanded(
  //           child: Image.asset(
  //             imagePath,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //
  //       ],
  //     ),
  //
  //   );
  // }

