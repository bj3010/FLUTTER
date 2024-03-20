class usermodel {
  String _PersonName = "";

  String get PersonName => _PersonName;

  set PersonName(String value) {
    _PersonName = value;
  }

  String _password = "";
  String _city = "";

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  Map<String, dynamic> mapconvert() {
    return {"PersonName": _PersonName, "password": _password, "city": _city};
  }
}
