
class Brawler {
  int id;
  int avatarId;
  String name;
  String hash;
  String path;
  String fankit;
  bool released;
  int version;
  String link;
  String imageUrl;
  String imageUrl2;
  String imageUrl3;
  ClassInfo classInfo;
  Rarity rarity;
  // String unlock;
  String description;
  String descriptionHtml;
  List<StarPower> starPowers;
  List<Gadget> gadgets;
  List<dynamic> videos; // Assuming videos is an empty list or list of dynamic objects

  Brawler({
    required this.id,
    required this.avatarId,
    required this.name,
    required this.hash,
    required this.path,
    required this.fankit,
    required this.released,
    required this.version,
    required this.link,
    required this.imageUrl,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.classInfo,
    required this.rarity,
    // required this.unlock,
    required this.description,
    required this.descriptionHtml,
    required this.starPowers,
    required this.gadgets,
    required this.videos,
  });

  // fromJson method
  Brawler.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        avatarId = json['avatarId'],
        name = json['name'],
        hash = json['hash'],
        path = json['path'],
        fankit = json['fankit'],
        released = json['released'],
        version = json['version'],
        link = json['link'],
        imageUrl = json['imageUrl'],
        imageUrl2 = json['imageUrl2'],
        imageUrl3 = json['imageUrl3'],
        classInfo = ClassInfo.fromJson(json['class']),
        rarity = Rarity.fromJson(json['rarity']),
        // unlock = json['unlock'],
        description = json['description'],
        descriptionHtml = json['descriptionHtml'],
        starPowers = (json['starPowers'] as List)
            .map((i) => StarPower.fromJson(i))
            .toList(),
        gadgets = (json['gadgets'] as List)
            .map((i) => Gadget.fromJson(i))
            .toList(),
        videos = json['videos'];

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'avatarId': avatarId,
      'name': name,
      'hash': hash,
      'path': path,
      'fankit': fankit,
      'released': released,
      'version': version,
      'link': link,
      'imageUrl': imageUrl,
      'imageUrl2': imageUrl2,
      'imageUrl3': imageUrl3,
      'class': classInfo.toMap(),
      'rarity': rarity.toMap(),
      // 'unlock': unlock,
      'description': description,
      'descriptionHtml': descriptionHtml,
      'starPowers': starPowers.map((i) => i.toMap()).toList(),
      'gadgets': gadgets.map((i) => i.toMap()).toList(),
      'videos': videos,
    };
  }
}

class ClassInfo {
  int id;
  String name;

  ClassInfo({
    required this.id,
    required this.name,
  });

  // fromJson method
  ClassInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Rarity {
  int id;
  String name;
  String color;

  Rarity({
    required this.id,
    required this.name,
    required this.color,
  });

  // fromJson method
  Rarity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        color = json['color'];

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}

class StarPower {
  int id;
  String name;
  String path;
  int version;
  String description;
  String descriptionHtml;
  String? imageUrl;
  bool released;

  StarPower({
    required this.id,
    required this.name,
    required this.path,
    required this.version,
    required this.description,
    required this.descriptionHtml,
     this.imageUrl,
    required this.released,
  });

  // fromJson method
  StarPower.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        path = json['path'],
        version = json['version'],
        description = json['description'],
        descriptionHtml = json['descriptionHtml'],
        imageUrl = json['imageUrl'],
        released = json['released'];

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'path': path,
      'version': version,
      'description': description,
      'descriptionHtml': descriptionHtml,
      'imageUrl': imageUrl,
      'released': released,
    };
  }
}

class Gadget {
  int id;
  String name;
  String path;
  int version;
  String description;
  String descriptionHtml;
  String imageUrl;
  bool released;

  Gadget({
    required this.id,
    required this.name,
    required this.path,
    required this.version,
    required this.description,
    required this.descriptionHtml,
    required this.imageUrl,
    required this.released,
  });

  // fromJson method
  Gadget.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        path = json['path'],
        version = json['version'],
        description = json['description'],
        descriptionHtml = json['descriptionHtml'],
        imageUrl = json['imageUrl'],
        released = json['released'];

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'path': path,
      'version': version,
      'description': description,
      'descriptionHtml': descriptionHtml,
      'imageUrl': imageUrl,
      'released': released,
    };
  }
}