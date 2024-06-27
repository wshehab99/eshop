import 'package:dartz/dartz.dart';

import '../../config/app.dart';

extension IntExtension on int? {
  //check if number not equal null if equal return 0 if not return number
  int get orZero => this ?? 0;

//check if number not equal null if equal return 1 if not return number
  int get orOne => this ?? 1;
}

extension StringExtension on String? {
  //check if string not equal null if equal return empty string if not return the string
  String get orEmpty => this ?? AppConfig.empty;
}

extension StringExtensions on String {
  //check if string length is less than a number and return the string
  //if not spited the text base on that number
  //it's for avoid render flex overflow error on long text that come from API
  String subText({int length = 20}) =>
      this.length <= length ? this : "${substring(0, length)}...";
}

extension BoolExtension on bool? {
  //check if condition not equal null if equal return false if not return the value
  bool get orFalse => this ?? false;

  //check if condition not equal null if equal return true if not return the value
  bool get orTrue => this ?? true;
}

extension DateExtension on int {
  //Returns a new string that prepends onto this string one time for each position the length is less than 2.
  //its for format the date ex:
  // form 7/5/2023 to 07/05/2023
  String get toTwoPad => toString().padLeft(2, "0");
}

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value; //
  L asLeft() => (this as Left).value;
}
