import 'src.dart';

String ifListFirst(val) {
  if (val is List) {
    return val.first as String;
  }
  return val as String;
}

Response redirect(String to) {
  return Response(
      HttpStatus.movedPermanently,
      {
        HttpHeaders.locationHeader: to,
        HttpHeaders.cacheControlHeader: "no-store",
        HttpHeaders.pragmaHeader: "no-cache",
      },
      null);
}
