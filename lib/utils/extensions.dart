part of 'utils.dart';

/// [StringExt] carries bunch of
/// extensions for [String] type.
extension StringExt on String {
  /// [toDouble] converts the string to double.
  double toDouble() => double.parse(isEmpty ? '0' : this);

  /// [capFirstLetter] Capitalize the
  /// First letter of the word
  /// of given sentence.
  String get capFirstLetter {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return this;
    }
  }

  /// [capFirstLetter] Capitalize the
  /// First letter letter of every word
  /// of given sentence.
  String get capEveryFirstLetter =>
      split(' ').map((word) => word.capFirstLetter).join(' ');
}

/// [NullStringExt] carries bunch of
/// extensions for [String?] type.
extension NullStringExt on String? {
  /// [toInt] converts the string to int.
  int toInt() => int.parse(this ?? '0');

  double toDouble() => double.parse(this ?? '0');

  int compareAsDate(String? b) => DateTimeC.stringToDayTime(this ?? '')
      .compareTo(DateTimeC.stringToDayTime(b ?? ''));
}

/// [NullIntExt] carries bunch of
/// extensions for [int?] type.
extension NullIntExt on int? {
  /// [divisor] divide the value it called with the
  /// divisor passed as parameter.
  int divide(int? divisor) => this ?? 1 ~/ (divisor.isNotZero);

  int divideD(double? divisor) => this ?? 1 ~/ (divisor.isNotZero);

  int get isNotZero => (this ?? 0) > 0 ? (this ?? 1) : 1;
}

extension DoubleExt on double? {
  /// [divisor] divide the value it called with the
  /// divisor passed as parameter.
  double divide(double? divisor) => this ?? 1 / (divisor.isNotZero);

  double get isNotZero => (this ?? 0) > 0 ? (this ?? 1) : 1;
}

extension NullIntList on List<double?> {
  double get average {
    double total = 0;
    forEach((e) {
      total += e ?? 0.0;
    });
    return total / length;
  }
}

/// [StringListExt] carries bunch of
/// extensions for [List] of [String] type.
extension StringListExp on List<String> {
  /// [capFirstLetter] Capitalize the
  /// First letter letter of first word
  /// of every list element.
  List<String> get capFirstLetter => map((e) => e.capFirstLetter).toList();

  /// [capFirstLetter] Capitalize the
  /// First letter letter of every word
  /// of every list element.
  List<String> get capEveryFirstLetter =>
      map((e) => e.capEveryFirstLetter).toList();
}

/// [BuildContextExp] carries bunch of
/// extensions for [BuildContext] class
extension BuildContextExp on BuildContext {
  /// [theme] returns theme of the context.
  ThemeData get theme => Theme.of(this);

  /// [textTheme] returns [TextTheme] of the context.
  TextTheme get textTheme => theme.textTheme;

  /// [colorScheme] returns [colorScheme] of the given context.
  ColorScheme get colorScheme => theme.colorScheme;
}

/// [MarginExp] carries bunch of
/// extensions for [Widget] type.
extension MarginExp on Widget {
  Widget fadeIn({String? key, Duration? appearAfter, bool fadeIn = true}) {
    return fadeIn
        ? BaseFadeIn(childKey: key, appearAfter: appearAfter, child: this)
        : this;
  }

  /// [marginLeft4] returns a widget
  /// with margin of 4 pixels from left
  Widget get marginLeft4 => paddingLeft(4);

  /// [marginHorizontal4] returns a widget
  /// with horizontal margin of 4 pixel
  Widget get marginHorizontal4 => paddingHorizontal(4);

  /// [parentWidth] returns widget having
  /// width of it's parent widget.
  Widget get parentWidth => SizedBox(width: double.infinity, child: this);

  /// [parentWidthIf] returns having
  /// width of it's parent widget if the condition is met.
  Widget parentWidthIf(bool condition) =>
      condition ? SizedBox(width: double.infinity, child: this) : this;

  /// [parentHeight] returns widget having
  /// width of it's parent widget.
  Widget get parentHeight => SizedBox(height: double.infinity, child: this);

  /// [backDropIfMobile] returns widget it self it the
  /// device is tablet or ipad.
  /// otherwise it makes a back drop filter around it
  /// which gives a transparent effect.
  Widget backDropIfMobile(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderConsts.brTopOrBottom(24.0),
          color: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderConsts.brTopOrBottom(24.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                child: this),
          ),
        ),
      );
}

/// [IconDataExp] carries bunch of
/// extension for [IconData] type.
extension IconDataExp on IconData {
  /// [getI] returns Icon as Widget
  /// with having the icon it called with
  /// can change color and size with named parameters.
  Widget getI({Color? color, double? size}) =>
      Icon(this, color: color, size: size ?? 20);
}

extension CustomWidget on Widget {
  /// To wrap the widget with the (Align) widget.
  Widget align({AlignmentGeometry? alignment}) {
    return Align(alignment: alignment ?? Alignment.center, child: this);
  }

  // SizedBox height constants
  static const double sizedBoxHeight2 = 2.0;
  static const double sizedBoxHeight4 = 4.0;
  static const double sizedBoxHeight6 = 6.0;
  static const double sizedBoxHeight8 = 8.0;
  static const double sizedBoxHeight10 = 10.0;
}

extension IntExtensions on int {
  int validate({int value = 0}) {
    return this;
  }

  /// Leaves given height of space
  Widget get sizedHeightBox => SizedBox(height: toDouble());

  /// Leaves given width of space
  Widget get sizedWidthBox => SizedBox(width: toDouble());

  Widget get sizedBoxHeight => SizedBox(height: toDouble());

  Widget get sizedWidth => SizedBox(width: toDouble());

  Duration get seconds => Duration(seconds: validate());

  Duration get milliseconds => Duration(milliseconds: validate());

  Duration get days => Duration(days: validate());

  bool isBetween(num first, num second) {
    return validate() >= first && validate() <= second;
  }

  Size get size => Size(toDouble(), toDouble());

  String get nthDaySuffix {
    if (this < 1 || this > 31) {
      throw Exception("Invalid day of month");
    }
    if (this >= 11 && this <= 13) {
      return "${this}th";
    }
    switch (this % 10) {
      case 1:
        return "${this}st";
      case 2:
        return "${this}nd";
      case 3:
        return "${this}rd";
      default:
        return "${this}th";
    }
  }
}

extension WidgetExtension on Widget? {
  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(height: height, width: width, child: this);
  }

  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  Widget visible(bool visible, Widget? defaultWidget) {
    return visible ? this! : (defaultWidget ?? const SizedBox.shrink());
  }

  Widget opacity({
    required double opacity,
    int durationInSecond = 1,
    Duration? duration,
  }) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration ?? Duration(milliseconds: (durationInSecond * 1000)),
      child: this,
    );
  }

  Widget rotate({
    required double angle,
    bool transformHitTests = true,
    Offset? origin,
  }) {
    return Transform.rotate(
      angle: angle,
      transformHitTests: transformHitTests,
      origin: origin,
      child: this,
    );
  }

  Widget scale({
    required double scale,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  Widget center({double? heightFactor, double? widthFactor}) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: this,
    );
  }

  Widget expand({int? flex}) =>
      Expanded(flex: flex ?? 1, child: this ?? const SizedBox.shrink());

  Widget onTap(
    Function? function, {
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
  }) {
    return InkWell(
      onTap: function as void Function()?,
      borderRadius: borderRadius,
      splashColor: splashColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      child: this,
    );
  }
}
