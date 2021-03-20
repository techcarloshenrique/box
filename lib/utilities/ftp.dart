import 'dart:io';

import 'package:ftpclient/ftpclient.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:box/utilities/constants.dart';

class Ftp2 {
  FTPClient ftpClient;
  String ftpHost = '192.168.0.100';
  String ftpUser = 'box';
  String ftpPass = 'box';

  Future<bool> connectFtp() async {
    ftpClient = FTPClient(ftpHost, user: ftpUser, pass: ftpPass);
    try {
      ftpClient.connect();
    } on Exception catch (ex) {
      Constants.lastError = ex.toString();
      print(ex.toString());
      return false;
    } finally {
      //ftpClient.disconnect();
    }
    return true;
  }

  Future<bool> checkFtp() async {
    try {
      return await connectFtp();
    } on Exception catch (ex) {
      Constants.lastError = ex.toString();
      return false;
    } finally {
      ftpClient.disconnect();
    }
  }

  Future<bool> downloadFile(String ftpFile, String localFile) async {
    try {
      connectFtp();
      ftpClient.downloadFile(ftpFile, File(localFile));
    } on Exception catch (ex) {
      Constants.lastError = ex.toString();
      return false;
    } finally {
      ftpClient.disconnect();
    }
    return true;
  }
}

class Ftp {
  FTPConnect ftpConn;
  String ftpHost = '192.168.0.100';
  String ftpUser = 'box';
  String ftpPass = 'box';

  Future<bool> connectFtp() async {
    try {
      ftpConn = FTPConnect(ftpHost, user: ftpUser, pass: ftpPass);
      bool res = await ftpConn.connect();
      return res;
    } on Exception catch (ex) {
      Constants.lastError = ex.toString();
      return false;
    } finally {
      await ftpConn.disconnect();
    }
  }

  Future<bool> disconnectFtp() async {
    try {
      return await ftpConn.disconnect();
    } on Exception catch (ex) {
      Constants.lastError = ex.toString();
      return false;
    } finally {
      //await ftpConnect.disconnect();
    }
  }

  Future<bool> checkFtp() async {
    try {
      return await connectFtp();
    } on Exception catch (ex) {
      Constants.lastError = ex.toString();
      return false;
    } finally {
      await ftpConn.disconnect();
    }
  }

  Future<bool> download(String filename, newfile) async {
    try {
      connectFtp();
      //print(ftpConn.listDirectoryContent());
      //return false;
      return await ftpConn.downloadFile(filename, File(newfile));
    } on Exception catch (ex) {
      Constants.lastError = ex.toString();
      return false;
    } finally {
      await ftpConn.disconnect();
    }
  }
}
