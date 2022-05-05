import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'Details.dart';

class ArticleData extends StatefulWidget {
  var data;

  ArticleData(this.data);

  @override
  _ArticleDataState createState() => _ArticleDataState();
}

class _ArticleDataState extends State<ArticleData> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final formatter = DateFormat('hh:mm a  •  dd MMM yyyy');
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      widget.data,
                      index,
                    ),
                  ),
                );
              },
              child: Container(
                  margin: EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                spreadRadius: 1)
                          ]),
                      height: height * 0.15,
                      margin: EdgeInsets.only(
                          bottom: height * 0.01,
                          top: height * 0.01,
                          left: width * 0.01,
                          right: width * 0.01),
                      child: Row(children: [
                        Container(
                          width: width * 0.3,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    widget.data[index]['urlToImage'] != null
                                        ? widget.data[index]['urlToImage']
                                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSojwMMYZgtiupM4Vzdb5iBeE4b0Mamf3AgrxQJR19Xa4oIWV5xun9a02Ggyh4bZAurP_c&usqp=CAU",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              child: SizedBox(
                                width: width * 0.6,
                                child: Text(
                                  widget.data[index]['title'] == null
                                      ? 'Breaking News'
                                      : widget.data[index]['title'],
                                  style: GoogleFonts.merriweather(
                                    textStyle: TextStyle(
                                        letterSpacing: .2,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                child:
                                    (widget.data[index]['publishedAt'] == null)
                                        ? CircularProgressIndicator()
                                        : Text(
                                            "🕓 " +
                                                formatter.format(DateTime.parse(
                                                    widget.data[index]
                                                        ['publishedAt'])),
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          )),
                            (widget.data[index]['source']['name'] == null)
                                ? CircularProgressIndicator()
                                : Text(
                                    " " + widget.data[index]['source']['name'],
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black54
                                          : Colors.white54,
                                      fontSize: 12,
                                    ),
                                  ),
                          ],
                        )
                      ]))));
        },
      ),
    );
  }
}
