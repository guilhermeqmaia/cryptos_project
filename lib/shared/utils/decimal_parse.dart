import 'package:decimal/decimal.dart';

//Decimal Parse
Decimal dp(String source) => Decimal.parse(source);

//Decimal to double
double dtd(Decimal source) => double.parse(source.toString());