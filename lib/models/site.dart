class Site {
  int site;
  String licenca;

  Site();

  int get getSite {
    return this.site;
  }

  set setSite(int value) {
    site = value;
  }

  Map<String, dynamic> get map {
    return {'site': site, 'licenca': licenca};
  }

  Site.fromMap(Map<String, dynamic> map) {
    site = map['site'];
    licenca = map['licenca'];
  }
}
