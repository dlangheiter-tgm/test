import 'package:src/src.dart';
import 'package:meta/meta.dart';
import 'package:src/utility/html_template.dart';

class LoginController extends ResourceController {
  LoginController({@required this.htmlRenderer});

  final HTMLRenderer htmlRenderer;

  @Operation.get()
  Future<Response> displayLoginForm() async {
    return await htmlRenderer
        .respondHTML("web/login.html", {"path": "/register"});
  }
}
