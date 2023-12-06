import "package:obni_utils/src/geo/vec2.dart";

class Matrix2<T> {
  final int rows;
  final int cols;
  List<List<T>> data = [];

  Matrix2(this.rows, this.cols);

  factory Matrix2.fromList(final List<List<T>> data) {
    if (data.isEmpty) {
      throw ArgumentError("The list cannot be empty.");
    }

    final rows = data.length;
    final cols = data[0].length;

    for (var row in data) {
      if (row.length != cols) {
        throw ArgumentError("All rows must have the same length.");
      }
    }

    final dataCopy = data.map((row) => List<T>.from(row)).toList();

    return Matrix2<T>(rows, cols)..data = dataCopy;
  }

  factory Matrix2.fromString(
      String data, String rowSeparator, String colSeparator) {
    if (T != String) {
      throw UnsupportedError("This constructor is only for String type");
    }

    List<List<String>> dataList =
        data.split(rowSeparator).map((row) => row.split(colSeparator)).toList();
    return Matrix2.fromList(dataList as List<List<T>>);
  }

  T operator [](final Vec2 vec) {
    if (vec.x < 0 || vec.x >= cols) {
      throw RangeError("x must be between 0 and $cols");
    }

    if (vec.y < 0 || vec.y >= rows) {
      throw RangeError("y must be between 0 and $rows");
    }

    return data[vec.y][vec.x];
  }

  T at(int x, int y) {
    return this[Vec2(x, y)];
  }

  T? atOrNull(int x, int y) {
    if (x < 0 || x >= cols) {
      return null;
    }

    if (y < 0 || y >= rows) {
      return null;
    }

    return this[Vec2(x, y)];
  }

  void iterate(void Function(T value, Vec2 vec) callback) {
    for (var y = 0; y < rows; ++y) {
      for (var x = 0; x < cols; ++x) {
        callback(this[Vec2(x, y)], Vec2(x, y));
      }
    }
  }

  void iterateRow(int y, void Function(T value, int x) callback) {
    for (var x = 0; x < cols; ++x) {
      callback(this[Vec2(x, y)], x);
    }
  }

  void iterateCol(int x, void Function(T value, int y) callback) {
    for (var y = 0; y < rows; ++y) {
      callback(this[Vec2(x, y)], y);
    }
  }

  void iterateAround8(Vec2 vec, void Function(T value, Vec2 vec) callback) {
    for (var y = vec.y - 1; y <= vec.y + 1; ++y) {
      for (var x = vec.x - 1; x <= vec.x + 1; ++x) {
        if (x < 0 || x >= cols) {
          continue;
        }
        if (y < 0 || y >= rows) {
          continue;
        }
        if (x == vec.x && y == vec.y) {
          continue;
        }
        callback(this[Vec2(x, y)], Vec2(x, y));
      }
    }
  }

  void iterateAround4(Vec2 vec, void Function(T value, Vec2 vec) callback) {
    for (var y = vec.y - 1; y <= vec.y + 1; ++y) {
      for (var x = vec.x - 1; x <= vec.x + 1; ++x) {
        if (x < 0 || x >= cols) {
          continue;
        }
        if (y < 0 || y >= rows) {
          continue;
        }
        if (x == vec.x && y == vec.y) {
          continue;
        }
        if (x != vec.x && y != vec.y) {
          continue;
        }
        callback(this[Vec2(x, y)], Vec2(x, y));
      }
    }
  }

  bool isInside(Vec2 vec) {
    return vec.x >= 0 && vec.x < cols && vec.y >= 0 && vec.y < rows;
  }

  bool isOnEdge(Vec2 vec) {
    return vec.x == 0 || vec.x == cols - 1 || vec.y == 0 || vec.y == rows - 1;
  }

  @override
  String toString() {
    return data.map((row) => row.join(" ")).join("\n");
  }
}
