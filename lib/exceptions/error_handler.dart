import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/exceptions/fetch_exception.dart';
import 'package:flutter_boilerplate/exceptions/input_exception.dart';
import 'package:flutter_boilerplate/exceptions/validation_exception.dart';

class ErrorHandler {
  //go through all custom errors and return the corresponding error message
  static String errorMessage(Error? error) {
    if (error == null) {
      return '';
    }
    if (error is ValidationException) {
      return error.message;
    }

    if (error is NotNumberException) {
      return error.message;
    }
    if (error is NotInRangeException) {
      return error.message;
    }
    if (error is NetworkErrorException) {
      return error.message;
    }

    if (error is UserNotFoundException) {
      return error.message;
    }

    // throw unexpected error.
    throw error;
  }

  //Display an AlertDialog with the error message
  static void showErrorDialog(BuildContext context, Error? error) {
    if (error == null) {
      return;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(errorMessage(error)),
        );
      },
    );
  }

  //Display an snackBar with the error message
  static void showSnackBar(BuildContext context, Error? error) {
    if (error == null) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage(error)),
      ),
    );
  }
}
