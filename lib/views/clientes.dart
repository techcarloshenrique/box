import 'package:box/components/teste_tile.dart';

import 'package:box/models/dummy-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Clientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClientesPageTab();
  }
}

class ClientesPageTab extends StatefulWidget {
  final abc;
  ClientesPageTab({key, this.abc}) : super(key: key);
  @override
  _ClientesPageTabState createState() => new _ClientesPageTabState();
}

class _ClientesPageTabState extends State<ClientesPageTab> {
  @override
  Widget build(BuildContext context) {
    //final lista = {...LISTA};
    final l = DummyList();
    final l2 = DummyList();
    l.setId = '1';
    l.setNome = 'CARLOS HENRIQUE';
    l.setEmail = 'carlos.silva@gmail.com';
    l.setAvatar =
        'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png';
    l2.setId = '2';
    l2.setNome = 'CHESPIRITO';
    l2.setEmail = 'chespirito@gmail.com';
    l2.setAvatar =
        'https://terceirotempo.uol.com.br/imagens/66/60/qfl_fto_16660.jpg';
    final List<DummyList> m = [];

    m.add(l);
    m.add(l2);

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
            _listaCNPJ(m),
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
    itemBuilder: (context, i) => ListaTile(lista.elementAt(i)),
  );
}

void _searchClientes(String searchQuery) {
  print(searchQuery);
}

class CustomSearchDelegate extends SearchDelegate<String> {
  /*@override
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
  }*/

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
    print(query);
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _searchClientes(query);
    final l = DummyList();
    final l2 = DummyList();
    l.setId = '1';
    l.setNome = 'CARLOS HENRIQUE';
    l.setEmail = 'carlos.silva@gmail.com';
    l.setAvatar = '';
    l2.setId = '2';
    l2.setNome = 'CHESPIRITO';
    l2.setEmail = 'chespirito@gmail.com';
    l2.setAvatar =
        'https://terceirotempo.uol.com.br/imagens/66/60/qfl_fto_16660.jpg';
    List<Map<String, dynamic>> m = [];

    m.add(l.toMap());
    m.add(l2.toMap());
    //print(m);
    //l.toMap().length

    final i = m.where((element) => element['nome']
        .toString()
        .toLowerCase()
        .startsWith(query.toLowerCase()));
    //print(i.elementAt(0)['nome']);

    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        scrollDirection: Axis.vertical,
        children: List.generate(
          i.length,
          (index) {
            return Text('a');
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          child: ListTile(
            title: Text('Options 1'),
            leading: Icon(LineAwesomeIcons.history),
            //contentPadding: EdgeInsets.all(0),
          ),
        ),
        InkWell(
          child: ListTile(
            title: Text('Options 2'),
            leading: Icon(LineAwesomeIcons.history),
            //contentPadding: EdgeInsets.all(0),
          ),
        ),
      ],
    );
  }

  @override
  String get searchFieldLabel {
    return 'Pesquisar...';
  }
}
