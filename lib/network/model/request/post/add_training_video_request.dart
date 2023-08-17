class AddTrainingVideoRequest {
  String? name;
  String? productId;
  String? maxSize;

  AddTrainingVideoRequest({this.name, this.productId, this.maxSize});

  AddTrainingVideoRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productId = json['product_id'];
    maxSize = json['max_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['max_size'] = this.maxSize;
    return data;
  }
}
