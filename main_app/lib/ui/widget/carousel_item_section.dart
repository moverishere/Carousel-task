import 'package:components/components/carousel/carousel.dart';
import 'package:flutter/material.dart';
import 'package:main_app/ui/widget/carousel_card.dart';

class CarouselItemSection extends StatelessWidget {
  final String title;
  final List<String> images;

  const CarouselItemSection({
    super.key,
    required this.title,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(title, style: textTheme.titleLarge),
        ),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Simple card', style: textTheme.titleMedium),
        ),
        const SizedBox(height: 4),
        MainCarousel.item(
          items: [
            for (int index = 0; index < images.length; index++)
              CarouselCard(imageUrl: images[index]),
          ],
          options: MainItemCarouselOptions(height: 400),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Infinite scroll without page snapping and with pagination',
            style: textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 4),
        MainCarousel.item(
          items: [
            for (int index = 0; index < images.length; index++)
              CarouselCard(imageUrl: images[index]),
          ],
          options: MainItemCarouselOptions(
            height: 400,
            pageSnapping: false,
            displayArrows: true,
            displayPagination: true,
            infinitePagination: true,
          ),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Circle Images (infinite scroll)',
            style: textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 4),
        MainCarousel.item(
          items: [
            for (int index = 0; index < images.length; index++)
              CarouselCard(imageUrl: images[index], isCircular: true),
          ],
          options: MainItemCarouselOptions(
            height: 150,
            viewportFraction: 0.3,
            displayArrows: true,
            displayPagination: true,
            infinitePagination: true,
            pageSnapping: false,
          ),
        ),
      ],
    );
  }
}
