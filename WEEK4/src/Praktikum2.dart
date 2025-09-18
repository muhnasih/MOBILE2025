//void main (){
  //var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
//print(halogens);
//}

//void main() {
  //var names1 = <String>{};         // Set<String>
  //Set<String> names2 = {};         // Set<String>
  //var names3 = {};                 // Map<dynamic, dynamic> (bukan Set)

  //print(names1);
  //print(names2);
  //print(names3);
//}

void main() {
  var names1 = <String>{};        // Set kosong bertipe String
  Set<String> names2 = {};        // Set kosong bertipe String

  // Tambahkan elemen ke Set
  names1.add("Muhammad Nasih");   // dengan .add()
  names1.addAll(["23417200xxx"]); // dengan .addAll()

  names2.add("Nasih");            // dengan .add()
  names2.addAll(["23417200xxx"]); // dengan .addAll()

  // Cetak hasil
  print("names1: $names1");
  print("names2: $names2");
}
