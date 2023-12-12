import 'package:flutter/material.dart';

class SuggestedForYouCards extends StatefulWidget {
  const SuggestedForYouCards({super.key});

  @override
  State<SuggestedForYouCards> createState() => _SuggestedForYouCardsState();
}

class _SuggestedForYouCardsState extends State<SuggestedForYouCards>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
      },
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: ClipRRect(
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
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8, right: 8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.cancel_sharp,
                                size: 24,
                              ),
                            ),
                          ),
                          const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                'assets/images/Profiles.png',
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Juliet Adams',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'UI/UX - God',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.deepOrange,
                                  shape: BoxShape.rectangle),
                              child: const Text(
                                'Follow',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Suggested for you',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
