import 'package:flutter/material.dart';
import 'package:telas/pages/widgets/image_galery.dart';
import 'package:telas/pages/widgets/web_view.dart';
import 'package:telas/utils/constants.dart';

String getThumbFromYoutube(String videoUrl){

  //https://img.youtube.com/vi/qomLSfhmZI8/maxresdefault.jpg
  //https://www.youtube.com/watch?v=TQXHgE2sCF4
  //https://www.youtube.com/watch?v=UkM-FjfN6Mc&list=RDUkM-FjfN6Mc&start_radio=1&t=0

  var u = videoUrl.split("?")[1];
  u = u.split("&")[0];
  u = u.replaceAll("v=", "").replaceAll("V=", "");

  return "https://img.youtube.com/vi/$u/maxresdefault.jpg";
}

class DetailGalery extends StatelessWidget {
  final dynamic product;

  List<String> flatImageList = [];
  DetailGalery(this.product){

    if ((product["mediaList"] as List).length > 0){

      for(int i=0; i<= (product["mediaList"] as List).length -1; i++){
        flatImageList.add(product["mediaList"][i]["url"]);
      }

    }

  }

  


  _playVideo(context, url) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WebView(url: url);
        });
  }

  _onShowGallery(context, [index = 0]) {

    var images = flatImageList;
    images.removeWhere((item) => item.contains("youtube.com"));

    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return ImageGalery(images: images, index: index);
        });
  }

  

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width * 0.31;

    

    if (flatImageList.length < kMinItensOnGalery) return Container();

    return Container(
      height: dimension * 0.8 + 8,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 4.0),
            
            for (var i = 1; i < flatImageList.length; i++)              
              (flatImageList[i].contains("youtube"))
                ? InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Container(                      
                        width: dimension,
                        height: dimension * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(getThumbFromYoutube(flatImageList[i])),
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop)
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.play_circle_outline,
                              size: 40,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Vídeo",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () => _playVideo(context,flatImageList[i]),
                  )
                : GestureDetector(
                    onTap: () => _onShowGallery(context, i),
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Image.network(
                        flatImageList[i],
                        height: dimension * 0.8,
                        width: dimension,                    
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
          
          ],
        ),
      ),
    );
  }
}
