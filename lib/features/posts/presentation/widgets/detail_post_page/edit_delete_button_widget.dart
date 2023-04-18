import 'package:flutter/material.dart';

class EditDeleteButtonWidget extends StatelessWidget {
  final void Function()? onEdit;
  final void Function()? onDelete;
  const EditDeleteButtonWidget(
      {Key? key, required this.onEdit, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
            label: const Text("Edit")),
        ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline),
            label: const Text("Delete")),
      ],
    );
  }
}
