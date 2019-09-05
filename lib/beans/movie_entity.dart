class MovieEntity {
	List<MovieMovie> movies;
	int total;

	MovieEntity({this.movies, this.total});

	MovieEntity.fromJson(Map<String, dynamic> json) {
		if (json['movies'] != null) {
			movies = new List<MovieMovie>();(json['movies'] as List).forEach((v) { movies.add(new MovieMovie.fromJson(v)); });
		}
		total = json['total'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.movies != null) {
      data['movies'] =  this.movies.map((v) => v.toJson()).toList();
    }
		data['total'] = this.total;
		return data;
	}
}

class MovieMovie {
	List<MovieMoviesAbridgedCast> abridgedCast;
	MovieMoviesAlternateIds alternateIds;
	int year;
	MovieMoviesRatings ratings;
	MovieMoviesReleaseDates releaseDates;
	MovieMoviesPosters posters;
	dynamic runtime;
	MovieMoviesLinks links;
	String id;
	String synopsis;
	String title;
	String mpaaRating;

	MovieMovie({this.abridgedCast, this.alternateIds, this.year, this.ratings, this.releaseDates, this.posters, this.runtime, this.links, this.id, this.synopsis, this.title, this.mpaaRating});

	MovieMovie.fromJson(Map<String, dynamic> json) {
		if (json['abridged_cast'] != null) {
			abridgedCast = new List<MovieMoviesAbridgedCast>();(json['abridged_cast'] as List).forEach((v) { abridgedCast.add(new MovieMoviesAbridgedCast.fromJson(v)); });
		}
		alternateIds = json['alternate_ids'] != null ? new MovieMoviesAlternateIds.fromJson(json['alternate_ids']) : null;
		year = json['year'];
		ratings = json['ratings'] != null ? new MovieMoviesRatings.fromJson(json['ratings']) : null;
		releaseDates = json['release_dates'] != null ? new MovieMoviesReleaseDates.fromJson(json['release_dates']) : null;
		posters = json['posters'] != null ? new MovieMoviesPosters.fromJson(json['posters']) : null;
		runtime = json['runtime'];
		links = json['links'] != null ? new MovieMoviesLinks.fromJson(json['links']) : null;
		id = json['id'];
		synopsis = json['synopsis'];
		title = json['title'];
		mpaaRating = json['mpaa_rating'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.abridgedCast != null) {
      data['abridged_cast'] =  this.abridgedCast.map((v) => v.toJson()).toList();
    }
		if (this.alternateIds != null) {
      data['alternate_ids'] = this.alternateIds.toJson();
    }
		data['year'] = this.year;
		if (this.ratings != null) {
      data['ratings'] = this.ratings.toJson();
    }
		if (this.releaseDates != null) {
      data['release_dates'] = this.releaseDates.toJson();
    }
		if (this.posters != null) {
      data['posters'] = this.posters.toJson();
    }
		data['runtime'] = this.runtime;
		if (this.links != null) {
      data['links'] = this.links.toJson();
    }
		data['id'] = this.id;
		data['synopsis'] = this.synopsis;
		data['title'] = this.title;
		data['mpaa_rating'] = this.mpaaRating;
		return data;
	}
}

class MovieMoviesAbridgedCast {
	List<String> characters;
	String name;
	String id;

	MovieMoviesAbridgedCast({this.characters, this.name, this.id});

	MovieMoviesAbridgedCast.fromJson(Map<String, dynamic> json) {
		characters = json['characters']?.cast<String>();
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['characters'] = this.characters;
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}
}

class MovieMoviesAlternateIds {
	String imdb;

	MovieMoviesAlternateIds({this.imdb});

	MovieMoviesAlternateIds.fromJson(Map<String, dynamic> json) {
		imdb = json['imdb'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['imdb'] = this.imdb;
		return data;
	}
}

class MovieMoviesRatings {
	String audienceRating;
	int audienceScore;
	String criticsRating;
	int criticsScore;

	MovieMoviesRatings({this.audienceRating, this.audienceScore, this.criticsRating, this.criticsScore});

	MovieMoviesRatings.fromJson(Map<String, dynamic> json) {
		audienceRating = json['audience_rating'];
		audienceScore = json['audience_score'];
		criticsRating = json['critics_rating'];
		criticsScore = json['critics_score'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['audience_rating'] = this.audienceRating;
		data['audience_score'] = this.audienceScore;
		data['critics_rating'] = this.criticsRating;
		data['critics_score'] = this.criticsScore;
		return data;
	}
}

class MovieMoviesReleaseDates {
	String dvd;
	String theater;

	MovieMoviesReleaseDates({this.dvd, this.theater});

	MovieMoviesReleaseDates.fromJson(Map<String, dynamic> json) {
		dvd = json['dvd'];
		theater = json['theater'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dvd'] = this.dvd;
		data['theater'] = this.theater;
		return data;
	}
}

class MovieMoviesPosters {
	String thumbnail;
	String original;
	String detailed;
	String profile;

	MovieMoviesPosters({this.thumbnail, this.original, this.detailed, this.profile});

	MovieMoviesPosters.fromJson(Map<String, dynamic> json) {
		thumbnail = json['thumbnail'];
		original = json['original'];
		detailed = json['detailed'];
		profile = json['profile'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['thumbnail'] = this.thumbnail;
		data['original'] = this.original;
		data['detailed'] = this.detailed;
		data['profile'] = this.profile;
		return data;
	}
}

class MovieMoviesLinks {
	String cast;
	String similar;
	String reviews;
	String self;
	String alternate;

	MovieMoviesLinks({this.cast, this.similar, this.reviews, this.self, this.alternate});

	MovieMoviesLinks.fromJson(Map<String, dynamic> json) {
		cast = json['cast'];
		similar = json['similar'];
		reviews = json['reviews'];
		self = json['self'];
		alternate = json['alternate'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cast'] = this.cast;
		data['similar'] = this.similar;
		data['reviews'] = this.reviews;
		data['self'] = this.self;
		data['alternate'] = this.alternate;
		return data;
	}
}
