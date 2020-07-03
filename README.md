# parsley

Is your domain logic littered with parsing? 

Parsley is a simple but powerful parsing engine that uses inferences to automatically find the correct parser for the required input / output.

## Getting Started

Simply import the package into your project and forget about parsing forever!

You can also register your own custom parsers using parsley.registerParser(<your_function>) function.

# Example

int five = parse("5");              // 5

bool textToBool = parse("true")     // true

int stringToInt = parse("5");       // 5

String intToString = parse(5);      // "5"

bool intToBool = parse(1);          // true

List<String> intToStringList = parse([1, 8, 3]); // = ['1', '8', '3']

