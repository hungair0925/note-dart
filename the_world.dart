import 'dart:async';

enum AnsiEscapeColorCode {
  white("0"),
  yellow("33"),
  blue("34"),
  backgroundYellow("43"),
  backgroundBlue("44");

  final String code;
  const AnsiEscapeColorCode(this.code);

  String get colorCode => code;
}

String resetColor() {
  String resetColorCode = AnsiEscapeColorCode.white.colorCode;
  return "\u001b[$resetColorCode" + "m";
}

String setColor(AnsiEscapeColorCode color) {
  String settedColorCode = color.colorCode;
  return "\u001b[$settedColorCode" + "m";
}

void dioPrint(String text, {bool isSpecial = false}) {
  String color = isSpecial ? setColor(AnsiEscapeColorCode.backgroundYellow) : setColor(AnsiEscapeColorCode.yellow);
  print("DIO) $color$text" + resetColor());
}

void jotaroPrint(String text, {bool isSpecial = false}) {
  String color = isSpecial ? setColor(AnsiEscapeColorCode.backgroundBlue) : setColor(AnsiEscapeColorCode.blue);
  print("承太郎) $color$text" + resetColor());
}

void main() async {
  dioPrint("ロードローラーだぁああ!", isSpecial: true);
  await Future.delayed(Duration(seconds: 2));

  jotaroPrint("THE WORLD!!!", isSpecial: true);
  await Future.delayed(Duration(seconds: 3));

  jotaroPrint("時は動き出す");
  await Future.delayed(Duration(seconds: 1));

  dioPrint("ウリィイイイイ!");
}
