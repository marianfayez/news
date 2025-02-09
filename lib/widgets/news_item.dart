import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/news_model.dart';

class NewsItem extends StatelessWidget {
  final Articles articles;
  const NewsItem({required this.articles,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(color: Theme.of(context).primaryColor)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(imageUrl:articles.urlToImage ?? "",
                height: 220,width: double.infinity,fit: BoxFit.fill,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),),
              ),
              SizedBox(height: 16.h,),
              Text(articles.title??"",maxLines: 2,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleSmall,),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(articles.author!=null && articles.author!.isNotEmpty? articles.author!.split(" ").take(2).join(" "):articles.author??"",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12,color: Color(0xFFA0A0A0)),),
                  Text(articles.publishedAt?.substring(0,10)??"",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12,color: Color(0xFFA0A0A0)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
