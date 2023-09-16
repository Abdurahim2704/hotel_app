import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationPageIndicator extends StatefulWidget {
  final int count;
  final List<String>? imageUrls;

  const AnimationPageIndicator(
      {super.key, required this.count, this.imageUrls});

  @override
  State<AnimationPageIndicator> createState() => _AnimationPageIndicatorState();
}

class _AnimationPageIndicatorState extends State<AnimationPageIndicator> {
  int position = 0;
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController()
      ..addListener(() {
        setState(() {
          position = pageController.page! ~/ 1;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 230.sp,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              controller: pageController,
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        "assets/images/image.png",
                        fit: BoxFit.fill,
                        // loadingBuilder: (BuildContext context,
                        //     Widget child,
                        //     ImageChunkEvent? loadingProgress) {
                        //   if (loadingProgress == null) return child;
                        //   return Center(
                        //     child: CircularProgressIndicator(
                        //       value: loadingProgress
                        //           .expectedTotalBytes !=
                        //           null
                        //           ? loadingProgress
                        //           .cumulativeBytesLoaded /
                        //           loadingProgress
                        //               .expectedTotalBytes!
                        //           : null,
                        //     ),
                        //   );
                        // },
                      ),
                    ),
                  )
              ],
            ),
          ),
          Positioned(
            top: 200.sp,
            left: 150.sp,
            child: Container(
              width: 75.sp,
              height: 17.sp,
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < widget.count; i++)
                    AnimatedContainer(
                      height: 7.sp,
                      width: 7.sp,
                      curve: Curves.easeInExpo,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: position == i
                            ? Colors.black
                            : Colors.black.withOpacity(1 -
                                (i - position).abs() *
                                    0.7 *
                                    (1 / widget.count) -
                                0.35),
                      ),
                      duration: const Duration(milliseconds: 200),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
