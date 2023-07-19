import 'dart:ui';

class ThemeColorJson {
  Colors? colors;

  ThemeColorJson({this.colors});

  ThemeColorJson.fromJson(Map<String, dynamic> json) {
    colors =
    json['colors'] != null ? new Colors.fromJson(json['colors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.colors != null) {
      data['colors'] = this.colors!.toJson();
    }
    return data;
  }
}

class Colors {
  int? primary;
  int? primaryLight;
  int? bgLight;
  int? secondary;
  int? error;
  int? success;

  Colors({this.primary, this.primaryLight, this.bgLight, this.secondary, this.error, this.success});

  Colors.fromJson(Map<String, dynamic> json) {
    primary = int.parse(json['primary']);
    primaryLight = int.parse(json['primary_light']);
    bgLight = int.parse(json['bg_light']);
    secondary = int.parse(json['secondary']);
    error = int.parse(json['error']);
    success = int.parse(json['success']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['primary_light'] = this.primaryLight;
    data['bg_light'] = this.bgLight;
    data['secondary'] = this.secondary;
    data['error'] = this.error;
    data['success'] = this.success;
    return data;
  }
}
