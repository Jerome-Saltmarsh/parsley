
import 'package:parsley/parsing_functions/parse_int_to_string.dart';

List<String> parseIntListToStringList(List<int> value){
  return value.map(parseIntToString).toList();
}