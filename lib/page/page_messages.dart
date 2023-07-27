import 'package:flutter/material.dart';
import 'package:petapp/page/page_chat.dart';
import 'package:petapp/page/page_home.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final List<String> _messages = [
    'Hi there!',
    'How are you?',
    'I\'m doing well, thanks for asking. How about you?',
    'I\'m good too, thanks.',
  ];

  final List<String> _image_users = [
    'assets/pet3.jpg',
    'assets/pet4.jpg',
    'assets/pet2.jpg',
    'assets/pet1.jpg',
  ];

  final List<String> _users = [
    'John Wade',
    'Mary Smith',
    'Peter Parker',
    'Lebron James',
  ];
  final List<String> _time = [
    '9:00 AM',
    '12:30 PM',
    '3:45 PM',
    '7:15 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            color: const Color.fromARGB(255, 231, 231, 231),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/pet1.jpg'),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/pet2.jpg'),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/pet3.jpg'),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/pet4.jpg'),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/pet5.jpg'),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/pet6.jpg'),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ));
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(_image_users[index]),
                  ),
                  title: Text(_users[index]),
                  subtitle: Text(_messages[index]),
                  trailing: Text(_time[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
