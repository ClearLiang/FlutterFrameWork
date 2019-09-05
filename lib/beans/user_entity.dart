class UserEntity {
	List<UserPerson> persons;
	int count;

	UserEntity({this.persons, this.count});

	UserEntity.fromJson(Map<String, dynamic> json) {
		if (json['persons'] != null) {
			persons = new List<UserPerson>();(json['persons'] as List).forEach((v) { persons.add(new UserPerson.fromJson(v)); });
		}
		count = json['count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.persons != null) {
      data['persons'] =  this.persons.map((v) => v.toJson()).toList();
    }
		data['count'] = this.count;
		return data;
	}
}

class UserPerson {
	String name;
	String email;

	UserPerson({this.name, this.email});

	UserPerson.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		email = json['email'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['email'] = this.email;
		return data;
	}
}
