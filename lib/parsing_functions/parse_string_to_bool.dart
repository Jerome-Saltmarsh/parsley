bool parseStringToBool(String value){
  String cleanValue = value.trim().toLowerCase();
  if (cleanValue == "false") {
    return false;
  }
  if (cleanValue == "true") {
    return true;
  }
  if (cleanValue == "f") {
    return false;
  }
  if (cleanValue == "t") {
    return true;
  }
  if(cleanValue == "0"){
    return false;
  }
  if(cleanValue == "1"){
    return true;
  }
  throw Exception("Could not parse $value to boolean");
}
