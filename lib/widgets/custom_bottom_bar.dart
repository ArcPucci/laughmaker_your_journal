import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key, required this.path});

  final String path;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final List<NavigatorItem> navigatorItems = [
    NavigatorItem(
      id: 0,
      title: 'My Jokes',
      icon: 'assets/png/icons/microphone.png',
      path: '/',
    ),
    NavigatorItem(
      id: 1,
      title: 'Guide',
      icon: 'assets/png/icons/note.png',
      path: '/guides',
    ),
    NavigatorItem(
      id: 2,
      title: 'Library',
      icon: 'assets/png/icons/medal.png',
      path: '/library',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    final selectedIndex = getSelected();
    return Container(
      width: 393.w,
      height: 66.h + overlay.bottom,
      decoration: const BoxDecoration(
        color: AppTheme.grey2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      padding: EdgeInsets.only(bottom: overlay.bottom),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          navigatorItems.length,
          (index) {
            final item = navigatorItems[index];
            final selected = selectedIndex == index;
            return GestureDetector(
              onTap: () => context.go(item.path),
              child: Container(
                width: 131.w,
                height: 66.h,
                color: Colors.transparent,
                padding: EdgeInsets.only(bottom: 4.h),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        item.icon,
                        width: 24.w,
                        height: 24.h,
                        color: selected ? AppTheme.red : null,
                      ),
                      Text(
                        item.title,
                        style: selected
                            ? AppTextStyles.bold17
                            : AppTextStyles.medium17,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  int getSelected() {
    for (int i = navigatorItems.length - 1; i >= 0; i--) {
      if (widget.path.contains(navigatorItems[i].path)) return i;
    }

    return 0;
  }
}
