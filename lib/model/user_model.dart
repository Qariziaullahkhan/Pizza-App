class UserModel {
  String? id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  UserModel(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password, });
      Map<String,dynamic>toMap(){
        return {
          'id':id,
          'firstName':firstName,
          'lastName':lastName,
          'email':email,
          'phone':phone,
          'password':password
        };
      }
      factory UserModel.fromMap(Map<String,dynamic>map,String id){
        return UserModel(
          id: id,
          firstName: map['firstName'],
          lastName: map['lastName'],
          email: map['email'],
          phone: map['phone'],
          password: map['password']
        );
      }
}
