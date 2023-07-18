import 'package:flutter/material.dart';

import 'widgets/custom_search_delagate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              child: const Text("Search"),
              onPressed: (){
                showSearch(context: context, delegate: CustomSearchDelegate(hintText: "Search"));
              },
            ),
          )
        ],
      ),
    );
  }
}
