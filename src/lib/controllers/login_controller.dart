import 'package:src/model/login.dart';
import 'package:src/src.dart';
import 'package:meta/meta.dart';
import 'package:src/utility/html_template.dart';

class LoginController extends ResourceController {
  LoginController(
      {@required this.htmlRenderer, @required this.db, @required this.users});

  final HTMLRenderer htmlRenderer;
  final Database db;
  final StoreRef users;

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
  Future<Response> login(@Bind.body() Login login) async {
    final result = await users.findFirst(db,
        finder: Finder(
            filter: Filter.and([
          Filter.equals("mail", login.mail),
          Filter.equals("password", login.password),
        ])));

    if (result == null) {
      return redirect("/wrong.html");
    }

    return await htmlRenderer
        .respondHTML("web/loggedIn.html", {"name": result['name'] as String});
  }
}
