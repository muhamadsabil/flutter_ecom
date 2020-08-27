abstract class Environment {
  final String baseURLString;
  final String version;
  final String clientID;
  final String clientSecret;
  final String accessKey;
  final String theme;

  Environment(this.baseURLString, this.version, this.clientID, this.clientSecret, this.accessKey, this.theme);
}
