import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/model_base_dropdown.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseClientList extends ResponseData {
  ResponseClientList({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelClient>? result;
}

@jsonSerializable
class ModelClient implements BaseDropdown {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'Code')
  final String? code;

  @JsonProperty(name: 'Name')
  final String? name;

  @JsonProperty(name: 'TaxNumber')
  final String? taxNumber;

  @JsonProperty(name: 'Address')
  final String? address;

  @JsonProperty(name: 'Description')
  final String? description;

  @JsonProperty(name: 'FinancialResponsibleMail')
  final String? financialResponsibleMail;

  @JsonProperty(name: 'GroupId')
  final int groupId;

  @JsonProperty(name: 'Status')
  final int status;

  @JsonProperty(name: 'StatusText')
  final String? statusText;

  @JsonProperty(name: 'GroupName')
  final String? groupName;

  @JsonProperty(name: 'IsDeleted')
  final bool isDeleted;

  @JsonProperty(name: 'Sector')
  final String? sector;

  @JsonProperty(name: 'SubSector')
  final String? subSector;

  @JsonProperty(name: 'TaxDepartment')
  final String? taxDepartment;

  @JsonProperty(name: 'FinancialResponsible')
  final String? financialResponsible;

  @JsonProperty(name: 'FinancialResponsiblePhone')
  final String? financialResponsiblePhone;

  ModelClient({
    required this.id,
    this.code,
    this.name,
    this.taxNumber,
    this.address,
    this.description,
    this.financialResponsibleMail,
    required this.groupId,
    required this.status,
    this.statusText,
    this.groupName,
    required this.isDeleted,
    this.sector,
    this.subSector,
    this.taxDepartment,
    this.financialResponsible,
    this.financialResponsiblePhone,
  });
  
  @override
  String get dropdownId => id.toString();
  String get dropdownTitle => name ?? '-';
}
