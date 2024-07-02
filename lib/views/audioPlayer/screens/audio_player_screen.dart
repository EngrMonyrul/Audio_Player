import 'package:audio_player/common/widgets/base_layout.dart';
import 'package:audio_player/common/widgets/custom_appbar.dart';
import 'package:audio_player/common/widgets/custom_snackbar.dart';
import 'package:audio_player/dataModels/media_file.dart';
import 'package:audio_player/utils/constants/assets_const.dart';
import 'package:audio_player/utils/constants/components.dart';
import 'package:audio_player/utils/extensions/context_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_icon_button.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  bool _playing = true;
  List<String> _favoriteList = [];
  late CustomSnackbar _customSnackbar;
  MediaFile _mediaFile = MediaFile();

  void pressedOnForward() {
    final index = Components.audios.indexOf(_mediaFile);
    setState(() {
      if (index < (Components.audios.length - 1)) {
        _mediaFile = Components.audios[index + 1];
      } else if (index == (Components.audios.length - 1)) {
        _mediaFile = Components.audios.first;
      }
    });
  }

  void pressedOnBackward() {
    final index = Components.audios.indexOf(_mediaFile);
    setState(() {
      if (index > 0) {
        _mediaFile = Components.audios[index - 1];
      } else if (index == 0) {
        _mediaFile = Components.audios.last;
      }
    });
  }

  @override
  void initState() {
    _customSnackbar = CustomSnackbar(context);
    _mediaFile = Components.audios.first;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final screenSize = context.screenSize;
    return BaseLayout(
      imgPath: _mediaFile.image,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: context.topBarHeight + 0,
            ),
            SizedBox(
              height: 50,
              width: screenSize.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    margin: EdgeInsets.zero,
                    icon: Icons.arrow_back_ios_new_rounded,
                    onPressed: () {
                      _customSnackbar.showSnackbar(
                          message: "Not Implemented Yet",
                          snackbarType: SnackBarType.error);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Now Playing",
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * .6,
                        child: Text(
                          _mediaFile.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: theme.textTheme.labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomIconButton(
                    margin: EdgeInsets.zero,
                    icon: _favoriteList.contains(_mediaFile.name)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    iconColor: _favoriteList.contains(_mediaFile.name)
                        ? Colors.red
                        : Colors.white,
                    onPressed: () {
                      print("add to favorite");
                      setState(() {
                        if (_favoriteList.contains(_mediaFile.name)) {
                          _favoriteList.remove(_mediaFile.name);
                        } else {
                          _favoriteList.add(_mediaFile.name ?? "");
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              _mediaFile.name ?? "",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              _mediaFile.channelName ?? "",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${_mediaFile.views} Views",
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomIconButton(
              padding: EdgeInsets.zero,
              borderColor: Colors.transparent,
              icon: _playing
                  ? CupertinoIcons.play_circle_fill
                  : CupertinoIcons.pause_circle_fill,
              iconSize: 80,
              splashCircleRadius: BorderRadius.circular(50),
              onPressed: () {
                print("play or pause");
                setState(() {
                  _playing = !_playing;
                });
              },
            ),
            Text(
              "00:00:25/01:23:51",
              style: theme.textTheme.labelMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  borderColor: Colors.transparent,
                  icon: CupertinoIcons.gobackward_10,
                  iconSize: 18,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    print("go backward");
                  },
                ),
                CustomIconButton(
                  icon: CupertinoIcons.backward_end,
                  onPressed: pressedOnBackward,
                ),
                CustomIconButton(
                  icon: CupertinoIcons.forward_end,
                  onPressed: pressedOnForward,
                ),
                CustomIconButton(
                  borderColor: Colors.transparent,
                  icon: CupertinoIcons.goforward_10,
                  iconSize: 18,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    print("go forward");
                  },
                ),
              ],
            ),
            Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    _mediaFile.image ?? "",
                  ),
                ),
                title: Text(
                  _mediaFile.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${_mediaFile.channelName} • ${_mediaFile.views} Views",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall,
                ),
                trailing: CustomButton(
                  onTap: () {
                    _customSnackbar.showSnackbar(
                        message: "Not Implemented Yet",
                        snackbarType: SnackBarType.error);
                  },
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * .02,
            ),
          ],
        ),
      ),
    );
  }
}
