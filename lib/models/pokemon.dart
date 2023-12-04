// class Pokemon {
//   final int id;
//   final int height;
//   final int weight;
//   final String name;
//
//   Pokemon({required this.name,
//     required this.id,
//     required this.weight,
//     required this.height});
//
//   factory Pokemon.fromJson(Map<String, dynamic> json) {
//     return Pokemon(
//         height: json['height'],
//         weight: json['weight'],
//         id: json['id'] as int,
//         name: json['results'][0]['name'] as String
//     );
//   }
// }

class Pokemon {
  int id;
  String name;
  String img;
  // double weight;
  // double height;
  Pokemon.fromJson(Map<String, dynamic> data)
      : id = data['id'],
      name = data['name'],
      img = data['img'];
      // weight = data['weight'],
      // height = data['height'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'img': img,
    // 'weight':weight,
    // 'height':height
  };
}
