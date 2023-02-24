//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JoinCallResponse {
  /// Returns a new [JoinCallResponse] instance.
  JoinCallResponse({
    required this.call,
    required this.created,
    required this.duration,
    this.edges = const [],
    this.members = const [],
    this.membership,
  });

  CallResponse call;

  bool created;

  String duration;

  List<DatacenterResponse> edges;

  List<MemberResponse> members;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  MemberResponse? membership;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JoinCallResponse &&
     other.call == call &&
     other.created == created &&
     other.duration == duration &&
     other.edges == edges &&
     other.members == members &&
     other.membership == membership;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (call.hashCode) +
    (created.hashCode) +
    (duration.hashCode) +
    (edges.hashCode) +
    (members.hashCode) +
    (membership == null ? 0 : membership!.hashCode);

  @override
  String toString() => 'JoinCallResponse[call=$call, created=$created, duration=$duration, edges=$edges, members=$members, membership=$membership]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'call'] = this.call;
      json[r'created'] = this.created;
      json[r'duration'] = this.duration;
      json[r'edges'] = this.edges;
      json[r'members'] = this.members;
    if (this.membership != null) {
      json[r'membership'] = this.membership;
    } else {
      json[r'membership'] = null;
    }
    return json;
  }

  /// Returns a new [JoinCallResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JoinCallResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "JoinCallResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "JoinCallResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return JoinCallResponse(
        call: CallResponse.fromJson(json[r'call'])!,
        created: mapValueOfType<bool>(json, r'created')!,
        duration: mapValueOfType<String>(json, r'duration')!,
        edges: DatacenterResponse.listFromJson(json[r'edges'])!,
        members: MemberResponse.listFromJson(json[r'members'])!,
        membership: MemberResponse.fromJson(json[r'membership']),
      );
    }
    return null;
  }

  static List<JoinCallResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JoinCallResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JoinCallResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JoinCallResponse> mapFromJson(dynamic json) {
    final map = <String, JoinCallResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JoinCallResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JoinCallResponse-objects as value to a dart map
  static Map<String, List<JoinCallResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JoinCallResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JoinCallResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'call',
    'created',
    'duration',
    'edges',
    'members',
  };
}
