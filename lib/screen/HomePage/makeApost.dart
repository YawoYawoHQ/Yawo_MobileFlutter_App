import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  static const routeName = '/makeAPost';
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> posts = [];

  File? _image;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    //getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text('Social Media Posting Page'),
      ),
      body: Column(
        children: [
          _buildPostComposer(),
          _buildPostFeed(),
        ],
      ),
    );
  }

  Widget _buildPostComposer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            // User avatar goes here
            backgroundImage: AssetImage('assets/images/Profiles.png'),

            radius: 25,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: _postController,
              decoration: const InputDecoration(
                hintText: 'What\'s on your mind?',
              ),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              _submitPost();
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  Widget _buildPostFeed() {
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const CircleAvatar(
                // User avatar for each post goes here
                backgroundColor: Colors.blue,
                radius: 20,
              ),
              title: const Text('User Name'),
              subtitle: Text(posts[index]),
            ),
          );
        },
      ),
    );
  }

  void _submitPost() {
    if (_postController.text.isNotEmpty) {
      setState(() {
        posts.add(_postController.text);
        _postController.clear();
      });
    }
  }
}
