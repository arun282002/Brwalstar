class iconModel {
  final Player player;
  final Club club;

  iconModel({
    required this.player,
    required this.club,
  });

  iconModel.fromJson(Map<String, dynamic> json)
      : player = Player.fromJson(json['player']),
        club = Club.fromJson(json['club']);

  Map<String, dynamic> toJson() => {
    'player': player.toJson(),
    'club': club.toJson(),
  };
}

class Player {
  final int id;
  final int playerId;
  final String name;
  final String name2;
  final String imageUrl;
  final String imageUrl2;
  final int? brawler;
  final int requiredTotalTrophies;
  final int sortOrder;
  final bool isReward;
  final bool isAvailableForOffers;

  Player({
    required this.id,
    required this.playerId,
    required this.name,
    required this.name2,
    required this.imageUrl,
    required this.imageUrl2,
    this.brawler,
    required this.requiredTotalTrophies,
    required this.sortOrder,
    required this.isReward,
    required this.isAvailableForOffers,
  });

  Player.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        playerId=json['playerId'],
        name = json['name'],
        name2 = json['name2'],
        imageUrl = json['imageUrl'],
        imageUrl2 = json['imageUrl2'],
        brawler = json['brawler'],
        requiredTotalTrophies = json['requiredTotalTrophies'],
        sortOrder = json['sortOrder'],
        isReward = json['isReward'],
        isAvailableForOffers = json['isAvailableForOffers'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'playerId':playerId,
    'name': name,
    'name2': name2,
    'imageUrl': imageUrl,
    'imageUrl2': imageUrl2,
    'brawler': brawler,
    'requiredTotalTrophies': requiredTotalTrophies,
    'sortOrder': sortOrder,
    'isReward': isReward,
    'isAvailableForOffers': isAvailableForOffers,
  };
}

class Club {
  final int id;
  final String imageUrl;

  Club({
    required this.id,
    required this.imageUrl,
  });

  Club.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'imageUrl': imageUrl,
  };
}