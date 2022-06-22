extension NoneNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!; // i am sure that it is not null
    }
  }
}

extension NoneNullInt on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!; // i am sure that it is not null
    }
  }
}
