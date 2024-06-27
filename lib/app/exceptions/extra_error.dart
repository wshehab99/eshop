class Extra {
  final ExtraError error;
  Extra(this.error);
  factory Extra.fromJson(Map<String, dynamic> json) =>
      Extra(ExtraError.fromJson(json['error']));
}

class ExtraError {
  final String type;
  final String field;
  final ExtraErrorButton button;
  ExtraError({
    required this.type,
    required this.button,
    required this.field,
  });
  factory ExtraError.fromJson(Map<String, dynamic> json) => ExtraError(
        button: ExtraErrorButton.fromJson(json['button']),
        field: json['field'],
        type: json['type'],
      );
}

class ExtraErrorButton {
  final String url;
  final String label;
  ExtraErrorButton(this.url, this.label);
  factory ExtraErrorButton.fromJson(Map<String, dynamic> json) =>
      ExtraErrorButton(json['url'], json['label']);
}
