import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';

class CarouselSliderWidget extends StatelessWidget {
  final bool ischannel;
  final double? height;
  final int? count;
  final CarouselSliderController? carouselSliderController;
  final Widget? widget;
  final double viewportFraction;
  final List<Widget>? item;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final PageController? pageController;
  const CarouselSliderWidget({
    super.key,
    this.ischannel = false,
    this.item,
    this.height,
    required this.viewportFraction,
    this.count,
    this.carouselSliderController,
    this.widget,
    this.onPageChanged,
    this.pageController,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: carouselSliderController,
          items: item,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              if (onPageChanged != null) {
                onPageChanged?.call(index, reason);
              }
            },
            pauseAutoPlayOnTouch: true,
            height: height,
            viewportFraction: viewportFraction,
            initialPage: 0,
            enableInfiniteScroll: item!.length == 1 ? false : true,
            autoPlay: count != null && count! > 1,
            // autoPlay: false,
            enlargeCenterPage: true,
            enlargeFactor: 0,
            scrollDirection: Axis.horizontal,
          ),
        ),
        verticalGap(context.height(1.5)),
        if (widget != null) widget!,
      ],
    );
  }
}
