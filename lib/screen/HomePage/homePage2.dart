import 'package:flutter/material.dart';
import 'package:mobile_app/common/widgets/customAppBar.dart';
import 'package:mobile_app/screen/HomePage/Widgets/homePagePosts.dart';

class HomePageTimeline extends StatelessWidget {
  static const routeName = '/homePageFeeds';
  const HomePageTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              height: size.width * 0.3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return StoriesFeed();
                  },
                  itemCount: 10),
            ),
            const Divider(
              endIndent: 5,
              indent: 10,
              thickness: 1,
            ),
            HomePagePosts(
                onTapComments: () {},
                messageTime: '. 10 minutes ago',
                threeDots: '...',
                threeDotsOnTap: () {},
                userHandle: '@Faithia ',
                onTapLike: () {},
                onTapShares: () {},
                onTapUserPic: () {},
                post:
                    'Who else has visited this new water park that just opened? Well,I have and I had so much fun there.'),
            HomePagePosts(
                onTapComments: () {},
                messageTime: '. 10 minutes ago',
                threeDots: '...',
                threeDotsOnTap: () {},
                userPicAssetImage: 'assets/images/postPic.png',
                userHandle: '@Faithia ',
                onTapLike: () {},
                onTapShares: () {},
                onTapUserPic: () {},
                post: 'Found a new spot.'),
            HomePagePosts(
                onTapComments: () {},
                messageTime: '. 10 minutes ago',
                threeDots: '...',
                threeDotsOnTap: () {},
                userHandle: '@Faithia ',
                onTapLike: () {},
                onTapShares: () {},
                onTapUserPic: () {},
                post:
                    'Who else has visited this new water park that just opened? Well,I have and I had so much fun there.'),
            HomePagePosts(
                onTapComments: () {},
                messageTime: '. 10 minutes ago',
                threeDots: '...',
                threeDotsOnTap: () {},
                userHandle: '@Faithia ',
                userPicAssetImage: 'assets/images/postPic.png',
                onTapLike: () {},
                onTapShares: () {},
                onTapUserPic: () {},
                post: 'Found a new spot.'),
          ],
        ),
      ),
    );
  }
}

class StoriesFeed extends StatelessWidget {
  const StoriesFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
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
        )
      ],
    );
  }
}
