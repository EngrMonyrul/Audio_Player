import 'package:audio_player/dataModels/media_file.dart';
import 'package:audio_player/utils/constants/assets_const.dart';

class Components {
  Components._();

  static List<MediaFile> audios = [
    MediaFile(
        name:
            "BOL DO NA ZARA Full Video Song  AZHAR  Emraan Hashmi Nargis Fakhri  Armaan Malik Amaal Mallik.mp3",
        image: AssetsConst.armanMalik,
        path: AssetsConst.bolDoNaZara,
        channelName: "T-Series",
        views: "60M+"),
    MediaFile(
        name:
            "Charlie Puth  We Dont Talk Anymore feat Selena Gomez Official Video.mp3",
        image: AssetsConst.charliePuth,
        path: AssetsConst.weDontTalk,
        channelName: "VEVO",
        views: "665M+"),
    MediaFile(
        name:
            "Pheshey Jaai ফস যই  Toofan  Shakib Khan Nabila Habib Arafat Raihan Alphai Chorki SVF.mp3",
        image: AssetsConst.habibWahid,
        path: AssetsConst.feseJaiAudio,
        channelName: "Chorki",
        views: "25M+"),
    MediaFile(
        name: "ZAYN  Dusk Till Dawn Official Video ft Sia.mp3",
        image: AssetsConst.zaynMalik,
        path: AssetsConst.daskTillDown,
        channelName: "VEVO",
        views: "3.2B+"),
  ];
}
