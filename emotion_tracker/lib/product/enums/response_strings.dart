enum ResponseEnum {
  token('Token token="7292aee71e6070a54a56d15a01257019"'),
  authorization('Authorization'),
  getResponseHttp('https://favqs.com/api/quotes/');

  final String value;

  const ResponseEnum(this.value);

  String get toAuthorization => value;
  String toFilter(String emotion) {
    return '$value?filter=$emotion';
  }
}
