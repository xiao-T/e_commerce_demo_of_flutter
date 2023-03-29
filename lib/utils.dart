// common utils
import 'dart:math';

final Map<String, double> gap = <String, double>{
  's': 4.0,
  'm': 8.0,
  'l': 16.0,
  'xl': 32.0
};

String getRandomImageUrl() {
  final List assets = [
    'https://picsum.photos/id/27/600/600',
    'https://picsum.photos/id/33/600/600',
    'https://picsum.photos/id/32/600/600',
    'https://picsum.photos/id/34/600/600',
    'https://picsum.photos/id/35/400/600',
    'https://picsum.photos/id/36/600/400',
    'https://picsum.photos/id/37/400/600',
    'https://picsum.photos/id/38/800/400',
  ];
  final int randomIndex = Random().nextInt(assets.length).toInt();
  return assets.elementAt(randomIndex);
}
