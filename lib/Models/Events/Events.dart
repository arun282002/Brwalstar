class BrawlifyResponse {
  List<EventSlot> active;
  List<EventSlot> upcoming;

  BrawlifyResponse({required this.active, required this.upcoming});

  BrawlifyResponse.fromJson(Map<String, dynamic> json)
      : active = (json['active'] as List).map((e) => EventSlot.fromJson(e)).toList(),
        upcoming = (json['upcoming'] as List).map((e) => EventSlot.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
    'active': active.map((e) => e.toJson()).toList(),
    'upcoming': upcoming.map((e) => e.toJson()).toList(),
  };
}

class EventSlot {
  Slot slot;
  bool predicted;
  String startTime;
  String endTime;
  int reward;
  MapData map;
  dynamic modifier;

  EventSlot({
    required this.slot,
    required this.predicted,
    required this.startTime,
    required this.endTime,
    required this.reward,
    required this.map,
    this.modifier,
  });

  EventSlot.fromJson(Map<String, dynamic> json)
      : slot = Slot.fromJson(json['slot']),
        predicted = json['predicted'],
        startTime = json['startTime'],
        endTime = json['endTime'],
        reward = json['reward'],
        map = MapData.fromJson(json['map']),
        modifier = json['modifier'];

  Map<String, dynamic> toJson() => {
    'slot': slot.toJson(),
    'predicted': predicted,
    'startTime': startTime,
    'endTime': endTime,
    'reward': reward,
    'map': map.toJson(),
    'modifier': modifier,
  };
}

class Slot {
  int id;
  String name;
  String emoji;
  String hash;
  bool listAlone;
  bool hideable;
  int? hideForSlot;
  dynamic background;

  Slot({
    required this.id,
    required this.name,
    required this.emoji,
    required this.hash,
    required this.listAlone,
    required this.hideable,
   this.hideForSlot,
    this.background,
  });

  Slot.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        emoji = json['emoji'],
        hash = json['hash'],
        listAlone = json['listAlone'],
        hideable = json['hideable'],
        hideForSlot = json['hideForSlot'],
        background = json['background'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'emoji': emoji,
    'hash': hash,
    'listAlone': listAlone,
    'hideable': hideable,
    'hideForSlot': hideForSlot,
    'background': background,
  };
}

class MapData {
  int id;
  bool isNew;
  bool disabled;
  String name;
  String hash;
  int version;
  String link;
  String imageUrl;
  String? credit;
  Environment environment;
  GameMode gameMode;
  int lastActive;
  int dataUpdated;
  List<BrawlerStat> stats;
  List<dynamic> teamStats;

  MapData({
    required this.id,
    required this.isNew,
    required this.disabled,
    required this.name,
    required this.hash,
    required this.version,
    required this.link,
    required this.imageUrl,
     this.credit,
    required this.environment,
    required this.gameMode,
    required this.lastActive,
    required this.dataUpdated,
    required this.stats,
    required this.teamStats,
  });

  MapData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        isNew = json['new'],
        disabled = json['disabled'],
        name = json['name'],
        hash = json['hash'],
        version = json['version'],
        link = json['link'],
        imageUrl = json['imageUrl'],
        credit = json['credit'],
        environment = Environment.fromJson(json['environment']),
        gameMode = GameMode.fromJson(json['gameMode']),
        lastActive = json['lastActive'],
        dataUpdated = json['dataUpdated'],
        stats = (json['stats'] as List).map((e) => BrawlerStat.fromJson(e)).toList(),
        teamStats = json['teamStats'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'new': isNew,
    'disabled': disabled,
    'name': name,
    'hash': hash,
    'version': version,
    'link': link,
    'imageUrl': imageUrl,
    'credit': credit,
    'environment': environment.toJson(),
    'gameMode': gameMode.toJson(),
    'lastActive': lastActive,
    'dataUpdated': dataUpdated,
    'stats': stats.map((e) => e.toJson()).toList(),
    'teamStats': teamStats,
  };
}

class Environment {
  int id;
  String name;
  String hash;
  String path;
  int version;
  String imageUrl;

  Environment({
    required this.id,
    required this.name,
    required this.hash,
    required this.path,
    required this.version,
    required this.imageUrl,
  });

  Environment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        hash = json['hash'],
        path = json['path'],
        version = json['version'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'hash': hash,
    'path': path,
    'version': version,
    'imageUrl': imageUrl,
  };
}

class GameMode {
  int? id;
  String name;
  String hash;
  int version;
  String color;
  String bgColor;
  String link;
  String imageUrl;

  GameMode({
     this.id,
    required this.name,
    required this.hash,
    required this.version,
    required this.color,
    required this.bgColor,
    required this.link,
    required this.imageUrl,
  });

  GameMode.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        hash = json['hash'],
        version = json['version'],
        color = json['color'],
        bgColor = json['bgColor'],
        link = json['link'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'hash': hash,
    'version': version,
    'color': color,
    'bgColor': bgColor,
    'link': link,
    'imageUrl': imageUrl,
  };
}

class BrawlerStat {
  num brawler;
  num winRate;
  num useRate;

  BrawlerStat({
    required this.brawler,
    required this.winRate,
    required this.useRate,
  });

  BrawlerStat.fromJson(Map<String, dynamic> json)
      : brawler = json['brawler'],
        winRate = json['winRate'],
        useRate = json['useRate'];

  Map<String, dynamic> toJson() => {
    'brawler': brawler,
    'winRate': winRate,
    'useRate': useRate,
  };
}
