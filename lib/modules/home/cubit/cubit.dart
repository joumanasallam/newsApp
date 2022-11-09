import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/newsmodel.dart';
import 'package:news_app/modules/home/cubit/states.dart';
import 'package:news_app/modules/home/home.dart';
import 'package:news_app/shared/shared_component/component.dart';

import '../../../shared/shared_network/remote/diohelper.dart';

List <Article> data=[];

class HomeCubit extends Cubit<Homestates>{
HomeCubit():super(HomeInitState());

 

 static HomeCubit get(context)=>BlocProvider.of<HomeCubit>(context);
 final PageController pageController=PageController();
 
int pageno=0;
void onchangepage(int index){
  if (index<5)
  {pageno=index;}
  else if (index>=5)index=0;
  emit(HomeCurrentState());
}
 
 List photos=[
   "https://googleflutter.com/sample_image.jpg",
    "https://googleflutter.com/sample_image.jpg",
     "https://googleflutter.com/sample_image.jpg",
      "https://googleflutter.com/sample_image.jpg",
       "https://googleflutter.com/sample_image.jpg",
 ];
List titels=[
  "Apple Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up",
  "Samsung Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up",
  "OPPO Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up",
  "HAwaui Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up",
  "Apple Lightning Connector Came OUT to Years Ago ,But Now Its Time Is Up"
];

 NewsModel newsModel=NewsModel();

bool datacome=false;
void getHomeModel() {
    emit(HomeLoadingState());
    DioHelper.getData(
        url: "everything",
        query: {
          "q":"bitcoin",
          "apiKey":"1039e6f90e5a4cb2a6193bcb7a1127b4"
        }
     
        ).then((value) {
            newsModel = NewsModel.fromJson(value.data);
            data+=newsModel.articles!;
          
//data=value.data['articles'];
         if (newsModel==null){
           print("data dont come");
         }else
       
             print("data come");
             print(value.data);
            print(newsModel.articles![0].author);
              print(data[0].title);

           
      emit(HomeSusessState(newsModel));
       
    }).catchError((error) {
      debugPrint(error.toString());
      emit(HomeErorrState(error));
    });
  }
  
 void printmodel (){
   print(data[0].title);
 }  


}