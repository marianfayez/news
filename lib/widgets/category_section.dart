import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class CategorySection extends StatelessWidget {
  Function onTab;
   CategorySection({required this.onTab,super.key});


  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning\nHere is Some News For You",style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 16.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context,index){
                  return 
                    Stack(
                      alignment: !index.isOdd?Alignment.bottomRight:Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(24.r),
                            child: Image.asset("assets/images/${provider.currentList[index]}.png")),
                        InkWell(
                          onTap:(){
                            onTab(provider.currentList[index].substring(0,provider.currentList[index].length-6));
                  },
                          child: Container(
                              margin:  EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                            decoration: BoxDecoration(
                                            color:Colors.white.withOpacity(.5),borderRadius: BorderRadius.circular(30.r)
                                            ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children:
                                index.isOdd?
                                [
                                  Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40.r)),
                                      child: Icon(Icons.arrow_back_ios)),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Text("View All",style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ]:[
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Text("View All",style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40.r)),
                                      child: Icon(Icons.arrow_forward_ios))

                                ]
                              )),
                        ),

                      ],
                    );
                },
                separatorBuilder: (context,index)=>SizedBox(height: 16.h,),
                itemCount: provider.currentList.length),
          )

        ],
      ),
    );
  }
}
