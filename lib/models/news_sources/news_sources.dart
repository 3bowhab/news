import 'package:json_annotation/json_annotation.dart';

import 'source.dart';

part 'news_sources.g.dart';

@JsonSerializable()
class NewsSources {
	String? status;
	List<Source>? sources;

	NewsSources({this.status, this.sources});

	factory NewsSources.fromJson(Map<String, dynamic> json) {
		return _$NewsSourcesFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NewsSourcesToJson(this);
}
