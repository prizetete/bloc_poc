class Counter {
  int value = 0;
  bool isOdd = false;

  void increment() {
    value++;
    isOdd = value % 2 != 0; // เช็คว่าเป็นเลขคี่หรือไม่
  }

  void decrement() {
    value--;
    isOdd = value % 2 != 0; // เช็คว่าเป็นเลขคี่หรือไม่
  }
}
