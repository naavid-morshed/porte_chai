import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:porte_chai/custom_widgets/custom_meet_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPageChanged(int page) async {
    if (page == 4) {
      setState(() {
        _page = page;
        FirebaseAuth.instance.signOut();
      });
    } else {
      setState(() {
        _page = page;
      });
    }
  }

  //jitsi
  final serverText = TextEditingController();
  final roomText = TextEditingController(text: "jitsi-meet-wrapper-test-room");
  final subjectText = TextEditingController(text: "My Plugin Test Meeting");
  final tokenText = TextEditingController();
  final userDisplayNameText = TextEditingController(text: "Plugin Test User");
  final userEmailText = TextEditingController(text: "fake@email.com");
  final userAvatarUrlText = TextEditingController();

  bool isAudioMuted = true;
  bool isAudioOnly = false;
  bool isVideoMuted = true;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetingButton(
                    onPressed: () async{

                    },
                    icon: Icons.videocam,
                    text: 'New Meeting'),
                HomeMeetingButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/meet');
                    },
                    icon: Icons.add_box_rounded,
                    text: 'Join Meeting'),
                HomeMeetingButton(
                    onPressed: () {},
                    icon: Icons.arrow_upward_rounded,
                    text: 'Share Screen'),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                    'Logged in at ${FirebaseAuth.instance.currentUser?.displayName}'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meeting',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contacts,
            ),
            label: 'Meets',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout,
            ),
            label: 'LogOut',
          ),
        ],
      ),
    );
  }
}
