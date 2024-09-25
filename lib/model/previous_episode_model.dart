class PreviousEpisodeModel {
  int? id;
  String? url;
  String? name;
  int? season;
  int? number;
  String? type;
  String? airdate;
  String? airtime;
  String? airstamp;
  int? runtime;
  Rating? rating;
  Map<String, dynamic>? image;
  String? summary;
  Links? lLinks;

  PreviousEpisodeModel(
      {this.id,
        this.url,
        this.name,
        this.season,
        this.number,
        this.type,
        this.airdate,
        this.airtime,
        this.airstamp,
        this.runtime,
        this.rating,
        this.image,
        this.summary,
        this.lLinks});

  PreviousEpisodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    season = json['season'];
    number = json['number'];
    type = json['type'];
    airdate = json['airdate'];
    airtime = json['airtime'];
    airstamp = json['airstamp'];
    runtime = json['runtime'];
    rating =
    json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    image = json['image'];
    summary = json['summary'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    data['season'] = season;
    data['number'] = number;
    data['type'] = type;
    data['airdate'] = airdate;
    data['airtime'] = airtime;
    data['airstamp'] = airstamp;
    data['runtime'] = runtime;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['image'] = image;
    data['summary'] = summary;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class Rating {
  String? average;

  Rating({this.average});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['average'] = average;
    return data;
  }
}

class Links {
  Self? self;
  Show? show;

  Links({this.self, this.show});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
    show = json['show'] != null ? Show.fromJson(json['show']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.toJson();
    }
    if (show != null) {
      data['show'] = show!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Show {
  String? href;
  String? name;

  Show({this.href, this.name});

  Show.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['name'] = name;
    return data;
  }
}
