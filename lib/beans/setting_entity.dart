class SettingEntity {
	String search;
	String token;

	SettingEntity({this.search, this.token});

	SettingEntity.fromJson(Map<String, dynamic> json) {
		search = json['search'];
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['search'] = this.search;
		data['token'] = this.token;
		return data;
	}
}
