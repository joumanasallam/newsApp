import 'package:flutter/material.dart';


Widget greytext (String text,double fontsize){
  return Text(text,style: TextStyle(fontSize: fontsize,color: Colors.grey));
}
Widget blacktext (String text,double fontsize){
  return  Text(text,
                      style: TextStyle(
                          fontSize: fontsize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),maxLines: 2,softWrap: true,);
}

Widget newsslider(String url ,String text ){
  return  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 400,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                               url )))),
                                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    greytext("By s AADEETYA", 10),
                                    greytext("6 mins read", 10),
                                    greytext("2 hours ago", 10)
                                  ],
                                ),
                                 SizedBox(height: 5,),
                                blacktext(text, 18),
                                
                              ],
                            ),
                          ),
                        );
}
Widget newswidget(dynamic articles){
  return  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              articles['urlToImage']),
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      Flexible(
                       
                        child: blacktext( articles['title'], 15)),
                    ],
                  ),
                  greytext( articles['author'], 10),
                  greytext("{$articles['publishedAt']}", 10)
                  ],
                ),
  );
}
Widget searchfield(){
  return  Stack(children: [
                 
                  SizedBox(
                    height: 40,
                    child: Container(
                   
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        // textAlignVertical: TextAlignVertical.center,

                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                          hintText: "search fo article",
                        ),
                       
                      ),
                    ),
                  ),
                ]);
}
 navigator(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    
    return widget;
    
  }));
}