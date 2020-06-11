import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NoteKey(
              note: 1,
              color: Colors.red,
            ),
            NoteKey(
              note: 2,
              color: Colors.orange,
            ),
            NoteKey(
              note: 3,
              color: Colors.yellow,
            ),
            NoteKey(
              note: 4,
              color: Colors.green,
            ),
            NoteKey(
              note: 5,
              color: Colors.teal,
            ),
            NoteKey(
              note: 6,
              color: Colors.blue,
            ),
            NoteKey(
              note: 7,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class NoteKey extends StatelessWidget {
  const NoteKey({
    Key key,
    @required this.note,
    @required this.color,
  }) : super(key: key);

  final int note;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: _playSound,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
    );
  }

  void _playSound(TapDownDetails details) {
    final player = AudioCache();
    player.play('note$note.wav');
  }
}
