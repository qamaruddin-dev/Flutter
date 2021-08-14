import 'package:flutter/material.dart';

class listViewbuilder extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<listViewbuilder> {
  List listitems = [];
  var _currmax = 14;
  var _noofdoc = 50;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    listitems = List.generate(14, (i) => "Item $i");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (listitems.length < _noofdoc) loadmoreitems();
        print(listitems);
      }
    });
  }

  loadmoreitems() {
    for (int i = _currmax; i < _currmax + 14; i++) {
      listitems.add("Item $i");
    }
    _currmax = _currmax + 14;
    if (_currmax > _noofdoc) {
      int length = _currmax - _noofdoc;
      _currmax = _currmax - length;
      listitems.length = _currmax;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Center(child: Text("AppMonsters")),
          elevation: 0.0,
        ),
        body: Center(
          child: ListView.builder(
            controller: _scrollController,
            itemExtent: 50,
            itemCount: listitems.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == listitems.length - 1 &&
                  listitems.length != _noofdoc) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
              }
              return ListTile(
                tileColor: Colors.orange,
                title: Text(listitems[index]),
              );
            },
          ),
        ));
  }
}
