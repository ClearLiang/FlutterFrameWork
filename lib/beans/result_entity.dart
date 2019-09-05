class ResultEntity {
	int code;
	String message;

	ResultEntity({this.code, this.message});

	ResultEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['message'] = this.message;
		return data;
	}
}
