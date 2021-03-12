import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titleBarContent = "Teste";
  bool showUserDetails = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleBarContent),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              arrowColor: Colors.white,
              accountName: Text('Name'),
              accountEmail: Text('pessoa@abdc.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png'),
              ),
              //decoration: BoxDecoration(color: Colors.red),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807_960_720.png'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                ),
              ],
              onDetailsPressed: () {
                setState(() {
                  showUserDetails = !showUserDetails;
                });
              },
            ),
            Expanded(
              flex: 1,
              child: showUserDetails ? _buildUserDetail() : _buildDrawerList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        //backgroundColor: Colors.red,
      ),
    );
  }
}

Widget _buildDrawerList() {
  return ListView.builder(
    itemCount: 1,
    padding: EdgeInsets.only(top: 0.0),
    itemBuilder: (context, position) {
      //return _menuList(context)[position];
      return _menuList(context);
    },
  );
}

Widget _buildUserDetail() {
  return Container(
    color: Colors.white,
    child: ListView(
      children: [
        ListTile(
          title: Text("ACCOUNT NAME"),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text("ACCOUNT NAME 2"),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807_960_720.png'),
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}

Widget _menuList(context) {
  return Container(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.autorenew),
          title: Text(
            'Sincronização',
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            context.setState(
              () {},
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.person),
          trailing: Badge(
            badgeContent: Text(
              '99+',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            badgeColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            animationType: BadgeAnimationType.fade,
            shape: BadgeShape.square,
            borderRadius: BorderRadius.circular(6),
          ),
          title: Text(
            'Clientes',
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            context.setState(
              () {},
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.auto_stories),
          trailing: Badge(
            badgeContent: Text(
              '0',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            badgeColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            animationType: BadgeAnimationType.fade,
          ),
          title: Text(
            'Produtos',
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            context.setState(
              () {},
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart_outlined),
          trailing: Badge(
            badgeContent: Text(
              '0',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            badgeColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            animationType: BadgeAnimationType.fade,
          ),
          title: Text(
            'Pedidos',
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            context.setState(
              () {},
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.attach_money_outlined),
          trailing: Badge(
            badgeContent: Text(
              '0',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            badgeColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            animationType: BadgeAnimationType.fade,
          ),
          title: Text(
            'Títulos',
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            context.setState(
              () {},
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.place_outlined),
          title: Text(
            'Rota',
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            context.setState(
              () {},
            );
          },
        ),
        Divider(),
        Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: Icon(Icons.bar_chart),
            title: Text(
              "Relatórios",
              style: TextStyle(fontSize: 16.0),
            ),
            children: <Widget>[
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.bar_chart,
                    size: 22.0,
                  ),
                ),
                title: Text('A'),
                onTap: () {},
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.bar_chart,
                    size: 22.0,
                  ),
                ),
                title: Text('B'),
                onTap: () {},
              ),
            ],
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.power_settings_new_outlined),
          title: Text(
            'Sair',
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            context.setState(
              () {},
            );
          },
        ),
      ],
    ),
  );
}
