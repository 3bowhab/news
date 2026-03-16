import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'news_respnse.g.dart';

@JsonSerializable()
class NewsRespnse {
	String? status;
	int? totalResults;
	List<Article>? articles;

	NewsRespnse({this.status, this.totalResults, this.articles});

	factory NewsRespnse.fromJson(Map<String, dynamic> json) {
		return _$NewsRespnseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NewsRespnseToJson(this);
}
