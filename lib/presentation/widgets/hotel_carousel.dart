import 'package:flutter/material.dart';
import '../../data/models/hotel_model.dart';

class HotelCarousel extends StatefulWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  State<HotelCarousel> createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        itemBuilder: (BuildContext context, index) {
          Hotel hotel = hotels[index];
          return Container(
            margin: EdgeInsets.all(0),
            width: 250.0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 15.0,
                  child: Container(
                    height: 120.0,
                    width: 240.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 236, 236),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            hotel.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            hotel.address,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            '\$${hotel.price} / night',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 160.0,
                          width: 190.0,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
