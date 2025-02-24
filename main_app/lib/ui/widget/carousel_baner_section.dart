import 'package:components/components/carousel/carousel.dart';
import 'package:flutter/material.dart';
import 'package:main_app/ui/widget/carousel_card.dart';

class CarouselBannerSection extends StatelessWidget {
  final String title;
  final List<String> images;

  const CarouselBannerSection({
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(title, style: textTheme.titleLarge),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Simple banner', style: textTheme.titleMedium),
        ),
        const SizedBox(height: 4),
        MainCarousel.banner(
          items: [
            for (int index = 0; index < images.length; index++)
               ImageCard(imageUrl: images[index]),
          ],
          options: MainBannerCarouselOptions(height: 400),
        ),
        const SizedBox(height: 26),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'With pagination indicator, arrows, autoplay and infinite scroll',
            style: textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 4),
        MainCarousel.banner(
          items: [
            for (int index = 0; index < images.length; index++)
              ImageCard(imageUrl: images[index]),
          ],
          options: MainBannerCarouselOptions(
            height: 400,
            displayArrows: true,
            displayPagination: true,
            autoPlay: true,
            infinitePagination: true,
          ),
        ),
      ],
    );
  }
}