int pgcd(int a, int b) {
  return b == 0 ? a : pgcd(b, a % b);
}

int ppcm(int a, int b) {
  return (a * b).abs() ~/ pgcd(a, b);
}

extension LcmExtension on List<int> {
  int getPGCD() {
    return fold(1, (previousValue, element) => pgcd(previousValue, element));
  }

  int getPPCM() {
    return fold(1, (previousValue, element) => ppcm(previousValue, element));
  }
}
