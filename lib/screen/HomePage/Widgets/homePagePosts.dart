import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class HomePagePosts extends StatelessWidget {
  final void Function()? onTapUserPic;
  final String userHandle;
  final String messageTime;
  final String threeDots;
  final void Function()? threeDotsOnTap;
  final String post;
  final void Function()? onTapLike;
  //final String likes;
  // final String replies;
  // final String shares;

  final void Function()? onTapComments;
  final void Function()? onTapShares;
  final String? userPicAssetImage;
  //final void Function()? onTapUser;

  const HomePagePosts(
      {super.key,
      required this.onTapComments,
      required this.messageTime,
      required this.threeDots,
      required this.threeDotsOnTap,
      required this.userHandle,
      required this.onTapLike,
      required this.onTapShares,
      required this.onTapUserPic,
      this.userPicAssetImage,
      this.post = ''});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        ListTile(
          leading: InkWell(
            onTap: onTapUserPic,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).primaryColor,
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/Profiles.png'),
              ),
            ),
          ),
          title: SizedBox(
            width: 200,
            child: Row(children: [
              Flexible(child: Text(userHandle)),
              Flexible(
                  child: Text(
                messageTime,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
              )),
            ]),
          ),
          trailing: TextButton(
              onPressed: threeDotsOnTap,
              child: Text(
                threeDots,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            post,
            textAlign: TextAlign.start,
          ),
        ),
        if (userPicAssetImage != null)
          Image.asset(
            userPicAssetImage!,

            width: size.width * 0.9, // Adjust width as needed
            //height: 400, // Adjust height as needed
          ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ListTile(
                minLeadingWidth: 0,
                // contentPadding: EdgeInsets.zero,
                leading: GestureDetector(
                    onTap: onTapLike,
                    child: Icon(Icons.favorite_border_outlined, size: 15)),
                title: Text(
                  '40 likes',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ),
              ),
            ),
            Flexible(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 0,
                leading: GestureDetector(
                    onTap: onTapComments, child: Icon(Icons.comment, size: 15)),
                title: Text('25 replies',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 10)),
              ),
            ),
            Flexible(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 0,
                leading: GestureDetector(
                    onTap: onTapShares,
                    child: Icon(
                      Icons.share,
                      size: 15,
                    )),
                title: Text('10 shares',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 10)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
