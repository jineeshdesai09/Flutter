class RxCrudModel {
  String name;
  bool isFavorite;

  RxCrudModel({required this.name, this.isFavorite = false});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isFavorite': isFavorite,
    };
  }

  factory RxCrudModel.fromMap(Map<String, dynamic> map) {
    return RxCrudModel(
      name: map['name'],
      isFavorite: map['isFavorite'] ?? false,
    );
  }
}
