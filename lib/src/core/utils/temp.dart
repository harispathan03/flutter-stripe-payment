class Temp {
  final int a;
  final int? b;
  final int c;

  Temp({required this.a, required this.b, required this.c});

  Temp.custom({required this.a, this.b, required this.c});

  factory Temp.fromCustom(int test, int test2, int test3) {
    return Temp(a: test, b: test2, c: test3);
  }

  factory Temp.fromDemo(Demo d) {
    return Temp(a: d.a, b: d.b, c: d.a + d.b);
  }
}

// Temp t1 = Temp(a: 10, b: 20);
// Temp t2 = Temp.custom(a: 10, b: 20);
// Temp t3 = Temp.fromCustom(10, 20);

class Demo {
  final int a;
  final int b;

  Demo({required this.a, required this.b});
}
