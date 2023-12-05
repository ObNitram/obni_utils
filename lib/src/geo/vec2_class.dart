import "dart:math";

class Vec2 {
  final int x;
  final int y;

  Vec2(this.x, this.y);

  Vec2 operator +(Vec2 other) {
    return Vec2(x + other.x, y + other.y);
  }

  Vec2 operator -(Vec2 other) {
    return Vec2(x - other.x, y - other.y);
  }

  Vec2 operator *(Vec2 other) {
    return Vec2(x * other.x, y * other.y);
  }

  Vec2 operator %(Vec2 other) {
    return Vec2(x % other.x, y % other.y);
  }

  Vec2 operator ~/(Vec2 other) {
    return Vec2(x ~/ other.x, y ~/ other.y);
  }

  Vec2 operator -() {
    return Vec2(-x, -y);
  }

  bool operator <(Vec2 other) {
    if (x == other.x) {
      return y < other.y;
    }

    if (y == other.y) {
      return x < other.x;
    }

    return x < other.x && y < other.y;
  }

  bool operator <<(Vec2 other) {
    return x < other.x && y < other.y;
  }

  bool operator <=(Vec2 other) {
    return x <= other.x && y <= other.y;
  }

  bool operator >(Vec2 other) {
    if (x == other.x) {
      return y > other.y;
    }

    if (y == other.y) {
      return x > other.x;
    }

    return x > other.x && y > other.y;
  }

  bool operator >>(Vec2 other) {
    return x != other.x || y != other.y;
  }

  bool operator >=(Vec2 other) {
    return x >= other.x && y >= other.y;
  }

  double distanceTo(Vec2 other) {
    return sqrt(pow(x - other.x, 2) + pow(y - other.y, 2));
  }

  Vec2 vectorTo(Vec2 other) {
    return other - this;
  }

  Vec2 get abs {
    return Vec2(x.abs(), y.abs());
  }

  Vec2 get sign {
    return Vec2(x.sign, y.sign);
  }

  @override
  bool operator ==(Object other) {
    if (other is Vec2) {
      return x == other.x && y == other.y;
    }
    return false;
  }

  @override
  int get hashCode => (x, y).hashCode;

  @override
  String toString() => "($x, $y)";
}
