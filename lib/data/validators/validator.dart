import 'package:flutter/cupertino.dart';
import 'package:shared_shopping_list/l.dart';

import 'empty_validator.dart';

abstract class Validator {
  dynamic valid(String value, error);
}

String requiredValidation(BuildContext context, String value) {
  final error = EmptyValidator().valid(value, "requiredField");
  if (error != null) {
    return LDelegate.get(context, error);
  }
  return null;
}
