void main() {
  // Bagian if-else
  String test = "test2";

  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  if (test == "test2") {
    print("Test2 again");
  }

  // Tambahan kode if
  String test2 = "true";
  if (test2 == "true") {
    print("Kebenaran");
  }

  // Perulangan while
  int counter = 0;
  while (counter < 33) {
    print(counter);
    counter++;
  }

  // Perulangan do-while
  do {
  print(counter);
  counter++;
} while (counter < 77);

  // Perulangan for dengan break & continue
  for (int index = 10; index < 27; index++) {
    if (index == 21) break;                // berhenti jika index = 21
    else if (index > 1 && index < 7) continue; // lewati index 2–6
    print(index);
  }
}
