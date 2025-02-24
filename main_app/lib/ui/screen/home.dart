import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/provider/content_provider.dart';
import 'package:main_app/ui/widget/carousel_baner_section.dart';
import 'package:main_app/ui/widget/carousel_item_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsAsync = ref.watch(collectionsProvider);
    final storiesAsync = ref.watch(storiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Carousel example')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            collectionsAsync.when(
              data:
                  (images) => CarouselBannerSection(
                    title: 'Collections Carousel',
                    images: images,
                  ),
              loading: () => Center(child: const CircularProgressIndicator()),
              error: (err, stack) => Text('Error loading collections: $err'),
            ),
            const SizedBox(height: 32),
            storiesAsync.when(
              data:
                  (images) => CarouselItemSection(
                    title: 'Stories Carousel',
                    images: images,
                  ),
              loading: () => Center(child: const CircularProgressIndicator()),
              error: (err, stack) => Text('Error loading stories: $err'),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
