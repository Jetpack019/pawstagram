import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:petapp/model/post_data.dart';
import 'package:petapp/page/page_favorite.dart';
import 'package:petapp/page/page_search.dart';
import 'package:petapp/page/pet_profile.dart';
import 'package:petapp/page/user_profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<PostData> postList = [];

  static List<Widget> _widgetOptions = <Widget>[
    HomePageWidget(),
    SearchPet(),
    AddPostPage(),
    FavoritesPage(),
    UserProfile(),
  ];

  void _onItemTapped(int index) async {
    if (index == 2) {
      // Add Page
      final newPost = await Navigator.of(context).push<PostData>(
        MaterialPageRoute(builder: (context) => AddPostPage()),
      );

      if (newPost != null) {
        setState(() {
          postList.add(newPost);
        });
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provider<List<PostData>>(
      create: (_) => postList,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pawstagram',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              icon: Icon(
                Icons.pets,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => PetProfilePage(),
                ));
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                accountName: Text('Banagjade Ross'),
                accountEmail: Text('banagjadeross@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/pet1.jpg'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.chat),
                title: Text('Chats'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/messages');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  // TODO: Logout user
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.black,
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  final List<String> stories = [
    'assets/pet3.jpg',
    'assets/pet2.jpg',
    'assets/pet1.jpg',
    'assets/pet4.jpg',
    'assets/pet6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final List<PostData> postList = Provider.of<List<PostData>>(context);

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index == 0) {
                // Add the text widget above the post cards
                return Column(
                  children: [
                    Container(
                      color: Colors.black,
                      alignment: Alignment.topLeft,
                      height: 130,
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                                child: Text(
                              "Stories",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 100,
                                initialPage: 0,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, _) =>
                                    print('Page changed to index $index'),
                              ),
                              items: List<Widget>.generate(
                                  (stories.length / 3).ceil(), (slideIndex) {
                                final start = slideIndex * 2;
                                final end = (slideIndex * 3) + 3;
                                final slideStories = stories.sublist(
                                    start,
                                    end > stories.length
                                        ? stories.length
                                        : end);

                                return Builder(
                                  builder: (BuildContext context) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly, // Adjust spacing here
                                      children: slideStories.map((story) {
                                        return Expanded(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  story,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              } else if (index > postList.length) {
                return null;
              }

              final postData = postList[index - 1];

              return PostCard(postData: postData);
            },
            childCount: postList.length + 1, // +1 for the text widget
          ),
        ),
      ],
    );
  }
}

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  late ImagePicker _imagePicker;
  XFile? _pickedImage;
  TextEditingController _captionController = TextEditingController();
  bool _isImagePickerOpen =
      false; // Flag to track the state of the image picker

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _getImageFromStorage() async {
    if (_isImagePickerOpen) return; // Check if image picker is already open
    setState(() {
      _isImagePickerOpen = true;
    });
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
    setState(() {
      _isImagePickerOpen = false;
    });
  }

  void _post() {
    String caption = _captionController.text.trim();
    if (_pickedImage != null && caption.isNotEmpty) {
      PostData postData = PostData(
        avatar: 'assets/user_image.jpg',
        username: 'Jade Ross Banag',
        location: 'Location',
        postImage: _pickedImage!.path,
        caption: caption,
      );
      Navigator.of(context).pop(postData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Post',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: _getImageFromStorage,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                ),
                child: _pickedImage != null
                    ? Image.file(
                        File(_pickedImage!.path),
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.add_photo_alternate,
                        size: 80,
                        color: Colors.grey,
                      ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _captionController,
              decoration: InputDecoration(
                hintText: 'Enter a caption...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _post,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.black, // set the background color of the button
                minimumSize:
                    Size(120.0, 40.0), // set the minimum size of the button
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // set the border radius
                ),
              ),
              child: Text(
                'Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0, // set the font size of the text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }
}

class PostCard extends StatelessWidget {
  final PostData postData; // Add this property

  PostCard({required this.postData}); // Add the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: IntrinsicHeight(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                    postData.avatar), // Access the avatar from postData
              ),
              title:
                  Text(postData.username), // Access the username from postData
              subtitle:
                  Text(postData.caption), // Access the location from postData
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  // Add your action here
                },
              ),
            ),
            Image.asset(
              'assets/pet3.jpg',
              width: 300, // Adjust the width as per your requirement
              height: 300, // Adjust the height as per your requirement
              fit: BoxFit
                  .cover, // Adjust the image fit mode as per your requirement
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // Add your action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {
                    // Add your action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Add your action here
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {
                    // Add your action here
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Liked by Kobe and 1,234 others',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Lebron James',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8.0),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'View all 123 comments',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12.0,
                    backgroundImage: AssetImage('assets/pet2.jpg'),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Add your action here
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '2 hours ago',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
