import 'package:flutter_advanced_clean_architecture_with_mvvm/app/constants.dart';

extension NoneNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!; // i am sure that it is not null
    }
  }
}

extension NoneNullInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!; // i am sure that it is not null
    }
  }
}
