import 'dart:io';
import 'package:box/models/site.dart';
import 'package:box/utilities/utils.dart';
import 'package:box/views/clientes.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';

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
  final String title = 'Home';

  final Site s = Site();
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showUserDetails = false;
  bool android;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      widget.s.setSite = 1;
      print('Teste ${widget.s.getSite}');
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  teste() {
    setState(() {});
  }

  @override
  void initState() {
    print('A');
    super.initState();
  }

  void _teste() {
    new Directory('Box').create()
        // The created directory is returned as a Future.
        .then((Directory directory) {
      print(directory.path);
    });
  }

  _callFolderCreationMethod() async {
    AppUtil app = AppUtil();
    String folderInAppDocDir = await app.createFolderInAppDocDir('Box');
    print(folderInAppDocDir);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      android =
          Theme.of(context).platform == TargetPlatform.android ? false : true;
    });

    _teste();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              arrowColor:
                  android ? Theme.of(context).primaryColor : Colors.white,
              accountName: Text(
                'CARLOS HENRIQUE | VENDEDOR',
                style: TextStyle(
                  color: android
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
              ),
              accountEmail: Text(
                'DISTRIBUIDORA DE BEBIDAS ASA BRANCA',
                style: TextStyle(
                  color: android
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: android
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor:
                      android ? Theme.of(context).primaryColor : Colors.white,
                  child: Text(
                    "C",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: android
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                onLongPress: () {
                  getImage();
                },
              ), //decoration: BoxDecoration(color: Colors.red),
              /*otherAccountsPictures: [
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
              ],*/
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
            Divider(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(-10, 6)),
                ],
              ),
              child: ListTile(
                leading: Icon(LineAwesomeIcons.power_off, color: Colors.red),
                dense: true,
                title: Text(
                  'Sair',
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
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
  ScrollController _control = ScrollController();
  return ListView.builder(
    controller: _control,
    physics: ClampingScrollPhysics(),
    itemCount: 1,
    padding: EdgeInsets.only(top: 0.0),
    itemBuilder: (context, position) {
      return Container(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(LineAwesomeIcons.sync_icon),
              dense: true,
              title: Text(
                'Sincronização',
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(LineAwesomeIcons.user),
              dense: true,
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Clientes()));
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(LineAwesomeIcons.box),
              dense: true,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(LineAwesomeIcons.shopping_bag),
              dense: true,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(LineAwesomeIcons.coins),
              dense: true,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(LineAwesomeIcons.alternate_map_marked),
              dense: true,
              title: Text(
                'Rota',
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 1,
            ),
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                onExpansionChanged: (value) => {
                  _control.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  ),
                },
                leading: Icon(LineAwesomeIcons.pie_chart),
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
                    dense: true,
                    title: Text('A'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.bar_chart,
                        size: 22.0,
                      ),
                    ),
                    dense: true,
                    title: Text('B'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
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
