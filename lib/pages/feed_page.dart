import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';

import '../model/post_model.dart';
import '../model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  final List<Post> _posts = [
    Post(
        "Brianne",
        "assets/images/user_1.jpeg",
        "assets/images/feed_1.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
    Post(
        "Henri",
        "assets/images/user_2.jpeg",
        "assets/images/feed_2.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
    Post(
        "Mariano",
        "assets/images/user_3.jpeg",
        "assets/images/feed_3.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),

            // #Stories #WatchAll
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Stories', style: TextStyle(color: Colors.grey, fontSize: 14),),
                  Text('Watch All', style: TextStyle(color: Colors.grey, fontSize: 14),)
                ],
              ),
            ),

            // #Stories
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                children: _stories.map((story) {
                  return _itemOfStory(story);
                }).toList(),
              ),
            ),

            // #PostList
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (ctx, i) {
                  return _itemOfPost(_posts[i]);
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              color: Colors.purple,
              width: 3
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text(story.name, style: const TextStyle(color: Colors.black),)
      ],
    );
  }

  Widget _itemOfPost(Post post){
    return Column(
      children: [
        // #avatar
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: AssetImage(post.userImage),
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(post.username, style: const TextStyle(color: Colors.black),),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz,color: Colors.black,),),
            ],
          ),
        ),
        // #postImage
        FadeInImage(
          width: MediaQuery.of(context).size.width,
          placeholder: const AssetImage('assets/images/placeholder.png'),
          image: AssetImage(post.postImage),
        ),
        // #buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){},
                  icon: const Icon(Linecons.heart, color: Colors.black,),
                ),
                IconButton(onPressed: (){},
                  icon: const Icon(Linecons.comment, color: Colors.black,),
                ),
                IconButton(onPressed: (){},
                  icon: const Icon(Linecons.paper_plane, color: Colors.black,),
                ),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.bookmark, color: Colors.black,))
          ],
        ),
        // #tags
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          width: double.infinity,
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Liked By ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "Sigmund,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: " Yessenia,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: " Dayana",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: " and",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: " 1263 others",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        // #caption
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          child: RichText(
            overflow: TextOverflow.visible,
            softWrap: true,
            text: TextSpan(
              children: [
                TextSpan(
                  text: post.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: ' ${post.caption}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )
              ]
            ),
          ),
        ),
        // #postdate
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Febuary 2020', style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }

}
