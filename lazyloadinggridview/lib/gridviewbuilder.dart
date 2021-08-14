import 'package:flutter/material.dart';

class gridviewbuilder extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<gridviewbuilder> {
  List listitems = [];
  var _currmax = 6;
  var _noofdoc = 50;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    listitems = List.generate(8, (i) => "Item $i");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (listitems.length < _noofdoc) loadmoreitems();
        print(listitems);
      }
    });
  }

  loadmoreitems() {
    for (int i = _currmax; i < _currmax + 6; i++) {
      listitems.add("Item $i");
    }
    _currmax = _currmax + 6;
    if (_currmax > _noofdoc) {
      int length = _currmax - _noofdoc;
      _currmax = _currmax - length;
      listitems.length = _currmax + 2;
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
          child: GridView.builder(
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10),
            itemCount: listitems.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == listitems.length - 2 &&
                  listitems.length != _noofdoc) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
              }
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
