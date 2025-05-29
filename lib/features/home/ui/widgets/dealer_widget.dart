import 'package:flutter/material.dart';
import '../../data/car_dealer_data.dart';

class DealerWidget extends StatelessWidget {
  final CarDealer dealer;

  const DealerWidget({super.key, required this.dealer});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width / 1.5 - 20;

    return SizedBox(
      width: cardWidth,
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        dealer.logoPath,
                        width: 46,
                        height: 46,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              /// Dealer name section
                              Expanded(
                                child: Text(
                                  dealer.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              /// Verified icon section
                              if (dealer.isVerified)
                                const Icon(
                                  Icons.verified,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                            ],
                          ),

                          /// Total cars info section
                          Text.rich(
                            TextSpan(
                              text: 'Total Cars ',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: dealer.totalCars.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                const Divider(thickness: 0.3, indent: 12, endIndent: 12),
                const SizedBox(height: 10),

                /// Phone Number section
                Row(
                  children: [
                    const Icon(Icons.phone, size: 14, color: Colors.blue),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        dealer.phone,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// Address section
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.blue),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        dealer.address,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
