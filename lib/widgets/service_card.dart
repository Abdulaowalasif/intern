import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  final String duration;
  final String category;
  final String location;
  final String price;
  final String originalPrice;
  final String providerName;
  final String providerImage;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.duration,
    required this.category,
    required this.location,
    required this.price,
    required this.originalPrice,
    required this.providerName,
    required this.providerImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 204,
      height: 330,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffF97316), size: 20),
                  const SizedBox(width: 5),
                  Text(
                    rating,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  _dot(),
                  const SizedBox(width: 5),
                  Text(
                    duration,
                    style: const TextStyle(
                      color: Color(0xff475569),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  _dot(),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Color(0xff475569),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                location,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$$price  ",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\$$originalPrice",
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                color: Colors.grey.withValues(alpha: 0.5),
                height: 1,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(providerImage)),
                  const SizedBox(width: 5),
                  Text(
                    providerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot() => Container(
    width: 5,
    height: 5,
    decoration: const BoxDecoration(
      color: Color(0xff475569),
      shape: BoxShape.circle,
    ),
  );
}
