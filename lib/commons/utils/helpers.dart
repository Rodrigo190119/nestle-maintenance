enum Assets {
  fonts,
  icons,
  images,
  json,
}

class Helpers {

}

extension AssetsPath on Assets {
  String get path {
    switch (this) {
      case Assets.fonts:
        return "assets/fonts/";
      case Assets.icons:
        return "assets/icons/";
      case Assets.images:
        return "assets/images/";
      case Assets.json:
        return "assets/json/";
      default:
        return "No found path";
    }
  }
}