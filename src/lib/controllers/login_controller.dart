import 'package:src/src.dart';
import 'package:meta/meta.dart';
import 'package:src/utility/html_template.dart';

class LoginController extends ResourceController {
  LoginController({@required this.htmlRenderer});

  final HTMLRenderer htmlRenderer;

  @override
  List<ContentType> acceptedContentTypes = [
    ContentType("application", "x-www-form-urlencoded"),
    ContentType("application", "json")
  ];

  @Operation.get()
  Future<Response> displayLoginForm() async {
    return await htmlRenderer.respondHTML("web/login.html");
  }

  @Operation.post()
  Future<Response> login() async {
    return await htmlRenderer.respondHTML("web/loggedIn.html", {"name": "Testing"});
  }
}
