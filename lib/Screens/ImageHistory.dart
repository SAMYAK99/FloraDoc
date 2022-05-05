import 'package:flutter/material.dart';
import 'package:sih/utils/navigationDrawer.dart';

class ImageHistory extends StatefulWidget {
  @override
  _ImageHistoryState createState() => _ImageHistoryState();
}

class _ImageHistoryState extends State<ImageHistory> {
  List<CategorieModel> categories = List<CategorieModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Diseases History',
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: height * 0.8,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      imageAssetUrl: categories[index].imageAssetUrl,
                      categoryName: categories[index].categorieName,
                      condition: categories[index].condition,
                      date: categories[index].date,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategorieModel {
  String imageAssetUrl;
  String categorieName;
  String condition;
  String date;
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName, condition, date;

  CategoryCard(
      {this.imageAssetUrl, this.categoryName, this.condition, this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //     builder: (context) => CategoryNews(
        //       newsCategory: categoryName.toLowerCase(),
        //     )
        // )
        //
        // );
      },
      child: Container(
        margin: EdgeInsets.only(right: 5, bottom: 20, left: 5),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  imageAssetUrl,
                  height: 180,
                  width: 500,
                  fit: BoxFit.cover,
                )),
            Container(
                alignment: Alignment.center,
                height: 180,
                width: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      categoryName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      condition,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      date,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

List<CategorieModel> getCategories() {
  List<CategorieModel> myCategories = List<CategorieModel>();
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Apple Black Rot";
  categorieModel.imageAssetUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjZhbMsvw-xKFS78P0FPEbz9qHEhf1-JjvRQ&usqp=CAU";
  categorieModel.condition = "Partially Diseased";
  categorieModel.date = "14/02/2022";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "BlueBerry Healthy";
  categorieModel.imageAssetUrl =
      "https://cpb-us-e1.wpmucdn.com/blogs.cornell.edu/dist/2/7303/files/2020/09/drought_2.jpg";
  categorieModel.condition = "Healthy";
  categorieModel.date = "12/03/2022";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Maize Common Rust";
  categorieModel.imageAssetUrl =
      "https://cals.cornell.edu/sites/default/files/styles/three_card_callout/public/2021-02/commrust2-9-400x267.gif?h=a61266fd&itok=6PGKkhmQ";
  categorieModel.condition = "Diseased";
  categorieModel.date = "04/02/2022";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Tomato Leaf mold";
  categorieModel.imageAssetUrl =
      "https://vegcropshotline.org/wp-content/uploads/2016/02/607-155-0.jpg";
  categorieModel.condition = "Diseased";
  categorieModel.date = "14/02/2022";
  myCategories.add(categorieModel);

  return myCategories;
}
