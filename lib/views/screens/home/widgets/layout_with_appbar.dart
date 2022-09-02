import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/app_constants.dart';

class LayoutWithAppBar extends StatefulWidget {
  final String? title;
  final bool isExpandIcon;
  final VoidCallback? onTapTitle;
  final VoidCallback? onTapMenu;
  final Future<void>Function() onRefresh;
  final bool isAppBarPinned;
  final double? expandedHeight;
  final Widget? body;
  final bool isFlexibleSpace;
  final bool isSliverPersistentHeader;
  final Widget? flexibleSpace;
  final Widget? sliverPersistentHeaderBody;
  final bool isTabBar;
  final bool isMenuIcon;

  const LayoutWithAppBar({Key? key, this.title, this.isExpandIcon = false, this.isMenuIcon = false ,this.isAppBarPinned = false, this.onTapTitle, this.onTapMenu, required this.onRefresh, this.isTabBar = false, this.expandedHeight, required this.body, this.sliverPersistentHeaderBody , this.isFlexibleSpace = false, this.isSliverPersistentHeader = false, this.flexibleSpace}) : super(key: key);

  @override
  State<LayoutWithAppBar> createState() => _LayoutWithAppBarState();
}

class _LayoutWithAppBarState extends State<LayoutWithAppBar> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const CustomDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: widget.onRefresh,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // App Bar
              SliverAppBar(
                pinned: widget.isAppBarPinned,
                floating: true,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                title: Row(children: [
                  SizedBox(height: 40, width: 40,
                      child: TextButton(
                          style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                                primary: Colors.black,
                                backgroundColor: Colors.yellow,
                                padding: EdgeInsets.zero),
                            onPressed: () => Get.back(),
                            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 15)
                        )),
                    const Spacer(),
                    Text(widget.title ?? AppConstants.appName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite, size: 30, color: Colors.red))
                  ]),

                  // actions: [
                  //   Padding(padding: const EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                  //
                  //       child: Center(child: Row(
                  //           children: [
                  //             InkWell(
                  //                 onTap: () {},
                  //                 child: Stack(children: [
                  //                   const Icon(Icons.notifications, size: 25),
                  //
                  //                   Positioned(top: 0, right: 0, child: Container( height: 10, width: 10,
                  //                       decoration: BoxDecoration(
                  //                         color: Theme.of(context).primaryColor, shape: BoxShape.circle,
                  //                         border: Border.all(width: 1, color: Theme.of(context).cardColor),
                  //                       ))),
                  //                 ])),
                  //
                  //           ]))),
                  //   widget.isMenuIcon ?
                  //   InkWell(
                  //     onTap: widget.onTapMenu!,
                  //     child: const Icon(Icons.menu),
                  //   ) : const SizedBox()
                  // ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    widget.body!
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }
}
