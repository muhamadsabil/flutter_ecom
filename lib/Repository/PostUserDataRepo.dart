import 'package:core/Models/UserData.dart';
import 'package:core/Networking/APIClient.dart';
import 'package:flutter_modular_app/API/GetEmployeeData.dart';
import 'package:flutter_modular_app/API/PostUserData.dart';
import 'package:flutter_modular_app/SetUpEnvironment.dart';
import 'package:flutter_modular_app/ui/home/UserForm.dart';
import 'package:http/http.dart';
class PostUserDataRepo{
// final String title;
 String  name;
 String  email;
 String  address;
 String  phone;
 String  website;
 String  company;


 Client _client;
 PostUserData postUserData;
 APIClient _apiClient;
// SetUpEnvironment setUpEnvironment;

//  PostUserDataRepo(this.title);

 Future<UserData> makeRequest() async {
 _client = Client();
 postUserData = PostUserData();
 _apiClient = APIClient(_client);
// setUpEnvironment = SetUpEnvironment();

 final serverResponse = await _apiClient.request(service: postUserData );
 print(serverResponse);

 return UserData.fromJson(serverResponse);
 }
 }
