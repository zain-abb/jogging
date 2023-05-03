/// Keeps all image references to be used by presentation layer
class Images {
  static const _imagePath = 'assets/images';
  static const _svgPath = 'assets/svgs';

  // ===== DEFAULTS ===== //
  final defaultAvatar =
      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80';

  // ===== GENERICS ===== //

  // ===== SVGs ===== //
  final icGoogle = '$_svgPath/ic_google.svg';
  final icApple = '$_svgPath/ic_apple.svg';
  final footStep = '$_svgPath/foot-step.svg';

  // ===== IMAGES ===== //
  final logo = '$_imagePath/logo.png';
  final icon = '$_imagePath/icon.png';
  final illustration = '$_imagePath/illustration.png';
  final loading = '$_imagePath/loading.gif';
  final error = '$_imagePath/error.jpg';
}
