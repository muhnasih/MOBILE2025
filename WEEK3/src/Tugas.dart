void main() {

  String nama = "Muhammad Nasih";
  String nim = "2341720009";

  for (int i = 0; i <= 201; i++) {
    bool prima = true;

    if (i < 2) {
      prima = false; 
    } else {
      for (int j = 2; j < i; j++) {
        if (i % j == 0) {
          prima = false;
          break;
        }
      }
    }

    if (prima) {
      print("$i adalah bilangan prima → $nama ($nim)");
    }
  }
}
