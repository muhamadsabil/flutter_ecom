

abstract class Environment {
   String get baseUrl;
   String get version;
   String get clientID;
   String get clientSecret;
   String get accessKey;

}
//
//extension on Environment{
//    Uri baseUrl(){
//       var url = Uri.parse(_baseUrl);
//       return url;
//    }
//}



