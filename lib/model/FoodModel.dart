class FoodModel{
  List<FoodData> foods;

  FoodModel({this.foods});

  FoodModel.fromJson(Map<String, dynamic> json){
    if(json['foods'] != null){
      foods = List<FoodData>();
      json['foods'].forEach((i){
        foods.add(FoodData.fromJson(i));
      });
    }
  }
}

class FoodData{
  String name, description, image;

  FoodData(this.name, this.description, this.image);

  FoodData.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;

    return data;
  }



}
