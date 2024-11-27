import 'externals.dart';
import 'image_model.dart';
import 'links.dart';
import 'network.dart';
import 'rating.dart';
import 'schedule.dart';

class Show {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  String? premiered;
  dynamic ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  dynamic webChannel;
  dynamic dvdCountry;
  Externals? externals;
  ImageModel? image;
  String? summary;
  int? updated;
  Links? links;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json['id'] as int?,
        url: json['url'] as String?,
        name: json['name'] as String?,
        type: json['type'] as String?,
        language: json['language'] as String?,
        genres: json['genres'] as List<String>?,
        status: json['status'] as String?,
        runtime: json['runtime'] as int?,
        averageRuntime: json['averageRuntime'] as int?,
        premiered: json['premiered'] as String?,
        ended: json['ended'] as dynamic,
        officialSite: json['officialSite'] as String?,
        schedule: json['schedule'] == null
            ? null
            : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
        weight: json['weight'] as int?,
        network: json['network'] == null
            ? null
            : Network.fromJson(json['network'] as Map<String, dynamic>),
        webChannel: json['webChannel'] as dynamic,
        dvdCountry: json['dvdCountry'] as dynamic,
        externals: json['externals'] == null
            ? null
            : Externals.fromJson(json['externals'] as Map<String, dynamic>),
        image: json['image'] == null
            ? null
            : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
        summary: json['summary'] as String?,
        updated: json['updated'] as int?,
        links: json['_links'] == null
            ? null
            : Links.fromJson(json['_links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'name': name,
        'type': type,
        'language': language,
        'genres': genres,
        'status': status,
        'runtime': runtime,
        'averageRuntime': averageRuntime,
        'premiered': premiered,
        'ended': ended,
        'officialSite': officialSite,
        'schedule': schedule?.toJson(),
        'rating': rating?.toJson(),
        'weight': weight,
        'network': network?.toJson(),
        'webChannel': webChannel,
        'dvdCountry': dvdCountry,
        'externals': externals?.toJson(),
        'image': image?.toJson(),
        'summary': summary,
        'updated': updated,
        '_links': links?.toJson(),
      };
}
