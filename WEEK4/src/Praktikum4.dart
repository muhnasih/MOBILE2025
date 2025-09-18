//void main(){
  //var list = [1, 2, 3];
//var list2 = [0, ...list];
//print(list1);
//print(list2);
//print(list2.length);
//}

//void main() {
  //var list = [1, 2, 3];
  //var list2 = [0, ...list];   

  //print(list);                
  //print(list2);               
  //print(list2.length);        

  //list1 = [1, 2, null];
//print(list1);
//var list3 = [0, ...?list1];
//print(list3.length);

//}

void main() {
  String login = 'Manager'; // coba ubah nilainya ke 'User' atau 'Admin'

  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (login == 'Manager') 'Inventory'
  ];

  print("login = $login -> $nav2");

  // Coba kondisi lain
  login = 'User';
  var nav3 = [
    'Home',
    'Furniture',
    'Plants',
    if (login == 'Manager') 'Inventory'
  ];
  print("login = $login -> $nav3");

  login = 'Admin';
  var nav4 = [
    'Home',
    'Furniture',
    'Plants',
    if (login == 'Manager') 'Inventory'
  ];
  print("login = $login -> $nav4");

  var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');
print(listOfStrings);
}
