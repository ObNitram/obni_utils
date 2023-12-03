import "dart:math";

typedef Vec2 = (int, int);

Vec2 vec2(int x, int y) {
  return (x, y);
}

extension XY on Vec2 {
  int get x => this.$1;

  int get y => this.$2;
}

extension Operator on Vec2 {
  Vec2 operator +(Vec2 other) {
    return (x + other.x, y + other.y);
  }

  Vec2 operator -(Vec2 other) {
    return (x - other.x, y - other.y);
  }

  Vec2 operator *(Vec2 other) {
    return (x * other.x, y * other.y);
  }

  (double, double) operator /(Vec2 other) {
    return (x / other.x, y / other.y);
  }

  Vec2 operator %(Vec2 other) {
    return (x % other.x, y % other.y);
  }

  Vec2 operator ~/(Vec2 other) {
    return (x ~/ other.x, y ~/ other.y);
  }

  Vec2 operator -() {
    return (-x, -y);
  }
}

extension Compare on Vec2 {
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
}

extension Distance on Vec2 {
  double distanceTo(Vec2 other) {
    return sqrt(pow(x - other.x, 2) + pow(y - other.y, 2));
  }

  Vec2 vectorTo(Vec2 other) {
    return other - this;
  }
}

extension Math on Vec2 {
  Vec2 get abs {
    return (x.abs(), y.abs());
  }

  Vec2 get sign {
    return (x.sign, y.sign);
  }
}
