import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Offer {
  final String imageUrl;
  final String title;
  final String subtitle;

  Offer({required this.imageUrl, required this.title, required this.subtitle});
}

class OfferCarousel extends StatelessWidget {
  OfferCarousel({super.key});

  final List<Offer> offers = [
    Offer(
      imageUrl:
          'https://images.unsplash.com/photo-1526692202263-843e30c353e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8eW91bmclMjBmYXNoaW9uJTIwc3RyZWV0d2VhcnxlbnwwfDB8MHx8fDA%3D',
      title: 'Streetwear Collection',
      subtitle: 'Diskon hingga 50% untuk semua item!',
    ),
    Offer(
      imageUrl:
          'https://images.unsplash.com/photo-1671099484139-b4674a9bf986?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTV8fGZhc2hpb24lMjB0c2hpcnR8ZW58MHwwfDB8fHww',
      title: 'Casual Outfit',
      subtitle: 'Kaos distro mulai dari Rp99.000',
    ),
    Offer(
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1706759228478-05c2ab66c900?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGhvb2RpZXxlbnwwfDB8MHx8fDA%3D',
      title: 'Exclusive Hoodie',
      subtitle: 'Gratis ongkir untuk semua hoodie',
    ),
    Offer(
      imageUrl:
          'https://images.unsplash.com/photo-1527016021513-b09758b777bd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGRlbmltJTIwamFja2V0fGVufDB8MHwwfHx8MA%3D%3D',
      title: 'Denim Jacket',
      subtitle: 'Style kece buat nongkrong bareng teman',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      items: offers.map((offer) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(offer.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.black.withAlpha(120), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      offer.subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
