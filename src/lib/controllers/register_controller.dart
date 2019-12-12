import 'package:src/model/register.dart';
import 'package:src/src.dart';
import 'package:meta/meta.dart';
import 'package:src/utility/html_template.dart';

class RegisterController extends ResourceController {
  RegisterController(
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
    return await htmlRenderer.respondHTML("web/register.html");
  }

  @Operation.post()
  Future<Response> login(@Bind.body() Register register) async {
    final result = await users.findFirst(db,
        finder: Finder(filter: Filter.equals("mail", register.mail)));

    await users.add(db, register.asMap());

    if (result != null) {
      return redirect("/alreadyExists.html");
    }

    return redirect("/registered.html");
  }
}
