class DummyResponse {
  int? id;
  int? column1;

  DummyResponse({this.id, this.column1});

  DummyResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    column1 = json['Column 1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Column 1'] = this.column1;
    return data;
  }
}