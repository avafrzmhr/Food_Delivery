/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/svgexport-17.svg
  SvgGenImage get svgexport17 =>
      const SvgGenImage('assets/icons/svgexport-17.svg');

  /// File path: assets/icons/svgexport-23.svg
  SvgGenImage get svgexport23 =>
      const SvgGenImage('assets/icons/svgexport-23.svg');

  /// File path: assets/icons/svgexport-7.svg
  SvgGenImage get svgexport7 =>
      const SvgGenImage('assets/icons/svgexport-7.svg');

  /// List of all assets
  List<SvgGenImage> get values => [svgexport17, svgexport23, svgexport7];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.jpg
  AssetGenImage get davideCantelliJpkfc5DDIUnsplash => const AssetGenImage(
      'assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.jpg');

  /// File path: assets/images/kamil-kalbarczyk-19Ft3QfakMo-unsplash.jpg
  AssetGenImage get kamilKalbarczyk19Ft3QfakMoUnsplash => const AssetGenImage(
      'assets/images/kamil-kalbarczyk-19Ft3QfakMo-unsplash.jpg');

  /// File path: assets/images/nathan-dumlao-zUNs99PGDg0-unsplash.jpg
  AssetGenImage get nathanDumlaoZUNs99PGDg0Unsplash => const AssetGenImage(
      'assets/images/nathan-dumlao-zUNs99PGDg0-unsplash.jpg');

  /// File path: assets/images/sarah-gotze-ODua_Pc7VQY-unsplash.jpg
  AssetGenImage get sarahGotzeODuaPc7VQYUnsplash =>
      const AssetGenImage('assets/images/sarah-gotze-ODua_Pc7VQY-unsplash.jpg');

  /// File path: assets/images/stefan-johnson-xIFbDeGcy44-unsplash.jpg
  AssetGenImage get stefanJohnsonXIFbDeGcy44Unsplash => const AssetGenImage(
      'assets/images/stefan-johnson-xIFbDeGcy44-unsplash.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        davideCantelliJpkfc5DDIUnsplash,
        kamilKalbarczyk19Ft3QfakMoUnsplash,
        nathanDumlaoZUNs99PGDg0Unsplash,
        sarahGotzeODuaPc7VQYUnsplash,
        stefanJohnsonXIFbDeGcy44Unsplash
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
