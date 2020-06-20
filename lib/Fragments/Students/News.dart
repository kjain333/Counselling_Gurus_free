class News{
  String heading;
  String subheading;
  String data;
  String link="";
  String getHeading(){
    return heading;
  }
  String getSubheading(){
    return subheading;
  }
  String getData(){
    return data;
  }
  News(String h,String d,String link)
  {
    this.heading=h;
    this.data=d;
    this.link=link;
    subheading=data.substring(0,50)+"...";
  }
}