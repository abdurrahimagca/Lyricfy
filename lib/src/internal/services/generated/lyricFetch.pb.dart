//
//  Generated code. Do not modify.
//  source: lyricFetch.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LyricFetchRequest extends $pb.GeneratedMessage {
  factory LyricFetchRequest({
    $core.String? artist,
    $core.String? title,
  }) {
    final $result = create();
    if (artist != null) {
      $result.artist = artist;
    }
    if (title != null) {
      $result.title = title;
    }
    return $result;
  }
  LyricFetchRequest._() : super();
  factory LyricFetchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LyricFetchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LyricFetchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'lyricFetchservice'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artist')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LyricFetchRequest clone() => LyricFetchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LyricFetchRequest copyWith(void Function(LyricFetchRequest) updates) => super.copyWith((message) => updates(message as LyricFetchRequest)) as LyricFetchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LyricFetchRequest create() => LyricFetchRequest._();
  LyricFetchRequest createEmptyInstance() => create();
  static $pb.PbList<LyricFetchRequest> createRepeated() => $pb.PbList<LyricFetchRequest>();
  @$core.pragma('dart2js:noInline')
  static LyricFetchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LyricFetchRequest>(create);
  static LyricFetchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artist => $_getSZ(0);
  @$pb.TagNumber(1)
  set artist($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtist() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtist() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class LyricFetchResponse extends $pb.GeneratedMessage {
  factory LyricFetchResponse({
    $core.String? lyrics,
  }) {
    final $result = create();
    if (lyrics != null) {
      $result.lyrics = lyrics;
    }
    return $result;
  }
  LyricFetchResponse._() : super();
  factory LyricFetchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LyricFetchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LyricFetchResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'lyricFetchservice'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lyrics')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LyricFetchResponse clone() => LyricFetchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LyricFetchResponse copyWith(void Function(LyricFetchResponse) updates) => super.copyWith((message) => updates(message as LyricFetchResponse)) as LyricFetchResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LyricFetchResponse create() => LyricFetchResponse._();
  LyricFetchResponse createEmptyInstance() => create();
  static $pb.PbList<LyricFetchResponse> createRepeated() => $pb.PbList<LyricFetchResponse>();
  @$core.pragma('dart2js:noInline')
  static LyricFetchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LyricFetchResponse>(create);
  static LyricFetchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lyrics => $_getSZ(0);
  @$pb.TagNumber(1)
  set lyrics($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLyrics() => $_has(0);
  @$pb.TagNumber(1)
  void clearLyrics() => clearField(1);
}

class lyricFetchServiceApi {
  $pb.RpcClient _client;
  lyricFetchServiceApi(this._client);

  $async.Future<LyricFetchResponse> getLyric($pb.ClientContext? ctx, LyricFetchRequest request) =>
    _client.invoke<LyricFetchResponse>(ctx, 'lyricFetchService', 'GetLyric', request, LyricFetchResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
