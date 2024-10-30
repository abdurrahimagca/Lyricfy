//
//  Generated code. Do not modify.
//  source: lyric.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getLyricRequestDescriptor instead')
const GetLyricRequest$json = {
  '1': 'GetLyricRequest',
  '2': [
    {'1': 'artist', '3': 1, '4': 1, '5': 9, '10': 'artist'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `GetLyricRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLyricRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRMeXJpY1JlcXVlc3QSFgoGYXJ0aXN0GAEgASgJUgZhcnRpc3QSFAoFdGl0bGUYAiABKA'
    'lSBXRpdGxl');

@$core.Deprecated('Use getLyricResponseDescriptor instead')
const GetLyricResponse$json = {
  '1': 'GetLyricResponse',
  '2': [
    {'1': 'lyric', '3': 1, '4': 1, '5': 9, '10': 'lyric'},
  ],
};

/// Descriptor for `GetLyricResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLyricResponseDescriptor = $convert.base64Decode(
    'ChBHZXRMeXJpY1Jlc3BvbnNlEhQKBWx5cmljGAEgASgJUgVseXJpYw==');

const $core.Map<$core.String, $core.dynamic> LyricServiceBase$json = {
  '1': 'LyricService',
  '2': [
    {'1': 'GetLyric', '2': '.GetLyricRequest', '3': '.GetLyricResponse'},
  ],
};

@$core.Deprecated('Use lyricServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> LyricServiceBase$messageJson = {
  '.GetLyricRequest': GetLyricRequest$json,
  '.GetLyricResponse': GetLyricResponse$json,
};

/// Descriptor for `LyricService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List lyricServiceDescriptor = $convert.base64Decode(
    'CgxMeXJpY1NlcnZpY2USLwoIR2V0THlyaWMSEC5HZXRMeXJpY1JlcXVlc3QaES5HZXRMeXJpY1'
    'Jlc3BvbnNl');

