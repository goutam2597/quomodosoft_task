import 'package:flutter/material.dart';
import 'package:quomodosoft_task/features/home/ui/widgets/custom_slider_widget.dart';
import '../../data/models/slider_model.dart';

class SliderWidget extends StatelessWidget {
  final List<SliderModel> sliders;

  const SliderWidget({super.key, required this.sliders});

  @override
  Widget build(BuildContext context) {
    return CustomSliderWidget<SliderModel>(
      slides: sliders,
      height: 180,
      showIndicator: true,
      itemBuilder: (context, slide) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            'https://carbaz.mamunuiux.com/${slide.image}',
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (_, __, ___) => const Center(
              child: Icon(Icons.broken_image, size: 80),
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator(strokeWidth: 2));
            },
          ),
        );
      },
    );
  }
}
