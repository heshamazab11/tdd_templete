const empty = "";
const zero = 0;
const status = false;

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return zero;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orBool() {
    if (this == null) {
      return status;
    } else {
      return this!;
    }
  }
}
