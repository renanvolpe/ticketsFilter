import 'package:flutter/material.dart';


class FilterScreen extends StatefulWidget {

  const FilterScreen({Key? key }) : super(key: key);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FilterScreen oldWidget) {

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/main_back_transparent.png')
            )
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
