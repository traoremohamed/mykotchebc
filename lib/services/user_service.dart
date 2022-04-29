import '../core.dart';

class UserService {
  User getProfile() {
    return User(
      name: "Christrian",
      email: "Christriand@gmail.com",
      gender: "Male",
      phone: "0708114795",
      photoURL: "assets/images/users/faisal-ramdan.jpg",
      dob: DateTime.parse("2017-03-17"),
      company: "Coding Your Life",
      address: "Permata Street No. 17, Bogor, West Java, Indonesia",
      balance: "17,7jt",
      membership: "Gold",
      progress: 77,
    );
  }
}
