import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/models/grocery_item.dart';
import 'package:flutter_shopping_app/widgets/new_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GroceryList extends ConsumerStatefulWidget {
  const GroceryList({super.key});

  @override
  ConsumerState createState() => _GroceryListState();
}

class _GroceryListState extends ConsumerState {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(int index){
setState(() {
  _groceryItems.removeAt(index);

});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: _groceryItems.isEmpty
          ? const Center(              child: Text('No items today. Go Shopping!'),
)
            
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, index) => ListTile(
                  title: Row(
                    children: [
                      Text(_groceryItems[index].name),
                      const SizedBox(width: 18),
                      Text(
                        _groceryItems[index].quantity.toString(),
                      )
                    ],
                  ),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: _groceryItems[index].category.color,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      _removeItem(index);
                      },
                    icon: const Icon(Icons.delete),
                  )),
            ),
    );
  }
}
