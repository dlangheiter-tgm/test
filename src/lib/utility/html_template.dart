import 'dart:async';
import 'dart:io';

import 'package:src/src.dart';

class HTMLRenderer {
  HTMLRenderer({this.cacheEnabled = true});

  final bool cacheEnabled;
  final Map<String, String> _cache = {};

  Future<String> renderHTML(String path,
      [Map<String, String> templateVariables = const {}]) async {
    final template = await _loadHTMLTemplate(path);

    return template.replaceAllMapped(RegExp("{{([a-zA-Z_]+)}}"), (match) {
      final key = match.group(1);
      return templateVariables[key] ?? "null";
    });
  }

  Future<Response> respondHTML(String path,
      [Map<String, String> templateVariables = const {}]) async {
    return Response.ok(await renderHTML(path, templateVariables))
      ..contentType = ContentType.html;
  }

  Future<String> _loadHTMLTemplate(String path) async {
    var contents = _cache[path];
    if (contents == null) {
      try {
        final file = File(path);
        contents = file.readAsStringSync();
        if(cacheEnabled) {
          _cache[path] = contents;
        }
      } catch (_) {}
    }

    return contents;
  }
}
