class TransactionModel {
  String? title;
  String? category;
  String? description;
  String type;
  double amount;

  TransactionModel({this.title, this.category, required this.type, this.description,
    required this.amount}){}

  factory TransactionModel.fromJson(Map<String, dynamic> map){
    String title = map['title'];
    String category = map['category'];
    String description = map['description'];
    String type = map['type'];
    double amount = double.parse(map['amount'].toString());
    return TransactionModel(title: title, category: category, description: description, type: type, amount: amount);
  }

  toJson(){
    return {
      'title':title,
      'category':category,
      'type':type,
      'amount':amount,
      'description':description
    };
  }
}