
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingFeaturedBooks extends StatelessWidget {
  const CustomLoadingFeaturedBooks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: MediaQuery.of(context).size.height * 0.3,
    child: Skeletonizer(
       effect:const ShimmerEffect(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        highlightColor: Colors.greenAccent,
        ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5, 
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset('assets/images/abdo.png',fit: BoxFit.fill,),
              ),
            ),
          );
        },
      ),
    ),
        );
  }
}
