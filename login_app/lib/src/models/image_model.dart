// To parse this JSON data, do
//
//     final imgur = imgurFromJson(jsonString);

import 'dart:convert';

Imgur imgurFromJson(String str) => Imgur.fromJson(json.decode(str));

String imgurToJson(Imgur data) => json.encode(data.toJson());

class Imgur {
    Data data;
    bool success;
    int status;

    Imgur({
        this.data,
        this.success,
        this.status,
    });

    factory Imgur.fromJson(Map<String, dynamic> json) => new Imgur(
        data: Data.fromJson(json["data"]),
        success: json["success"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
        "status": status,
    };
}

class Data {
    String id;
    dynamic title;
    dynamic description;
    int datetime;
    String type;
    bool animated;
    int width;
    int height;
    int size;
    int views;
    int bandwidth;
    dynamic vote;
    bool favorite;
    dynamic nsfw;
    dynamic section;
    dynamic accountUrl;
    int accountId;
    bool isAd;
    bool inMostViral;
    bool hasSound;
    List<dynamic> tags;
    int adType;
    String adUrl;
    String edited;
    bool inGallery;
    String deletehash;
    String name;
    String link;

    Data({
        this.id,
        this.title,
        this.description,
        this.datetime,
        this.type,
        this.animated,
        this.width,
        this.height,
        this.size,
        this.views,
        this.bandwidth,
        this.vote,
        this.favorite,
        this.nsfw,
        this.section,
        this.accountUrl,
        this.accountId,
        this.isAd,
        this.inMostViral,
        this.hasSound,
        this.tags,
        this.adType,
        this.adUrl,
        this.edited,
        this.inGallery,
        this.deletehash,
        this.name,
        this.link,
    });

    factory Data.fromJson(Map<String, dynamic> json) => new Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        datetime: json["datetime"],
        type: json["type"],
        animated: json["animated"],
        width: json["width"],
        height: json["height"],
        size: json["size"],
        views: json["views"],
        bandwidth: json["bandwidth"],
        vote: json["vote"],
        favorite: json["favorite"],
        nsfw: json["nsfw"],
        section: json["section"],
        accountUrl: json["account_url"],
        accountId: json["account_id"],
        isAd: json["is_ad"],
        inMostViral: json["in_most_viral"],
        hasSound: json["has_sound"],
        tags: new List<dynamic>.from(json["tags"].map((x) => x)),
        adType: json["ad_type"],
        adUrl: json["ad_url"],
        edited: json["edited"],
        inGallery: json["in_gallery"],
        deletehash: json["deletehash"],
        name: json["name"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "datetime": datetime,
        "type": type,
        "animated": animated,
        "width": width,
        "height": height,
        "size": size,
        "views": views,
        "bandwidth": bandwidth,
        "vote": vote,
        "favorite": favorite,
        "nsfw": nsfw,
        "section": section,
        "account_url": accountUrl,
        "account_id": accountId,
        "is_ad": isAd,
        "in_most_viral": inMostViral,
        "has_sound": hasSound,
        "tags": new List<dynamic>.from(tags.map((x) => x)),
        "ad_type": adType,
        "ad_url": adUrl,
        "edited": edited,
        "in_gallery": inGallery,
        "deletehash": deletehash,
        "name": name,
        "link": link,
    };
}
