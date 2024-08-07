class AppFailure{
  final int statusCode;
  final String message;
  final bool success;
  AppFailure({
    this.statusCode = 5001, 
    this.success = false, 
    this.message = "Sorry, an unexpected error occured!", 
  });

  @override
  String toString() => 'AppFailure(message: $message)';
}