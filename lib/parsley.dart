library parsely;

import 'package:parsley/parsing_functions/parse_bool_to_double.dart';
import 'package:parsley/parsing_functions/parse_bool_to_int.dart';
import 'package:parsley/parsing_functions/parse_bool_to_string.dart';
import 'package:parsley/parsing_functions/parse_double_to_bool.dart';
import 'package:parsley/parsing_functions/parse_double_to_int.dart';
import 'package:parsley/parsing_functions/parse_double_to_string.dart';
import 'package:parsley/parsing_functions/parse_int_list_to_string_list.dart';
import 'package:parsley/parsing_functions/parse_int_to_bool.dart';
import 'package:parsley/parsing_functions/parse_int_to_double.dart';
import 'package:parsley/parsing_functions/parse_int_to_list.dart';
import 'package:parsley/parsing_functions/parse_int_to_string.dart';
import 'package:parsley/parsing_functions/parse_string_list_to_int_list.dart';
import 'package:parsley/parsing_functions/parse_string_to_bool.dart';
import 'package:parsley/parsing_functions/parse_string_to_double.dart';
import 'package:parsley/parsing_functions/parse_string_to_int.dart';

typedef O ParseFunction<I, O>(I input);

class Parsley {

  List<ParseHandler> _parsers;

  Parsley(){
    registerHandler(parseIntToString);
    registerHandler(parseStringToInt);

    registerHandler(parseStringToDouble);
    registerHandler(parseDoubleToString);

    registerHandler(parseStringToBool);
    registerHandler(parseBoolToString);

    registerHandler(parseIntToBool);
    registerHandler(parseBoolToInt);

    registerHandler(parseIntToDouble);
    registerHandler(parseDoubleToInt);

    registerHandler(parseDoubleToBool);
    registerHandler(parseBoolToDouble);

    registerHandler(parseIntToList);

    registerHandler(parseIntListToStringList);
    registerHandler(parseStringListToIntList);
  }

  void registerHandler<I, O>(ParseFunction<I, O> parseFunction){
    if (_parsers == null) {
      _parsers = [];
    }
    _parsers.add(
        ParseHandler<I, O>(parseFunction)
    );
  }

  T parse<T>(input){
    if (input == null) {
      return null;
    }
    if (input is T) {
      return input;
    }

    for(ParseHandler parseHandler in _parsers){
      if(parseHandler.canParse(input) && parseHandler.canOutput<T>()){
        try {
          return parseHandler.parse(input);
        }catch(error){
          throw ParseFunctionException(error);
        }
      }
    }
    throw NoParserFoundException(input);
  }
}

class ParseHandler<I, O> {

  ParseFunction<I, O> parseFunction;

  ParseHandler(this.parseFunction);

  bool canParseType<J>(){
    return J == I;
  }

  bool canParse(var value){
    return value is I;
  }

  bool canOutput<T>(){
    return T == O;
  }

  O parse(I i){
    return parseFunction(i);
  }
}

class ParseFunctionException implements Exception {

  final Exception cause;

  ParseFunctionException(this.cause);
}

class NoParserFoundException implements Exception{
  final dynamic input;

  NoParserFoundException(this.input);
}