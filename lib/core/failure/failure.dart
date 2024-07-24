class AppFailure{
  final int statusCode;
  final String message;
  final bool success;
  AppFailure({
    this.statusCode = 5001, 
    required this.success, 
    this.message = "Sorry, an unexpected error occured!", 
  });

  @override
  String toString() => 'AppFailure(message: $message)';
}