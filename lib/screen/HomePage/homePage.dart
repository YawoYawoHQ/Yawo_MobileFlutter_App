import 'package:flutter/material.dart';
import 'package:mobile_app/screen/HomePage/Widgets/suggestedForYouCards.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: InkWell(
                  onTap: () {},
                  child:  CircleAvatar(
                    radius: 27,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/Profiles.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 8),
                child: Container(child: const Text('Your story')),
              ),
              const SizedBox(
                height: 25,
              ),
              const Divider(
                endIndent: 5,
                indent: 10,
                thickness: 2,
              ),
              const SizedBox(
                height: 50,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to Yawo Yawo',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  //textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'When you follow people you will see the\n photos and videos they post here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black, letterSpacing: 0),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: size.width * 0.6,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    itemBuilder: (context, index) {
                      return SuggestedForYouCards();
                    },
                    separatorBuilder: (context, index) =>
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    itemCount: 7),
              )
            ],
          )),
    );
  }
}
