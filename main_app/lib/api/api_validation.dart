part of 'api.dart';

List<T> _parseApiListResponse<T>(
  Response response,
  T Function(Map<String, dynamic> json) fromJson, {
  String dataField = 'data',
}) {
  if (response.data == null) {
    throw ApiException('API returned null response');
  }

  if (response.data is! Map<String, dynamic>) {
    throw ApiException(
      'Invalid response format: expected map, got ${response.data.runtimeType}',
    );
  }

  final Map<String, dynamic> responseData =
      response.data as Map<String, dynamic>;

  if (!responseData.containsKey(dataField)) {
    throw ApiException('Invalid response format: missing $dataField field');
  }

  final dynamic dataValue = responseData[dataField];

  if (dataValue is! List) {
    throw ApiException('Invalid response format: $dataField is not a list');
  }

  try {
    return dataValue
        .map((item) {
          if (item is! Map<String, dynamic>) {
            throw FormatException(
              'Expected map for list item, got ${item.runtimeType}',
            );
          }
          return fromJson(item);
        })
        .toList()
        .cast<T>();
  } catch (e) {
    if (e is ApiException) rethrow;
    throw ApiException('Error parsing response data: ${e.toString()}');
  }
}
