import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdb106_sample/bloc/items_bloc.dart';
import 'package:wdb106_sample/bloc/items_provider.dart';
import 'package:wdb106_sample/model/api.dart';
import 'package:wdb106_sample/screens/item_list.dart';

void main() => runApp(App(
      itemsBloc:
          ItemsBloc(client: DummyApiClient(dummyDelay: Duration(seconds: 1))),
    ));

class App extends StatelessWidget {
  final ItemsBloc itemsBloc;

  const App({
    @required this.itemsBloc,
    Key key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ItemsProvider(
        bloc: itemsBloc,
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          home: ItemList(),
        ),
      );
}
