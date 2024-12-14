```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIException implements Exception {
  final String message;
  APIException(this.message);
  @override
  String toString() => message;
}

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw APIException('Failed to load data. Status code: ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    // Handle network errors separately
    print('Network Error: $e');
    throw APIException('Network error: Could not connect to the server.');
  } on FormatException catch (e) {
    // Handle JSON parsing errors
    print('JSON Parsing Error: $e');
    throw APIException('Invalid JSON response.');
  } on APIException catch (e) {
    // Rethrow APIExceptions, but you might want to add logging here 
    rethrow;
  } catch (e) {
    // Handle unexpected errors
    print('Unexpected error: $e');
    throw APIException('An unexpected error occurred.');
  }
}
```