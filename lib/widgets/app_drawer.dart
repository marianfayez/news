import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  Function onTab;
   AppDrawer({required this.onTab,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width*0.7,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 166.h,
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text("News App",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700)),
          ),
          InkWell(
            onTap:(){
              onTab();

            },
            child: ListTile(
              leading: Icon(Icons.home_outlined,color: Colors.white,),
              title: Text("Go To Home",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
              subtitle: Text("Click Here",style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward,color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}
