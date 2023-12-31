class UserModel
{
  static const String collectionName = 'users';
  String? id;
  String? name;
  String? age;
  String? email;
  UserModel({this.id = '', this.name, this.age, this.email});
 
UserModel.fromFirestore(Map <String, dynamic>json):this(
  id:json['id'],
  name: json['name'],
  age: json['age'],
  email: json['email']
   );

  Map <String, dynamic> toFireStore(){
    return{
    'id':id,
    'name':name,
    'age' : age,
    'email':email
    };
  }

}