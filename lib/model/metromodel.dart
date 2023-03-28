class GetPromotersDetailsResponse {
  GetPromotersDetailsResponse({
    required this.data,
    required this.status,
    required this.code,
    required this.statusMessage,
  });
  late final List<AutoGenerate> data;
  late final String status;
  late final String code;
  late final String statusMessage;

  GetPromotersDetailsResponse.fromJson(Map<String, dynamic> json) {
    data =
        List.from(json['data']).map((e) => AutoGenerate.fromJson(e)).toList();
    status = json['status'];
    code = json['code'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['status'] = status;
    _data['code'] = code;
    _data['statusMessage'] = statusMessage;
    return _data;
  }
}



class AutoGenerate {
  AutoGenerate({
    required this.line1,
    required this.line2,
    required this.interchange,
    required this.lineEnds,
    required this.path,
    required this.time,
  });
  late final List<String> line1;
  late final List<String> line2;
  late final List<String> interchange;
  late final List<String> lineEnds;
  late final List<String> path;
  late final double time;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    line1 = List.from(json['line1']);
    line2 = List.castFrom<dynamic, String>(json['line2']);
    interchange = List.castFrom<dynamic, String>(json['interchange']);
    lineEnds = List.castFrom<dynamic, String>(json['lineEnds']);
    path = List.castFrom<dynamic, String>(json['path']);
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['line1'] = line1;
    _data['line2'] = line2;
    _data['interchange'] = interchange;
    _data['lineEnds'] = lineEnds;
    _data['path'] = path;
    _data['time'] = time;
    return _data;
  }
}
