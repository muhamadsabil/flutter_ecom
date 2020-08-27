
import 'package:core/Networking/Environment.dart';


class Env extends Environment{
  Env(String baseURLString,
      String version,
      String clientID,
      String clientSecret,
      String accessKey,
      String theme) : super(baseURLString, version, clientID, clientSecret, accessKey, theme);

}

void setUpEnvironment(){
  Env("http://dummy.restapiexample.com/api/v1/employees", "version", "clientID", "clientSecret", "accessKey", "theme");
}