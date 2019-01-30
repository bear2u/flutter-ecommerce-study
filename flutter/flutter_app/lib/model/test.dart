import 'package:json_annotation/json_annotation.dart';

//step2
part 'test.g.dart';

enum Sex {
  MALE, FEMALE
}

class SubTest{
  String name;
}

//step1
@JsonSerializable(

)
class Test{
 String name;
 String birth;
 int age;
 Sex male;
 SubTest subTest;

 //{ <- optional variable
 // <- 필수 변수
 // Test(name: 'kim')
 // Test('kim', '1981', '3222' , true)
 Test({this.name, this.birth, this.age, this.male});

 //step3
 // Server -> Bloc
 factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

 //step4
 // Bloc -> Server
 Map<String, dynamic> toJson() => _$TestToJson(this);

 @override
 String toString() {
   return 'Test{name: $name, birth: $birth, age: $age, male: $male}';
 }


}