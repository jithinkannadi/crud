import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class riverPage extends ConsumerWidget {
  const riverPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final d=ref.watch(a);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed: () {
            ref.read(a.notifier).update((state) => state+1);
          },
          child: Icon(Icons.add),),
          FloatingActionButton(onPressed: () {
            ref.read(a.notifier).update((state) =>
            state<=0?0:state-1);
          },child: Icon(Icons.remove),)
        ],
      ),
      body: Center(child: Text (d.toString(),style: TextStyle(fontSize: w*0.3),)),
    );
  }
}
