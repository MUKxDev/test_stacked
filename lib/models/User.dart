/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _name;
  final String? _image;
  final List<Todo>? _Todos;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get image {
    return _image;
  }
  
  List<Todo>? get Todos {
    return _Todos;
  }
  
  const User._internal({required this.id, name, image, Todos}): _name = name, _image = image, _Todos = Todos;
  
  factory User({String? id, String? name, String? image, List<Todo>? Todos}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      image: image,
      Todos: Todos != null ? List<Todo>.unmodifiable(Todos) : Todos);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _name == other._name &&
      _image == other._image &&
      DeepCollectionEquality().equals(_Todos, other._Todos);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("image=" + "$_image");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? name, String? image, List<Todo>? Todos}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      Todos: Todos ?? this.Todos);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _image = json['image'],
      _Todos = json['Todos'] is List
        ? (json['Todos'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Todo.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'image': _image, 'Todos': _Todos?.map((Todo? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField TODOS = QueryField(
    fieldName: "Todos",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.IMAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.TODOS,
      isRequired: false,
      ofModelName: (Todo).toString(),
      associatedKey: Todo.USERID
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}