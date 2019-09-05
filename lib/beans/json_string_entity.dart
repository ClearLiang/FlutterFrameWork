class JsonStringEntity {
	String msg;
	int code;
	List<JsonStringData> data;

	JsonStringEntity({this.msg, this.code, this.data});

	JsonStringEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<JsonStringData>();(json['data'] as List).forEach((v) { data.add(new JsonStringData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class JsonStringData {
	String color;
	int width;
	int fontSize;
	String text;
	int type;
	int height;

	JsonStringData({this.color, this.width, this.fontSize, this.text, this.type, this.height});

	JsonStringData.fromJson(Map<String, dynamic> json) {
		color = json['color'];
		width = json['width'];
		fontSize = json['fontSize'];
		text = json['text'];
		type = json['type'];
		height = json['height'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['color'] = this.color;
		data['width'] = this.width;
		data['fontSize'] = this.fontSize;
		data['text'] = this.text;
		data['type'] = this.type;
		data['height'] = this.height;
		return data;
	}
}
