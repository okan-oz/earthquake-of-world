

import 'dart:convert';

EarthquakeCollection earthquakeCollectionFromJson(String str) => EarthquakeCollection.fromJson(json.decode(str));

String earthquakeCollectionToJson(EarthquakeCollection data) => json.encode(data.toJson());

class EarthquakeCollection {
    EarthquakeCollection({
        this.type,
        this.metadata,
        this.features,
        this.bbox,
    });

    String type;
    Metadata metadata;
    List<Feature> features;
    List<double> bbox;

    factory EarthquakeCollection.fromJson(Map<String, dynamic> json) => EarthquakeCollection(
        type: json["type"],
        metadata: Metadata.fromJson(json["metadata"]),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        bbox:json["bbox"]!=null ? List<double>.from(json["bbox"].map((x) => x.toDouble())):null,
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "metadata": metadata.toJson(),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
    };
}

class Feature {
    Feature({
        this.type,
        this.properties,
        this.geometry,
        this.id,
    });

    FeatureType type;
    Properties properties;
    Geometry geometry;
    String id;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: featureTypeValues.map[json["type"]],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": featureTypeValues.reverse[type],
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
        "id": id,
    };
}

class Geometry {
    Geometry({
        this.type,
        this.coordinates,
    });

    GeometryType type;
    List<double> coordinates;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: geometryTypeValues.map[json["type"]],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": geometryTypeValues.reverse[type],
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({
    "Point": GeometryType.POINT
});

class Properties {
    Properties({
        this.mag,
        this.place,
        this.time,
        this.updated,
        this.tz,
        this.url,
        this.detail,
        this.felt,
        this.cdi,
        this.mmi,
        this.alert,
        this.status,
        this.tsunami,
        this.sig,
        this.net,
        this.code,
        this.ids,
        this.sources,
        this.types,
        this.nst,
        this.dmin,
        this.rms,
        this.gap,
        this.magType,
        this.type,
        this.title,
    });

    double mag;
    String place;
    int time;
    int updated;
    dynamic tz;
    String url;
    String detail;
    int felt;
    double cdi;
    double mmi;
    Alert alert;
    Status status;
    int tsunami;
    int sig;
    Net net;
    String code;
    String ids;
    String sources;
    String types;
    int nst;
    double dmin;
    double rms;
    double gap;
    MagType magType;
    PropertiesType type;
    String title;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        mag: json["mag"].toDouble(),
        place: json["place"],
        time: json["time"],
        updated: json["updated"],
        tz: json["tz"],
        url: json["url"],
        detail: json["detail"],
        felt: json["felt"] == null ? null : json["felt"],
        cdi: json["cdi"] == null ? null : json["cdi"].toDouble(),
        mmi: json["mmi"] == null ? null : json["mmi"].toDouble(),
        alert: json["alert"] == null ? null : alertValues.map[json["alert"]],
        status: statusValues.map[json["status"]],
        tsunami: json["tsunami"],
        sig: json["sig"],
        net: netValues.map[json["net"]],
        code: json["code"],
        ids: json["ids"],
        sources: json["sources"],
        types: json["types"],
        nst: json["nst"] == null ? null : json["nst"],
        dmin: json["dmin"] == null ? null : json["dmin"].toDouble(),
        rms:json["rms"]!=null ? json["rms"].toDouble():0,
        gap: json["gap"] == null ? null : json["gap"].toDouble(),
        magType: magTypeValues.map[json["magType"]],
        type: propertiesTypeValues.map[json["type"]],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "mag": mag,
        "place": place,
        "time": time,
        "updated": updated,
        "tz": tz,
        "url": url,
        "detail": detail,
        "felt": felt == null ? null : felt,
        "cdi": cdi == null ? null : cdi,
        "mmi": mmi == null ? null : mmi,
        "alert": alert == null ? null : alertValues.reverse[alert],
        "status": statusValues.reverse[status],
        "tsunami": tsunami,
        "sig": sig,
        "net": netValues.reverse[net],
        "code": code,
        "ids": ids,
        "sources": sources,
        "types": types,
        "nst": nst == null ? null : nst,
        "dmin": dmin == null ? null : dmin,
        "rms": rms,
        "gap": gap == null ? null : gap,
        "magType": magTypeValues.reverse[magType],
        "type": propertiesTypeValues.reverse[type],
        "title": title,
    };
}

enum Alert { GREEN }

final alertValues = EnumValues({
    "green": Alert.GREEN
});

enum MagType { MD, ML, MB, MWW, MB_LG, MWR, MW }

final magTypeValues = EnumValues({
    "mb": MagType.MB,
    "mb_lg": MagType.MB_LG,
    "md": MagType.MD,
    "ml": MagType.ML,
    "mw": MagType.MW,
    "mwr": MagType.MWR,
    "mww": MagType.MWW
});

enum Net { PR, NM, HV, NN, CI, US, NC, AK, UU, MB, OK, AV, UW, SE }

final netValues = EnumValues({
    "ak": Net.AK,
    "av": Net.AV,
    "ci": Net.CI,
    "hv": Net.HV,
    "mb": Net.MB,
    "nc": Net.NC,
    "nm": Net.NM,
    "nn": Net.NN,
    "ok": Net.OK,
    "pr": Net.PR,
    "se": Net.SE,
    "us": Net.US,
    "uu": Net.UU,
    "uw": Net.UW
});

enum Status { REVIEWED, AUTOMATIC }

final statusValues = EnumValues({
    "automatic": Status.AUTOMATIC,
    "reviewed": Status.REVIEWED
});

enum PropertiesType { EARTHQUAKE, QUARRY_BLAST, MINE_COLLAPSE, EXPLOSION }

final propertiesTypeValues = EnumValues({
    "earthquake": PropertiesType.EARTHQUAKE,
    "explosion": PropertiesType.EXPLOSION,
    "mine collapse": PropertiesType.MINE_COLLAPSE,
    "quarry blast": PropertiesType.QUARRY_BLAST
});

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({
    "Feature": FeatureType.FEATURE
});

class Metadata {
    Metadata({
        this.generated,
        this.url,
        this.title,
        this.status,
        this.api,
        this.count,
    });

    int generated;
    String url;
    String title;
    int status;
    String api;
    int count;

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        generated: json["generated"],
        url: json["url"],
        title: json["title"],
        status: json["status"],
        api: json["api"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "generated": generated,
        "url": url,
        "title": title,
        "status": status,
        "api": api,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
