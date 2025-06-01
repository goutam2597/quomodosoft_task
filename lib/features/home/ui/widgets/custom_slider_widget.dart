import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSliderWidget<T> extends StatefulWidget {
  final List<T> slides;
  final Widget Function(BuildContext, T) itemBuilder;
  final double height;
  final BoxFit fit;
  final bool showIndicator;

  const CustomSliderWidget({
    super.key,
    required this.slides,
    required this.itemBuilder,
    this.height = 180,
    this.fit = BoxFit.cover,
    this.showIndicator = true,
  });

  @override
  State<CustomSliderWidget<T>> createState() =>
      _CustomSliderWidgetState<T>();
}

class _CustomSliderWidgetState<T> extends State<CustomSliderWidget<T>> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height + (widget.showIndicator ? 30 : 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Main carousel slider
          CarouselSlider.builder(
            itemCount: widget.slides.length,
            options: CarouselOptions(
              height: widget.height,
              viewportFraction: 1,
              onPageChanged: (index, _) => _selectedIndex.value = index,
            ),
            itemBuilder: (context, index, _) =>
                widget.itemBuilder(context, widget.slides[index]),
          ),

          /// Page indicator at the bottom
          if (widget.showIndicator)
            Positioned(
              bottom: 25,
              child: ValueListenableBuilder<int>(
                valueListenable: _selectedIndex,
                builder: (_, value, __) => Row(
                  children: List.generate(
                    widget.slides.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 8,
                      width: value == index ? 24 : 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: value == index
                            ? Colors.white
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
