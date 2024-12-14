```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle the JSON response
      final jsonResponse = jsonDecode(response.body);
      // Access data from jsonResponse
    } else {
      // Handle non-200 status codes
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions, don't just print the stack trace in production!
    print('Error fetching data: $e');
    // Consider rethrowing the exception if needed
    // or use a custom error handling mechanism 
    rethrow;
  }
}
```