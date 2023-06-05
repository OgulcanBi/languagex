import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/model_permission.dart';
import 'package:languagex/core/models/response_data.dart';

import 'model_role.dart';

@jsonSerializable
class ResponseLogin extends ResponseData {
  ResponseLogin({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelLoginResponse? result;
}

@jsonSerializable
class ModelLoginResponse {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'AccessToken')
  final String accessToken;

  @JsonProperty(name: 'RefreshToken')
  final String refreshToken;

  @JsonProperty(name: 'Username')
  final String username;

  @JsonProperty(name: 'Roles')
  final List<String> roles;

  @JsonProperty(name: 'Permissions')
  final List<String> permissions;

  @JsonProperty(name: 'TenantId')
  final int tenantId;

  @JsonProperty(name: 'ProjectRoles')
  final List<ModelRole> projectRoles;

  @JsonProperty(name: 'ProjectPermissions')
  final List<ModelPermission> projectPermissions;

  ModelLoginResponse({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
    required this.username,
    required this.roles,
    required this.permissions,
    required this.tenantId,
    required this.projectRoles,
    required this.projectPermissions,
  });
}
