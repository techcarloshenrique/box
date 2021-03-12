class Site {
  int site;
  String licenca;

  Site(this.site, this.licenca);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'site': site, 'licenca': licenca};
    return map;
  }

  Site.fromMap(Map<String, dynamic> map) {
    site = map['site'];
    licenca = map['licenca'];
  }
}
