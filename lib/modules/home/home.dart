import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/home/cubit/cubit.dart';

import '../../shared/shared_component/component.dart';
import 'cubit/states.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) {
        return HomeCubit()..getHomeModel();
      },
          child: BlocConsumer<HomeCubit, Homestates>(
          listener: (context, state) {
            
          },
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            var list =cubit.newsModel.articles!;
               
         return state is HomeLoadingState? Center(child: CircularProgressIndicator(),) :SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              greytext("Mon,5th septemper 2022", 10),
                              blacktext("News Bulletin 24/7", 18)
                            ],
                          ),
                          SizedBox(width: 5),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://googleflutter.com/sample_image.jpg"),
                                  fit: BoxFit.fill),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: PageView.builder(
                          controller: cubit.pageController,
                          onPageChanged: (index) {
                            cubit.onchangepage(index);
                          },
                          itemBuilder: (_, index) {
                            return AnimatedBuilder(
                              animation: cubit.pageController,
                              builder: (context, child) {
                                return child!;
                              },
                              child: newsslider(
                                 list[index].urlToImage!,list[index].title!),
                            );
                          },
                          itemCount:list.length),
                    ),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                         5,
                          (index) => Container(
                                margin: EdgeInsets.all(3),
                                child: Icon(Icons.circle,
                                    size: 10.0,
                                    color: cubit.pageno == index
                                        ? Colors.black
                                        : Colors.grey),
                              )).toList(),
                    ),
                      SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blacktext("Latest News", 18),
                          InkWell(child: greytext("more", 13))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1.1,
                      scrollDirection: Axis.vertical,
                      children: List.generate(list.length, (index) => newswidget(list[index])),
                    )
                  ],
                ),
              ));}
            ),
    );
       
        
  
  }
}
