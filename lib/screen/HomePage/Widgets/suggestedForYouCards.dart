import 'package:flutter/material.dart';

class SuggestedForYouCards extends StatelessWidget {
  const SuggestedForYouCards({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(26, 151, 147, 173),
          borderRadius: BorderRadius.circular(8),
        ),
        height: size.height * 0.6,
        width: size.width * 0.35,
        child: LayoutBuilder(
          builder: (context, constraints) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8, right: 8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.cancel_sharp,
                      size: 24,
                    ),
                  ),
                ),
                CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'assets/images/Profiles.png',
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Juliet Adams',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'UI/UX - God',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
