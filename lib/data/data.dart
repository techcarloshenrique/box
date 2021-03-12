class SliderModel {
  String imgPath;
  String title;
  String desc;

  SliderModel({this.imgPath, this.title, this.desc});

  void setImgPath(String getImgPath) {
    imgPath = getImgPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImgPath() {
    return imgPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel();

  // 1
  sliderModel.setImgPath("assets/images/obm1.jpg");
  sliderModel.setTitle("TÍTULO 1");
  sliderModel.setDesc(
      "This should be accepted answer, because Padding can be marked as const, whereas Container cannot.");
  slides.add(sliderModel);

  // 2
  sliderModel = new SliderModel();
  sliderModel.setImgPath("assets/images/obm2.jpg");
  sliderModel.setTitle("TÍTULO 2");
  sliderModel.setDesc(
      "CollinJackson mentioned the same thing, and you just added grey area stuff, so this is not an answer, it is better suited a comment.");
  slides.add(sliderModel);

  // 3
  sliderModel = new SliderModel();
  sliderModel.setImgPath("assets/images/obm3.jpg");
  sliderModel.setTitle("TÍTULO 3");
  sliderModel.setDesc(
      "Status bar will show again when navigate to new route and keyboard is open.do you know how to fix it?");
  slides.add(sliderModel);

  return slides;
}
