import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropDown Menu',
      home: MyHomePage(),
    );
  }
}

class ItemElement {
  final String name;
  final Icon icon;
  ItemElement({this.name, this.icon});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _items = [
    ItemElement(name: 'Moday', icon: Icon(Icons.add_circle)),
    ItemElement(name: 'Tuesday', icon: Icon(Icons.backup)),
    ItemElement(name: 'Wednsday', icon: Icon(Icons.add_call)),
    ItemElement(name: 'Thursday', icon: Icon(Icons.data_usage)),
    ItemElement(name: 'Friday', icon: Icon(Icons.eject)),
  ];

  // List<DropdownMenuItem<ItemElement>> _menuItems;
  List _menuItems;
  ItemElement _currentItem;

  @override
  void initState() {
    _menuItems = getMenuItems();
    _currentItem = _menuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<ItemElement>> getMenuItems() => _items
      .map((item) => DropdownMenuItem(
          value: item,
          child: Row(
            children: rowItem(item),
          )))
      .toList();

  List<Widget> rowItem(ItemElement item) {
    return <Widget>[
      item.icon,
      SizedBox(width: 10),
      Text(
        item.name,
        style: TextStyle(fontSize: 30),
      ),
    ];
  }

/*   List<DropdownMenuItem<String>> getMenuItems() {
    var list = List();
    _menuItems.forEach(
      (item) => list.add(
        DropdownMenuItem(
          value: item,
          child: Text(item.value),
        ),
      ),
    );
    return list;
  } */

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DropDownBotton')),
      body: new Container(
        color: Colors.white,
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Please choose your day:"),
              SizedBox(height: 16),
              customizedDropdownButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget customizedDropdownButton(BuildContext context) {
    return Container(
      width: 250,
      height: 55,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Colors.yellowAccent, // background color for the dropdown items
          buttonTheme: ButtonTheme.of(context).copyWith(
            alignedDropdown:
                true, //If false (the default), then the dropdown's menu will be wider than its button.
          ),
        ),
        child: DropdownButton(
          value: _currentItem,
          items: _menuItems,
          onChanged: changedDropDownItem,
          //icon: _currentItem.icon),
        ),
      ),
    );
  }

  void changedDropDownItem(ItemElement selectedItem) {
    setState(() {
      _currentItem = selectedItem;
    });
  }
}
