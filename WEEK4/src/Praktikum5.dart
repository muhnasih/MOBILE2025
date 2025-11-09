(int, int) tukar((int, int) record) {
  var (a, b) = record;  
  return (b, a);        
}

void main() {
  var record = (10, 20);   
  print("Sebelum ditukar: $record");

  var hasil = tukar(record);
  print("Sesudah ditukar: $hasil");

  // Record type annotation with initialization
  (String, int) mahasiswa = ('Muhammad Nasih', 234172009);
  print("Data mahasiswa: $mahasiswa");

  var mahasiswa2 = ('first', a: 2, b: true, 'last');

void main() {
  var mahasiswa2 = ('Muhammad Nasih', a: 224172009, b: true, 'Polinema');

  print(mahasiswa2.$1); // Prints 'Muhammad Nasih'
  print(mahasiswa2.a);  // Prints '2341720009'
  print(mahasiswa2.b);  // Prints true
  print(mahasiswa2.$2); // Prints 'Polinema'
}

}
