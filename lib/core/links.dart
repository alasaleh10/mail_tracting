abstract class AppLinks {
  static const String baseUrl = 'http://10.0.2.2/mail_tracting';
  static const String upload = '$baseUrl/upload';

  //auth
  static const String login = '$baseUrl/login.php';
  static const String register = '$baseUrl/signup.php';
  //mails
  static const String done = '$baseUrl/mails/done.php';
  static const String waiting = '$baseUrl/mails/waiting.php';
  static const String failed = '$baseUrl/mails/failed.php';
  static const String searchMail = '$baseUrl/mails/search_mail.php';

}
