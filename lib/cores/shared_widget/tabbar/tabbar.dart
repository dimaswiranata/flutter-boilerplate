import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:preload_page_view/preload_page_view.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:flutterboilerplate/cores/index.dart';

class TabbarItem {
  int? id;
  String? name;
  bool? hasNotif;
  int? numOfNotif;

  TabbarItem({this.id, this.name, this.hasNotif, this.numOfNotif});
}

class OgloTabbar extends StatefulWidget {
  const OgloTabbar({
    super.key,
    required this.tabbarItems,
    required this.tabbarViews,
    this.type = TabbarType.DEFAULT,
    this.itemWidth,
    this.hasPaddingTop = false,
    this.hasScrollEffect = false,
    this.isStack = false,
    this.initialPage,
    this.activeIndex,
    this.onSwipe,
    this.onTapTabItem,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.ease,
  });

  final List<TabbarItem> tabbarItems;
  final List<Widget> tabbarViews;
  final TabbarType? type;
  final double? itemWidth;
  final bool hasPaddingTop;
  final bool hasScrollEffect;
  final bool isStack;
  final int? initialPage;
  final int? activeIndex;
  final void Function(int value)? onSwipe;
  final void Function(int value)? onTapTabItem;
  final Duration duration;
  final Curve curve;

  @override
  State<OgloTabbar> createState() => _OgloTabbarState();
}

class _OgloTabbarState extends State<OgloTabbar> {
  int _current = 0;
  late PreloadPageController _pageController;
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  void initState() {
    if (widget.type == TabbarType.CAPSULE_GROUP && widget.itemWidth == null) {
      throw ArgumentError(
          'itemWidth must be provided when type is CAPSULE_GROUP');
    }
    super.initState();
    setState(() {
      _current = widget.activeIndex ?? widget.initialPage ?? 0;
    });
    _pageController = PreloadPageController(
        initialPage: widget.activeIndex ?? widget.initialPage ?? 0);
  }

  @override
  void didUpdateWidget(OgloTabbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.activeIndex != null && widget.activeIndex != _current) {
      setState(() {
        _current = widget.activeIndex!;
        _pageController.jumpToPage(_current);
        _scrollToIndex(_current);
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (widget.tabbarItems.length - 1))!;
    } else {
      return lerpDouble(1.0, -1.0, index / (widget.tabbarItems.length - 1))!;
    }
  }

  void _scrollToIndex(int index) {
    if (widget.hasScrollEffect) {
      _itemScrollController.scrollTo(
        index: index,
        duration: widget.duration,
        curve: widget.curve,
      );
    }
  }

  Widget _buildTabbarView() {
    if (widget.tabbarViews.isEmpty) return const SizedBox();
    if (widget.isStack == true) {
      return Flexible(
        child: ProsteIndexedStack(index: _current, children: [
          for (int i = 0; i < widget.tabbarViews.length; i++) ...[
            IndexedStackChild(
              child: widget.tabbarViews[i],
            ),
          ],
        ]),
      );
    }

    return Flexible(
      child: PreloadPageView.builder(
        preloadPagesCount: widget.tabbarViews.length,
        controller: _pageController,
        itemBuilder: (context, position) {
          return widget.tabbarViews[position];
        },
        itemCount: widget.tabbarViews.length,
        onPageChanged: (value) {
          if (widget.onSwipe != null) {
            widget.onSwipe!(value);
          }
          _scrollToIndex(value);
          setState(() {
            _current = value;
          });
        },
      ),
    );
  }

  Widget _buildCapsuleGroup() {
    return OgloContainer(
      height: 34,
      width: double.infinity,
      child: ScrollablePositionedList.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          itemScrollController: _itemScrollController,
          itemCount: widget.tabbarItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return OgloContainer(
              onTap: () {
                if (widget.onTapTabItem != null) {
                  widget.onTapTabItem!(index);
                }
                _scrollToIndex(index);
                if (widget.isStack == false) {
                  _pageController.animateToPage(
                    index,
                    duration: widget.duration,
                    curve: widget.curve,
                  );
                }
                setState(() {
                  _current = index;
                });
              },
              child: Stack(children: [
                OgloContainer(
                  borderColor: AppColors.secondaryGold,
                  borderTopWidth: 1,
                  borderBottomWidth: 1,
                  borderLeftWidth: index == 0 ? 1.0 : 0.0,
                  borderRightWidth:
                      index == widget.tabbarItems.length - 1 ? 1.0 : 0.0,
                  borderTopLeftRadius: index == 0 ? AppRounds.full : 0.0,
                  borderBottomLeftRadius: index == 0 ? AppRounds.full : 0.0,
                  borderTopRightRadius: index == widget.tabbarItems.length - 1
                      ? AppRounds.full
                      : 0.0,
                  borderBottomRightRadius:
                      index == widget.tabbarItems.length - 1
                          ? AppRounds.full
                          : 0.0,
                  marginLeft: index == 0 ? AppSpaces.reg : 0.0,
                  marginRight: index == widget.tabbarItems.length - 1
                      ? AppSpaces.reg
                      : 0.0,
                  width: widget.itemWidth,
                  height: 34,
                ),
                OgloContainer(
                  marginLeft: index == 0 ? AppSpaces.reg : 0.0,
                  marginRight: index == widget.tabbarItems.length - 1
                      ? AppSpaces.reg
                      : 0.0,
                  child: AnimatedContainer(
                    height: 34,
                    width: widget.itemWidth,
                    duration: widget.duration,
                    curve: widget.curve,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpaces.md),
                    decoration: BoxDecoration(
                      color: _current == index ? AppColors.primaryColor : null,
                      borderRadius: BorderRadius.circular(AppRounds.full),
                    ),
                    child: OgloContainer(
                      mainAxis: MainAxisAlignment.center,
                      crossAxis: CrossAxisAlignment.center,
                      flexDir: FlexDirection.ROW,
                      children: [
                        widget.itemWidth != null
                            ? Flexible(
                                child: Text(
                                  (widget.tabbarItems[index].name ?? ''),
                                  style: bodyCaption.copyWith(
                                      color: _current == index
                                          ? Colors.white
                                          : AppColors.primaryColor,
                                      fontWeight: FontWeight.w700),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            : Text(
                                (widget.tabbarItems[index].name ?? ''),
                                style: bodyCaption.copyWith(
                                    color: _current == index
                                        ? Colors.white
                                        : AppColors.primaryColor,
                                    fontWeight: FontWeight.w700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                        Visibility(
                          visible: widget.tabbarItems[index].hasNotif == true &&
                              _current != index,
                          child: const OgloContainer(
                            width: AppSpaces.xs,
                            height: AppSpaces.xs,
                            marginLeft: 8,
                            bgColor: AppColors.secondaryGold,
                            borderRadius: AppRounds.full,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            );
          }),
    );
  }

  Widget _buildCapsule() {
    return OgloContainer(
      height: 30,
      width: double.infinity,
      marginBottom: widget.hasPaddingTop ? AppSpaces.reg : 0,
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.tabbarItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return OgloContainer(
            onTap: () {
              if (widget.onTapTabItem != null) {
                widget.onTapTabItem!(index);
              }
              _scrollToIndex(index);
              if (widget.isStack == false) {
                _pageController.animateToPage(
                  index,
                  duration: widget.duration,
                  curve: widget.curve,
                );
              }
              setState(() {
                _current = index;
              });
            },
            marginLeft: index == 0 ? AppSpaces.reg : 0.0,
            marginRight: index == widget.tabbarItems.length - 1
                ? AppSpaces.reg
                : AppSpaces.sm,
            child: AnimatedContainer(
              width: widget.itemWidth,
              duration: widget.duration,
              curve: widget.curve,
              padding: const EdgeInsets.symmetric(horizontal: AppSpaces.md),
              decoration: BoxDecoration(
                color: _current == index
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(AppRounds.full),
                border: Border.all(
                  color: _current == index
                      ? Colors.transparent
                      : AppColors.primaryColor,
                  width: 1,
                ),
              ),
              child: OgloContainer(
                mainAxis: MainAxisAlignment.center,
                crossAxis: CrossAxisAlignment.center,
                flexDir: FlexDirection.ROW,
                children: [
                  widget.itemWidth != null
                      ? Flexible(
                          child: Text(
                            (widget.tabbarItems[index].name ?? ''),
                            style: bodyCaption.copyWith(
                                color: _current == index
                                    ? Colors.white
                                    : AppColors.primaryColor,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : Text(
                          (widget.tabbarItems[index].name ?? ''),
                          style: bodyCaption.copyWith(
                              color: _current == index
                                  ? Colors.white
                                  : AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  Visibility(
                    visible: widget.tabbarItems[index].hasNotif == true &&
                        _current != index,
                    child: const OgloContainer(
                      width: AppSpaces.xs,
                      height: AppSpaces.xs,
                      marginLeft: 8,
                      bgColor: AppColors.secondaryGold,
                      borderRadius: AppRounds.full,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDefault() {
    return OgloContainer(
      height: 46,
      width: double.infinity,
      marginBottom: widget.hasPaddingTop ? AppSpaces.reg : 0,
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.tabbarItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return OgloContainer(
            onTap: () {
              if (widget.onTapTabItem != null) {
                widget.onTapTabItem!(index);
              }
              _scrollToIndex(index);
              if (widget.isStack == false) {
                _pageController.animateToPage(
                  index,
                  duration: widget.duration,
                  curve: widget.curve,
                );
              }
              setState(() {
                _current = index;
              });
            },
            child: OgloContainer(
              width: widget.itemWidth,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.border,
                    width: 1,
                  ),
                ),
              ),
              child: OgloContainer(
                mainAxis: MainAxisAlignment.center,
                crossAxis: CrossAxisAlignment.center,
                flexDir: FlexDirection.ROW,
                children: [
                  widget.itemWidth != null
                      ? Flexible(
                          child: Text(
                            (widget.tabbarItems[index].name ?? ''),
                            style: bodyBody.copyWith(
                                color: _current == index
                                    ? AppColors.greyText
                                    : AppColors.greySubText,
                                fontWeight: _current == index
                                    ? FontWeight.w700
                                    : FontWeight.w400),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : Text(
                          (widget.tabbarItems[index].name ?? ''),
                          style: bodyBody.copyWith(
                              color: _current == index
                                  ? AppColors.greyText
                                  : AppColors.greySubText,
                              fontWeight: _current == index
                                  ? FontWeight.w700
                                  : FontWeight.w400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  Visibility(
                    visible: widget.tabbarItems[index].hasNotif == true &&
                        _current != index,
                    child: const OgloContainer(
                      width: AppSpaces.xs,
                      height: AppSpaces.xs,
                      marginLeft: 8,
                      bgColor: AppColors.secondaryGold,
                      borderRadius: AppRounds.full,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabbarItem() {
    if (widget.tabbarItems.isEmpty) return const SizedBox();
    if (widget.type == TabbarType.CAPSULE_GROUP) {
      return _buildCapsuleGroup();
    } else if (widget.type == TabbarType.CAPSULE) {
      return _buildCapsule();
    } else {
      return _buildDefault();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OgloContainer(
      children: [
        Stack(
          children: [
            _buildTabbarItem(),
            Positioned(
              bottom: 0,
              width: MediaHelper.getDinamicWidth(context),
              child: AnimatedAlign(
                alignment: Alignment(_getIndicatorPosition(_current), 0),
                curve: widget.curve,
                duration: widget.duration,
                child: OgloContainer(
                  bgColor: AppColors.primaryColor,
                  width: widget.itemWidth ?? 0 / widget.tabbarItems.length,
                  height: 2,
                  borderRadius: 2 / 2,
                ),
              ),
            ),
          ],
        ),
        _buildTabbarView(),
      ],
    );
  }
}
