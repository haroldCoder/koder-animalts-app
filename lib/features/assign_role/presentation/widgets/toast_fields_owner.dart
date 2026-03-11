import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ToastFieldsOwner extends ShadToast {
  const ToastFieldsOwner({super.key})
    : super.destructive(
        title: const Text('Error'),
        description: const Text('Completa todos los campos'),
      );
}
