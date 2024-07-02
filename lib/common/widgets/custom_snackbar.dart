import 'package:audio_player/utils/extensions/context_ext.dart';
import 'package:audio_player/views/audioPlayer/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

enum SnackBarType {
  alert,
  error,
  success;

  bool get isAlert => this == alert;

  bool get isError => this == error;

  bool get isSuccess => this == success;

  Color get bgColor => switch (this) {
        alert => Colors.orange,
        error => Colors.red,
        _ => Colors.green,
      };
}

class CustomSnackbar {
  CustomSnackbar(this.context);

  BuildContext context;

  void showSnackbar(
      {required String message, required SnackBarType snackbarType}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: context.screenSize.height - 170),
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: _messageBody(message: message, snackbarType: snackbarType),
      ),
    );
  }

  Widget _messageBody(
      {required String message, required SnackBarType snackbarType}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: snackbarType.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop,
            icon: const CustomIconButton(
              margin: EdgeInsets.zero,
              icon: Icons.close,
              iconSize: 10,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
