import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class riverpod extends ConsumerWidget {
  const riverpod({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final user=ref.read(users);

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(users)+1;
      },
      child: Icon(Icons.add),
      ),
      body: Center(child: Text(user.toString())),

    );
  }
}
