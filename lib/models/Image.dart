// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
    Image({
        this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.author,
        this.commentStatus,
        this.pingStatus,
        this.template,
        this.meta,
        this.description,
        this.caption,
        this.altText,
        this.mediaType,
        this.mimeType,
        this.mediaDetails,
        this.post,
        this.sourceUrl,
        this.links,
    });

    int id;
    DateTime date;
    DateTime dateGmt;
    Caption guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    String status;
    String type;
    String link;
    Caption title;
    int author;
    String commentStatus;
    String pingStatus;
    String template;
    List<dynamic> meta;
    Caption description;
    Caption caption;
    String altText;
    String mediaType;
    String mimeType;
    MediaDetails mediaDetails;
    int post;
    String sourceUrl;
    Links links;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Caption.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Caption.fromJson(json["title"]),
        author: json["author"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        template: json["template"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        description: Caption.fromJson(json["description"]),
        caption: Caption.fromJson(json["caption"]),
        altText: json["alt_text"],
        mediaType: json["media_type"],
        mimeType: json["mime_type"],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        post: json["post"],
        sourceUrl: json["source_url"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "author": author,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "template": template,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "description": description.toJson(),
        "caption": caption.toJson(),
        "alt_text": altText,
        "media_type": mediaType,
        "mime_type": mimeType,
        "media_details": mediaDetails.toJson(),
        "post": post,
        "source_url": sourceUrl,
        "_links": links.toJson(),
    };
}

class Caption {
    Caption({
        this.rendered,
    });

    String rendered;

    factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

class Links {
    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<Author> replies;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
    };
}

class About {
    About({
        this.attributes,
        this.href,
    });

    List<dynamic> attributes;
    String href;

    factory About.fromJson(Map<String, dynamic> json) => About(
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "href": href,
    };
}

class Author {
    Author({
        this.attributes,
        this.href,
    });

    Attributes attributes;
    String href;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        attributes: Attributes.fromJson(json["attributes"]),
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
        "href": href,
    };
}

class Attributes {
    Attributes({
        this.embeddable,
    });

    bool embeddable;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        embeddable: json["embeddable"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
    };
}

class MediaDetails {
    MediaDetails({
        this.width,
        this.height,
        this.file,
        this.sizes,
        this.imageMeta,
    });

    int width;
    int height;
    String file;
    Sizes sizes;
    ImageMeta imageMeta;

    factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        sizes: Sizes.fromJson(json["sizes"]),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": sizes.toJson(),
        "image_meta": imageMeta.toJson(),
    };
}

class ImageMeta {
    ImageMeta({
        this.aperture,
        this.credit,
        this.camera,
        this.caption,
        this.createdTimestamp,
        this.copyright,
        this.focalLength,
        this.iso,
        this.shutterSpeed,
        this.title,
        this.orientation,
        this.keywords,
    });

    String aperture;
    String credit;
    String camera;
    String caption;
    String createdTimestamp;
    String copyright;
    String focalLength;
    String iso;
    String shutterSpeed;
    String title;
    String orientation;
    List<dynamic> keywords;

    factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
    };
}

class Sizes {
    Sizes({
        this.thumbnail,
        this.medium,
        this.mediumLarge,
        this.postThumbnail,
        this.full,
    });

    Full thumbnail;
    Full medium;
    Full mediumLarge;
    Full postThumbnail;
    Full full;

    factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        thumbnail: Full.fromJson(json["thumbnail"]),
        medium: Full.fromJson(json["medium"]),
        mediumLarge: Full.fromJson(json["medium_large"]),
        postThumbnail: Full.fromJson(json["post-thumbnail"]),
        full: Full.fromJson(json["full"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "medium": medium.toJson(),
        "medium_large": mediumLarge.toJson(),
        "post-thumbnail": postThumbnail.toJson(),
        "full": full.toJson(),
    };
}

class Full {
    Full({
        this.file,
        this.width,
        this.height,
        this.mimeType,
        this.sourceUrl,
    });

    String file;
    int width;
    int height;
    String mimeType;
    String sourceUrl;

    factory Full.fromJson(Map<String, dynamic> json) => Full(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: json["mime_type"],
        sourceUrl: json["source_url"],
    );

    Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime_type": mimeType,
        "source_url": sourceUrl,
    };
}
