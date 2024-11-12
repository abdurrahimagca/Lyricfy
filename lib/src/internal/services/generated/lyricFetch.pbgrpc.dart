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

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'lyricFetch.pb.dart' as $0;

export 'lyricFetch.pb.dart';

@$pb.GrpcServiceName('lyricFetchservice.lyricFetchService')
class lyricFetchServiceClient extends $grpc.Client {
  static final _$getLyric = $grpc.ClientMethod<$0.LyricFetchRequest, $0.LyricFetchResponse>(
      '/lyricFetchservice.lyricFetchService/GetLyric',
      ($0.LyricFetchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LyricFetchResponse.fromBuffer(value));

  lyricFetchServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.LyricFetchResponse> getLyric($0.LyricFetchRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLyric, request, options: options);
  }
}

@$pb.GrpcServiceName('lyricFetchservice.lyricFetchService')
abstract class lyricFetchServiceBase extends $grpc.Service {
  $core.String get $name => 'lyricFetchservice.lyricFetchService';

  lyricFetchServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LyricFetchRequest, $0.LyricFetchResponse>(
        'GetLyric',
        getLyric_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LyricFetchRequest.fromBuffer(value),
        ($0.LyricFetchResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LyricFetchResponse> getLyric_Pre($grpc.ServiceCall call, $async.Future<$0.LyricFetchRequest> request) async {
    return getLyric(call, await request);
  }

  $async.Future<$0.LyricFetchResponse> getLyric($grpc.ServiceCall call, $0.LyricFetchRequest request);
}
