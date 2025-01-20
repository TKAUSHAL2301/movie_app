class MovieDetailModel {
  MovieDetailModel({
     this.adult,
     this.backdropPath,
     this.belongsToCollection,
     this.budget,
     this.genres,
     this.homepage,
     this.id,
     this.imdbId,
     this.originCountry,
     this.originalLanguage,
     this.originalTitle,
     this.overview,
     this.popularity,
     this.posterPath,
     this.productionCompanies,
     this.productionCountries,
     this.releaseDate,
     this.revenue,
     this.runtime,
     this.spokenLanguages,
     this.status,
     this.tagline,
     this.title,
     this.video,
     this.voteAverage,
     this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetailModel copyWith({
    bool? adult,
    String? backdropPath,
    dynamic belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    DateTime? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieDetailModel(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  factory MovieDetailModel.fromJson(Map<String, dynamic> json){
    return MovieDetailModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      belongsToCollection: json["belongs_to_collection"],
      budget: json["budget"],
      genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      homepage: json["homepage"],
      id: json["id"],
      imdbId: json["imdb_id"],
      originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      productionCompanies: json["production_companies"] == null ? [] : List<ProductionCompany>.from(json["production_companies"]!.map((x) => ProductionCompany.fromJson(x))),
      productionCountries: json["production_countries"] == null ? [] : List<ProductionCountry>.from(json["production_countries"]!.map((x) => ProductionCountry.fromJson(x))),
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      revenue: json["revenue"],
      runtime: json["runtime"],
      spokenLanguages: json["spoken_languages"] == null ? [] : List<SpokenLanguage>.from(json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
      status: json["status"],
      tagline: json["tagline"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "belongs_to_collection": belongsToCollection,
    "budget": budget,
    "genres": genres?.map((x) => x.toJson()).toList(),
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "origin_country": originCountry?.map((x) => x).toList(),
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": productionCompanies?.map((x) => x.toJson()).toList(),
    "production_countries": productionCountries?.map((x) => x.toJson()).toList(),
    "revenue": revenue,
    "runtime": runtime,
    "spoken_languages": spokenLanguages?.map((x) => x.toJson()).toList(),
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };

}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  Genre copyWith({
    int? id,
    String? name,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json){
    return Genre(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

}

class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompany copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    return ProductionCompany(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  factory ProductionCompany.fromJson(Map<String, dynamic> json){
    return ProductionCompany(
      id: json["id"],
      logoPath: json["logo_path"],
      name: json["name"],
      originCountry: json["origin_country"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo_path": logoPath,
    "name": name,
    "origin_country": originCountry,
  };

}

class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String? iso31661;
  final String? name;

  ProductionCountry copyWith({
    String? iso31661,
    String? name,
  }) {
    return ProductionCountry(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  factory ProductionCountry.fromJson(Map<String, dynamic> json){
    return ProductionCountry(
      iso31661: json["iso_3166_1"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "iso_3166_1": iso31661,
    "name": name,
  };

}

class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguage copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) {
    return SpokenLanguage(
      englishName: englishName ?? this.englishName,
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
    );
  }

  factory SpokenLanguage.fromJson(Map<String, dynamic> json){
    return SpokenLanguage(
      englishName: json["english_name"],
      iso6391: json["iso_639_1"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "english_name": englishName,
    "iso_639_1": iso6391,
    "name": name,
  };

}