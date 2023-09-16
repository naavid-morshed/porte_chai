import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

class Meet extends StatefulWidget {
  const Meet({Key? key}) : super(key: key);

  @override
  State<Meet> createState() => _MeetState();
}

class _MeetState extends State<Meet> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "04e7fe6e61a249ff8084fa005309bb7a",
      channelName: "test",
      username: "user",
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agora VideoUIKit'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                client: client,
                addScreenSharing: false, // Add this to enable screen sharing
              ),
            ],
          ),
        ),
      ),
    );
  }
}