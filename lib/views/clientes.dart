import 'package:box/components/teste_tile.dart';
import 'package:box/data/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Clientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClientesPageTab();
  }
}

class ClientesPageTab extends StatefulWidget {
  @override
  _ClientesPageTabState createState() => new _ClientesPageTabState();
}

class _ClientesPageTabState extends State<ClientesPageTab> {
  @override
  Widget build(BuildContext context) {
    final lista = {...LISTA};
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: Icon(Icons.search),
            )
          ],
          bottom: TabBar(
            tabs: [
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('CNPJ'),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('CPF'),
                ),
              )
            ],
          ),
          title: Text('Clientes'),
        ),
        body: TabBarView(
          children: [
            _listaCNPJ(lista),
            Text('CLIENTES CPF'),
          ],
        ),
      ),
    );
  }
}

ListView _listaCNPJ(lista) {
  return ListView.builder(
    itemCount: lista.length,
    shrinkWrap: true,
    itemBuilder: (context, i) => ListaTile(lista.values.elementAt(i)),
  );
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
      ),
      focusColor: Colors.red,
      hintColor: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query != '') {
            query = '';
          } else {
            close(context, null);
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('A');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Column(
        children: <Widget>[Text('A')],
      ),
    );
  }

  @override
  String get searchFieldLabel {
    return 'Pesquisar...';
  }
}
