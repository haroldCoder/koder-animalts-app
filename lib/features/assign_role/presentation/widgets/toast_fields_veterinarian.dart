import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ToastFieldsVeterinarian extends ShadToast {
  const ToastFieldsVeterinarian({super.key})
    : super.destructive(
        title: const Text('Error'),
        description: const Text(
          'Es necesario un número de contacto y una clínica',
        ),
      );
}
