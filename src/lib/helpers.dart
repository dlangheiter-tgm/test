String ifListFirst(val) {
  if(val is List) {
    return val.first as String;
  }
  return val as String;
}