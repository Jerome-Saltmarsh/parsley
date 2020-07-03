import 'package:parsley/parsing_functions/parse_string_to_int.dart';

List<int> parseStringListToIntList(List<String> values){
  return values.map(parseStringToInt).toList();
}