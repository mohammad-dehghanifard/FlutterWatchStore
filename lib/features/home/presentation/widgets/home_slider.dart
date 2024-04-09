import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/features/home/data/models/slider_model.dart';


class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key, required this.sliders});
  final List<SliderModel> sliders;

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {


  final PageController pageController = PageController();
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height / 4.8,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.sliders.length,
              onPageChanged: (value) {
                selectedImage = value;
                setState(() {

                });
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.sliders[index].image!,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
          6.0.height,
          // indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.sliders.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: selectedImage == index? 24 : 12,
                height: selectedImage == index? 8 : 12,
                decoration: BoxDecoration(
                  color: selectedImage == index? Theme.of(context).colorScheme.primary : null,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Theme.of(context).colorScheme.primary)
                ),
              );
            }),
          )
          // page indicator
        ],
      ),
    );
  }
}