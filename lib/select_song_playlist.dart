import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SelectSongPlaylist extends StatefulWidget {
  const SelectSongPlaylist({Key? key}) : super(key: key);

  @override
  State<SelectSongPlaylist> createState() => _SelectSongPlaylistState();
}

class _SelectSongPlaylistState extends State<SelectSongPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: const Text("check"),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: const [
          Icon(Icons.play_arrow, size: 30, color: Colors.white,),
          Icon(Icons.add, size: 30, color: Colors.white,),
          Icon(Icons.download, size: 30, color: Colors.white,),
        ],
        color: NeumorphicColors.darkBackground,
        index: 1,
      ),
    );
  }
}
