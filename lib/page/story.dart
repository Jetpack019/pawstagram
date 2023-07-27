// import 'package:flutter/material.dart';
// import 'package:story_view/story_view.dart';
// import 'package:circular_countdown_timer/circular_countdown_timer.dart';

// class CircularStoryScreen extends StatefulWidget {
//   @override
//   _CircularStoryScreenState createState() => _CircularStoryScreenState();
// }

// class _CircularStoryScreenState extends State<CircularStoryScreen> {
//   final List<StoryItem> _stories = [
//     StoryItem.text(
//       title: "Story 1",
//       backgroundColor: Colors.orange,
//       roundedTop: true,
//       textStyle: TextStyle(
//         fontFamily: 'Raleway',
//         fontSize: 40.0,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     ),
//     StoryItem.pageImage(
//       url: "https://example.com/story_image1.jpg",
//       controller: StoryController(),
//     ),
//     StoryItem.pageImage(
//       url: "https://example.com/story_image2.jpg",
//       controller: StoryController(),
//     ),
//     // Add more story items as needed
//   ];

//   int _currentIndex = 0;
//   final StoryController _storyController = StoryController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Circular Story'),
//       ),
//       body: Stack(
//         children: [
//           StoryView(
//             storyItems: _stories,
//             controller: _storyController,
//             inline: false,
//             onComplete: () {
//               setState(() {
//                 if (_currentIndex < _stories.length - 1) {
//                   _currentIndex += 1;
//                 } else {
//                   // Handle story completion
//                 }
//               });
//             },
//           ),
//           Positioned(
//             top: 20,
//             right: 20,
//             child: CircularCountDownTimer(
//               duration: _storyController.storyItem.duration,
//               initialDuration: 0,
//               controller: _storyController,
//               width: 50,
//               height: 50,
//               ringColor: Colors.grey[300],
//               ringGradient: null,
//               fillColor: Colors.white,
//               fillGradient: null,
//               backgroundColor: Colors.transparent,
//               strokeWidth: 5.0,
//               strokeCap: StrokeCap.round,
//               textStyle: TextStyle(
//                 fontSize: 12.0,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//               textFormat: CountdownTextFormat.S,
//               isReverse: false,
//               isReverseAnimation: false,
//               isTimerTextShown: true,
//               autoStart: true,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
