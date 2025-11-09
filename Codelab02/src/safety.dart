void main() {
  // Variabel biasa (tidak bisa null)
  String name = "Nasih";
  print("Nama: $name");

  // Variabel nullable (boleh null, karena ada '?')
  String? nickname;
  print("Nickname: $nickname"); // Output: null

  // Mengisi nilai setelahnya
  nickname = "Muhammad";
  print("Nickname baru: $nickname");
}
