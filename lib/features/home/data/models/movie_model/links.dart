import 'nextepisode.dart';
import 'previousepisode.dart';
import 'self.dart';

class Links {
  Self? self;
  Previousepisode? previousepisode;
  Nextepisode? nextepisode;

  Links({this.self, this.previousepisode, this.nextepisode});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json['self'] == null
            ? null
            : Self.fromJson(json['self'] as Map<String, dynamic>),
        previousepisode: json['previousepisode'] == null
            ? null
            : Previousepisode.fromJson(
                json['previousepisode'] as Map<String, dynamic>),
        nextepisode: json['nextepisode'] == null
            ? null
            : Nextepisode.fromJson(json['nextepisode'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'self': self?.toJson(),
        'previousepisode': previousepisode?.toJson(),
        'nextepisode': nextepisode?.toJson(),
      };
}
