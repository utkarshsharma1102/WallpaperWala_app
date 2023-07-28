import 'package:flutter/material.dart';
import 'package:wallpaper_wala/controller/operationapi.dart';
import 'package:wallpaper_wala/model/modelphotos.dart';
import 'package:wallpaper_wala/view/screens/search.dart';
import 'package:wallpaper_wala/view/widgets/categoryBlock.dart';
import 'package:wallpaper_wala/view/widgets/customappbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ModelPhotos> trendingWallList;

  GetTrendingWAllpapers() async {
    trendingWallList = await OperationApi.getTrendingWallpapers();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetTrendingWAllpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: SearchBar(),
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: ((context, index) => const CategoryBlock())),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 2550,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 300,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: trendingWallList.length,
                  itemBuilder: ((context, index) => SizedBox(
                        height: 800,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              height: 800,
                              width: 50,
                              fit: BoxFit.cover,
                              trendingWallList[index].imgSrc),
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Wallpapers",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchScreen(query: _searchController.text)));
              },
              child: Icon(Icons.search))
        ],
      ),
    );
  }
}
