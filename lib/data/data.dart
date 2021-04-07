// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:travel_application/model/city_model.dart';
import 'package:travel_application/model/popular_tourmodel.dart';

// ignore: non_constant_identifier_names
List<CityModel> getCity() {
  List<CityModel> city = [];

  CityModel cityModel = new CityModel(
      name: 'Ah',
      rating: 4,
      imgData:
          "https://media.easemytrip.com/media/Blog/India/637311026572271481/637311026572271481F00gbD.png");
  //1
  cityModel.name = "Ahemdabad";
  cityModel.rating = 4.5;
  cityModel.imgData =
      "https://www.fabhotels.com/blog/wp-content/uploads/2018/11/1000x650-98.jpg";
  //"https://www.treebo.com/blog/wp-content/uploads/2018/02/Jama-Masjid-1.jpg";
  city.add(cityModel);

  cityModel = new CityModel(name: '', rating: 4.4, imgData: '');
  //2
  cityModel.name = "Vadodara";
  cityModel.rating = 4.3;
  cityModel.imgData =
      "https://www.holidify.com/images/cmsuploads/compressed/Lakshmi_Vilas_Palace,_Vadodara_20190903150759.jpg";
  city.add(cityModel);

  cityModel = new CityModel(name: '', rating: 10, imgData: '');
//3
  cityModel.name = "Surat";
  cityModel.rating = 4.6;
  cityModel.imgData =
      "https://res.cloudinary.com/ch/hbimages/desktop/1499170904691-ubharat-beach-surat.jpg";
  city.add(cityModel);

  cityModel = new CityModel(name: '', rating: 10, imgData: '');

//4
  cityModel.name = "Gandhinagar";
  cityModel.rating = 4.4;
  cityModel.imgData =
      "https://akshardham.com/gujarat/wp-content/uploads/2017/07/fact-figures-MMCL1054.jpg";
  //  "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  city.add(cityModel);

  cityModel = new CityModel(name: '', rating: 10, imgData: '');
//5
  cityModel.name = "Rajkot";
  cityModel.rating = 4.1;
  cityModel.imgData =
      "https://img.traveltriangle.com/blog/wp-content/uploads/2018/05/cover-3.jpg";
  city.add(cityModel);

  cityModel = new CityModel(name: '', rating: 10, imgData: '');
//6
  cityModel.name = "Kutch";
  cityModel.rating = 4.7;
  cityModel.imgData =
      "https://www.tripsavvy.com/thmb/-9NUewvfi5ahMwuTgPGf2dcOqyc=/950x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-537000923-541774dbe2d44759815fdf0719b04685.jpg";
  city.add(cityModel);
  cityModel = new CityModel(name: '', rating: 10, imgData: '');

  return city;
}

List<PopularTourModel> getPopularTours() {
  List<PopularTourModel> popularTourModels = [];
  PopularTourModel popularTourModel =
      new PopularTourModel(imgUrl: '', rating: 10, desc: '', title: '');

//1
  popularTourModel.imgUrl =
      "https://amritsarworld.com/wp-content/uploads/2018/11/sardar_patel_statue_of-unity-inauguration-kzdC-621x414@LiveMint.jpg";
  // "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Statue of Unity";
  popularTourModel.desc = "Massive Sardar Vallabhbhai Patel Statue";
  popularTourModel.rating = 4.6;
  popularTourModels.add(popularTourModel);
  popularTourModel =
      new PopularTourModel(imgUrl: '', rating: 10, desc: '', title: '');

//1
  popularTourModel.imgUrl =
      "https://t1.gstatic.com/images?q=tbn:ANd9GcT_OVObGZbhZqKuSIGPfnH1pAyO3eA0hg2-U3bQLfGQQHfOKcfM-TJ6CkVpBw1fvws7_ZJFxBO2Lg8vWWiCC0nZQA";
  // "https://images.pexels.com/photos/1658967/pexels-photo-1658967.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Gir National Park";
  popularTourModel.desc = "Devalia Safari Park & Kamleshwar Dam";
  popularTourModel.rating = 4.5;
  popularTourModels.add(popularTourModel);

  popularTourModel =
      new PopularTourModel(imgUrl: '', rating: 10, desc: '', title: '');

//1
  popularTourModel.imgUrl =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Rani_ki_vav1.jpg/800px-Rani_ki_vav1.jpg";
  //"https://images.pexels.com/photos/1477430/pexels-photo-1477430.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Rani ki Vav";
  popularTourModel.desc = "Ornate stepwell with a storied history";
  popularTourModel.rating = 4.2;
  popularTourModels.add(popularTourModel);

  popularTourModel =
      new PopularTourModel(imgUrl: '', rating: 10, desc: '', title: '');

//1
  popularTourModel.imgUrl =
      "https://blog.weekendthrill.com/wp-content/uploads/2017/12/121117_0838_21Placestov16.jpg";
  //"https://images.pexels.com/photos/1743165/pexels-photo-1743165.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Mandvi Beach";
  popularTourModel.desc = "Scenic beach for water sports & sunsets";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel =
      new PopularTourModel(imgUrl: '', rating: 10, desc: '', title: '');

//1
  popularTourModel.imgUrl =
      "https://miro.medium.com/max/1458/1*pxExEvSkKgVRvpGoVyncAA.jpeg";
  //"https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Champaner-Pavagadh";
  popularTourModel.desc = "Ancient city ruins & archaeological site";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel =
      new PopularTourModel(imgUrl: '', rating: 10, desc: '', title: '');

//1
  popularTourModel.imgUrl =
      "https://res.cloudinary.com/samacharlive/image/upload/v1498826950/Lifestyle/image/dumas-beach.jpg";
  popularTourModel.title = "Dumas Beach";
  popularTourModel.desc = "Lively beach with a temple & snack shops";
  popularTourModel.rating = 4.0;
  popularTourModels.add(popularTourModel);
  popularTourModel =
      new PopularTourModel(imgUrl: '', rating: 10, desc: '', title: '');

  return popularTourModels;
}
