import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  runApp(NeumorphicTheme(
    theme: const NeumorphicThemeData(
      intensity: 0.8,
      lightSource: LightSource.topLeft
    ),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AssetsAudioPlayer _assetsAudioPlayer;
  bool isPlaying = false;
  final audios = <Audio>[
    Audio("assets/audios/avicii_wake_me_up.mp3"),
    Audio("assets/audios/glad_you_came.mp3"),
    Audio("assets/audios/i_need_a_hero.mp3"),
    Audio("assets/audios/meduza_paradise.mp3"),
    Audio("assets/audios/zedd_stay_the_night.mp3"),
    Audio("assets/audios/a_place_with_no_name.mp3"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    _assetsAudioPlayer.open(
      Playlist(audios: audios,),
      loopMode: LoopMode.playlist,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _assetsAudioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicButton(
                  style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  child: const Icon(
                    Icons.skip_previous,
                    size: 35,
                  ),
                  onPressed: () async {
                    _assetsAudioPlayer.previous();
                  },
                ),
                const SizedBox(width: 15,),
                isPlaying ? NeumorphicButton(
                  style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  child: const Icon(
                    Icons.pause,
                    size: 55,
                  ),
                  onPressed: () async {
                    _assetsAudioPlayer.pause();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                ) : NeumorphicButton(
                  style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 55,
                  ),
                  onPressed: () async {
                    _assetsAudioPlayer.play();
                    setState(() {
                      isPlaying = true;
                    });
                  },
                ),
                const SizedBox(width: 15,),
                NeumorphicButton(
                  style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  child: const Icon(
                    Icons.skip_next,
                    size: 35,
                  ),
                  onPressed: () async {
                    _assetsAudioPlayer.next();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'check',
              style: Theme.of(context).textTheme.headline4,
            ),
            OutlinedButton(onPressed: () async {
              await _assetsAudioPlayer.open(
                Audio("assets/audios/avicii_wake_me_up.mp3"),
                autoStart: true,
                showNotification: true,
              );
            }, child: const Text("play")),
            OutlinedButton(onPressed: () async {
              await _assetsAudioPlayer.stop();
            }, child: const Text("stop")),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: const [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        color: Colors.blue,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
