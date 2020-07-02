class News{
  String heading;
  String subheading;
  String data;
  String link="";
  String image;
  String getHeading(){
    return heading;
  }
  String getSubheading(){
    return subheading;
  }
  String getData(){
    return data;
  }
  News(String h,String d,String link,String i)
  {
    this.heading=h;
    this.data=d;
    this.link=link;
    this.image=i;
    subheading=data.substring(0,50)+"...";
  }
}