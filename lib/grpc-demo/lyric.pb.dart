//
//  Generated code. Do not modify.
//  source: lyric.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetLyricRequest extends $pb.GeneratedMessage {
  factory GetLyricRequest({
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
  GetLyricRequest._() : super();
  factory GetLyricRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLyricRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLyricRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artist')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLyricRequest clone() => GetLyricRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLyricRequest copyWith(void Function(GetLyricRequest) updates) => super.copyWith((message) => updates(message as GetLyricRequest)) as GetLyricRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLyricRequest create() => GetLyricRequest._();
  GetLyricRequest createEmptyInstance() => create();
  static $pb.PbList<GetLyricRequest> createRepeated() => $pb.PbList<GetLyricRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLyricRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLyricRequest>(create);
  static GetLyricRequest? _defaultInstance;

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

class GetLyricResponse extends $pb.GeneratedMessage {
  factory GetLyricResponse({
    $core.String? lyric,
  }) {
    final $result = create();
    if (lyric != null) {
      $result.lyric = lyric;
    }
    return $result;
  }
  GetLyricResponse._() : super();
  factory GetLyricResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLyricResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLyricResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lyric')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLyricResponse clone() => GetLyricResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLyricResponse copyWith(void Function(GetLyricResponse) updates) => super.copyWith((message) => updates(message as GetLyricResponse)) as GetLyricResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLyricResponse create() => GetLyricResponse._();
  GetLyricResponse createEmptyInstance() => create();
  static $pb.PbList<GetLyricResponse> createRepeated() => $pb.PbList<GetLyricResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLyricResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLyricResponse>(create);
  static GetLyricResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lyric => $_getSZ(0);
  @$pb.TagNumber(1)
  set lyric($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLyric() => $_has(0);
  @$pb.TagNumber(1)
  void clearLyric() => clearField(1);
}

class LyricServiceApi {
  $pb.RpcClient _client;
  LyricServiceApi(this._client);

  $async.Future<GetLyricResponse> getLyric($pb.ClientContext? ctx, GetLyricRequest request) =>
    _client.invoke<GetLyricResponse>(ctx, 'LyricService', 'GetLyric', request, GetLyricResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
