//void main(){
  //var gifts = {
  // Key:    Value
  //'first': 'partridge',
  //'second': 'turtledoves',
  //'fifth': 1
//};

//var nobleGases = {
  //2: 'helium',
  //10: 'neon',
  //18: 2,
//};

//print(gifts);
//print(nobleGases);
//}

//void main() {
  //var gifts = {
    //'first': 'partridge',
    //'second': 'turtledoves',
    //'fifth': 1
  //};

  //var nobleGases = {
    //2: 'helium',
    //10: 'neon',
    //18: 2,
  //};

  //var mhs1 = Map<String, String>();
  //gifts['first'] = 'partridge';
  //gifts['second'] = 'turtledoves';
  //gifts['fifth'] = 'golden rings';

  //var mhs2 = Map<int, String>();
  //nobleGases[2] = 'helium';
  //nobleGases[10] = 'neon';
  //nobleGases[18] = 'argon';

  //print(gifts);
  //print(nobleGases);
  //print(mhs1);
  //print(mhs2);
//}

void main() {
  // Map dengan key String
  Map<String, String> gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  // Map dengan key int
  Map<int, String> nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon'
  };

  // Map kosong bertipe String-String
  var mhs1 = Map<String, String>();
  gifts['name'] = 'Muhammad Nasih';
  gifts['nim'] = '2341720009';

  mhs1['name'] = 'Muhammad Nasih';
  mhs1['nim'] = '2341720009';

  // Map kosong bertipe int-String
  var mhs2 = Map<int, String>();
  nobleGases[20] = 'Muhammad Nasih';
  nobleGases[21] = '2341720009';

  mhs2[1] = 'Muhammad Nasih';
  mhs2[2] = '2341720009';

  print("gifts: $gifts");
  print("nobleGases: $nobleGases");
  print("mhs1: $mhs1");
  print("mhs2: $mhs2");

}