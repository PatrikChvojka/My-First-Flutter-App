import 'package:flutter/material.dart';
import '../../data/models/banner_model.dart';
import 'package:http/http.dart' as http;
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({Key? key}) : super(key: key);
  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      height: 210.0,
      child: FutureBuilder<List<FrontBanner>>(
        future: fetchAlbum(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
/*
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        itemBuilder: (BuildContext context, index) {
          FrontBanner banner = banners[index];
          return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            width: 250.0,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(196, 148, 70, 0.1),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(-3, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    height: 120.0,
                    width: 240.0,
                    image: AssetImage(banner.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        banner.name,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        banner.description,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: style.MainAppStyle().secondColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),*/
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<FrontBanner> photos;

  @override
  Widget build(BuildContext context) {
    /* return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].imageUrl);
      },
    );*/

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: photos.length,
      itemBuilder: (BuildContext context, index) {
        FrontBanner banner = photos[index];
        return Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          width: 250.0,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(196, 148, 70, 0.1),
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(-3, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  height: 120.0,
                  width: 240.0,
                  banner.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      banner.name,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      banner.description,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: style.MainAppStyle().secondColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
