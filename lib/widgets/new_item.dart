import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_shopping_app/data/categories.dart';

class NewItem extends ConsumerStatefulWidget {
  const NewItem({super.key});
  @override
  ConsumerState createState() {
    return _NewItemState();
  }
}

class _NewItemState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Item',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  return 'Demo';
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color),
                              const SizedBox(width: 6),
                              Text(category.value.title),
                            ],
                          ),
                        )
                    ], onChanged: (value) {}),
                  )
                ],
              )
            ],
          )),
        ));
  }
}
