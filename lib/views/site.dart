import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:box/utilities/styles.dart';
import 'package:box/views/login.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:flutter/services.dart';

class Site extends StatefulWidget {
  @override
  _Site createState() => _Site();
}

class _Site extends State<Site> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    requestPermission();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF73AEF5),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                child: Text('Alterar Servidor'),
              ),
              PopupMenuItem<String>(
                child: Text('Teste'),
              ),
            ],
          ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 60.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/logos/logo.png',
                        fit: BoxFit.fitHeight,
                        height: 120,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Box - Vendas',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 60.0),
                      _buildSite(),
                      SizedBox(height: 10.0),
                      _buildValidarBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSite() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*Text(
          'Código',
          style: kLabelStyle,
        ),*/
        SizedBox(height: 10.0),
        Container(
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            cursorColor: Colors.white,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'CÓDIGO DE ACESSO',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildValidarBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      height: 106,
      width: double.infinity,
      child: ElevatedButton(
        style: elevatedButtonStyle,
        onPressed: () => {
          //ScaffoldMessenger.of(context).showSnackBar(snackBar),

          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => Login()),
          ),
        },
        child: Text(
          'VALIDAR',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}

final snackBar = SnackBar(
  elevation: 6.0,
  duration: Duration(seconds: 3),
  backgroundColor: Colors.blue,
  behavior: SnackBarBehavior.floating,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25))),
  content: Text(
    "Snack bar test",
    style: TextStyle(color: Colors.white),
  ),
  action: SnackBarAction(
    label: "FECHAR",
    textColor: Colors.red,
    onPressed: () {},
  ),
);

void requestPermission() async {
// You can can also directly ask the permission about its status.
  if (await Permission.location.isRestricted) {
    // The OS restricts access, for example because of parental controls.
    Permission.camera.request();
  }
}
