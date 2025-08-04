import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/counter_Controller.dart';

class CounterProvider extends StatelessWidget {
   CounterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");

    final counter = Provider.of<CounterController>(context , listen:  false);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
      title: Text("Fluuter counter Home Page",style: TextStyle(fontSize: 15),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counter.increment();

      },
      child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Center(

            child: Consumer<CounterController>(builder: (context, value, child) {
              print("the only widget build");
              return Text('count: ${value.count}',style: TextStyle(
                  fontSize: 30
              ),);
            },)
          
          ),
          Center(
            child: ElevatedButton(onPressed: ()=> counter.decremennt(), child: Text("decrement"))
          )
        ],
      ),
    );
  }
}
