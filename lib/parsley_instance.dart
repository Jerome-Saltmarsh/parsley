import 'package:parsley/parsley.dart';

Parsley parsely = Parsley();

T parse<T>(input){
  return parsely.parse(input);
}

T p<T>(input){
  return parsely.parse(input);
}

