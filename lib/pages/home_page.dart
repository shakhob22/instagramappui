import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _pages = [
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.camera_alt_outlined, color: Colors.black,),
        ),
         title: const Text('Instagram', style: TextStyle(color: Colors.black),),

        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.live_tv, color: Colors.black,),
          ),

          IconButton(
            onPressed: (){},
            icon: const Icon(Linecons.paper_plane, color: Colors.black,),
          ),
        ],
      ),

      body: _pages[currentPageIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (i){
          setState(() {
            currentPageIndex = i;
          });
        },
        currentIndex: currentPageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Upload'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Likes'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account'
          ),
        ],
      ),
    );
  }
}
