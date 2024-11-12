//
//  Generated code. Do not modify.
//  source: lyricFetch.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use lyricFetchRequestDescriptor instead')
const LyricFetchRequest$json = {
  '1': 'LyricFetchRequest',
  '2': [
    {'1': 'artist', '3': 1, '4': 1, '5': 9, '10': 'artist'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `LyricFetchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lyricFetchRequestDescriptor = $convert.base64Decode(
    'ChFMeXJpY0ZldGNoUmVxdWVzdBIWCgZhcnRpc3QYASABKAlSBmFydGlzdBIUCgV0aXRsZRgCIA'
    'EoCVIFdGl0bGU=');

@$core.Deprecated('Use lyricFetchResponseDescriptor instead')
const LyricFetchResponse$json = {
  '1': 'LyricFetchResponse',
  '2': [
    {'1': 'lyrics', '3': 1, '4': 1, '5': 9, '10': 'lyrics'},
  ],
};

/// Descriptor for `LyricFetchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lyricFetchResponseDescriptor = $convert.base64Decode(
    'ChJMeXJpY0ZldGNoUmVzcG9uc2USFgoGbHlyaWNzGAEgASgJUgZseXJpY3M=');

const $core.Map<$core.String, $core.dynamic> lyricFetchServiceBase$json = {
  '1': 'lyricFetchService',
  '2': [
    {'1': 'GetLyric', '2': '.lyricFetchservice.LyricFetchRequest', '3': '.lyricFetchservice.LyricFetchResponse'},
  ],
};

@$core.Deprecated('Use lyricFetchServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> lyricFetchServiceBase$messageJson = {
  '.lyricFetchservice.LyricFetchRequest': LyricFetchRequest$json,
  '.lyricFetchservice.LyricFetchResponse': LyricFetchResponse$json,
};

/// Descriptor for `lyricFetchService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List lyricFetchServiceDescriptor = $convert.base64Decode(
    'ChFseXJpY0ZldGNoU2VydmljZRJXCghHZXRMeXJpYxIkLmx5cmljRmV0Y2hzZXJ2aWNlLkx5cm'
    'ljRmV0Y2hSZXF1ZXN0GiUubHlyaWNGZXRjaHNlcnZpY2UuTHlyaWNGZXRjaFJlc3BvbnNl');

