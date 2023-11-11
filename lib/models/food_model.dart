class foodData {
  String? gategoryname;
  String? name;
  String? weight;
  String? calories;
  String? protein;
  String? fats;
  String? carbohydrate;
  String? sugars;
  foodData.fromjson(Map<dynamic, dynamic> json) {
    gategoryname = json['اسم المجموعه'];
    name = json['المنتج'];
    weight = json['الوزن'];
    calories = json['سعرات حرارية'];
    protein = json['بروتين'];
    fats = json['دهون'];
    carbohydrate = json['كربوهيدرات'];
    sugars = json['سكر'].toString();
  }
}

class nutfactdetails {
  String? name;
  String? images;
  List<foodData>? facts;
  nutfactdetails({
    required this.name,
    required this.images,
    required this.facts,
  });
}
