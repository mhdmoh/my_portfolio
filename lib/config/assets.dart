enum MyAssets {
  githubLogo("github_logo_icon.svg"),
  linkedInLogo("linkedin_logo_icon.svg"),
  mediumLogo("medium_logo_icon.svg"),
  androidLogo("android_icon.svg"),
  iosLogo("ios_icon.svg"),

  //
  background("background_image.png");

  final String fileName;
  const MyAssets(this.fileName);
}

extension MyAssetsExt on MyAssets {
  String get svg => "assets/icons/$fileName";
  String get image => "assets/images/$fileName";
}
