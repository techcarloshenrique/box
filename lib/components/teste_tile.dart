import 'package:box/models/dummy-list.dart';
import 'package:flutter/material.dart';

class ListaTile extends StatelessWidget {
  final DummyList lista;

  ListaTile(this.lista);

  @override
  Widget build(BuildContext context) {
    final avatar = lista.avatar == null || lista.avatar.isEmpty
        ? CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png'))
        : CircleAvatar(backgroundImage: NetworkImage(lista.avatar));
    return InkWell(
      child: ListTile(
        leading: avatar,
        title: Text(
          lista.nome,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(lista.email),
        trailing: Container(
          color: Colors.green,
          width: 20,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text('a'),
              ),
              Expanded(
                flex: 1,
                child: Text('b'),
              ),
              Expanded(
                flex: 1,
                child: Text('c'),
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
