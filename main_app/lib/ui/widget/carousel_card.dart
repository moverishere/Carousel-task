import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String imageUrl;
  final bool isCircular;

  const CarouselCard({
    super.key,
    required this.imageUrl,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _PlaceHolder(isCircular: isCircular);
    }

    return isCircular
        ? _CircularCard(imageUrl: imageUrl)
        : _RectangularCard(imageUrl: imageUrl);
  }
}

class _RectangularCard extends StatelessWidget {
  final String imageUrl;

  const _RectangularCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder:
            (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        placeholder:
            (context, url) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.colorScheme.onSurface,
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
        errorWidget:
            (context, url, error) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.colorScheme.onSurface,
              ),
              child: Center(
                child: Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
      ),
    );
  }
}

class _CircularCard extends StatelessWidget {
  final String imageUrl;

  const _CircularCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder:
            (context, imageProvider) =>
                CircleAvatar(radius: 75, backgroundImage: imageProvider),
        placeholder:
            (context, url) => CircleAvatar(
              radius: 75,
              backgroundColor: theme.colorScheme.onSurface.withValues(
                alpha: 0.6,
              ),
              child: const CircularProgressIndicator(),
            ),
        errorWidget:
            (context, url, error) => CircleAvatar(
              radius: 75,
              backgroundColor: theme.colorScheme.surface,
              child: Icon(
                Icons.image_not_supported,
                size: 50,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
      ),
    );
  }
}

class _PlaceHolder extends StatelessWidget {
  final bool isCircular;

  const _PlaceHolder({required this.isCircular});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: isCircular ? 150 : 400,
      width: isCircular ? 150 : double.infinity,
      margin: EdgeInsets.symmetric(horizontal: isCircular ? 4 : 8),
      decoration: BoxDecoration(
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular ? null : BorderRadius.circular(12),
        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          size: isCircular ? 50 : 100,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
