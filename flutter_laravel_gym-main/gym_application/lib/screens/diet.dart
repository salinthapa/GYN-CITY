/**
* This is the diet screen where all the diet related stuff will be displayed.
* three types of diet are available.
* different diet will be displayed based on the selection.
 */
import 'package:flutter/material.dart';
import 'package:gymapplication/api/api.dart';

import 'package:gymapplication/constants/Theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

//widgets
import 'package:gymapplication/widgets/drawer.dart';
import 'package:gymapplication/widgets/navbar.dart';

import 'package:gymapplication/widgets/card-category.dart';
import 'package:gymapplication/widgets/card-square.dart';

import 'package:coupon_uikit/coupon_uikit.dart';

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final Map<String, Map<String, dynamic>> articlesCards = {
  "Content": {
    "title": "View gym",
    "image":
        "https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=853&q=80",
  }
};

final Map<String, Map<String, dynamic>> weightLossDiet = {
  "Sunday": {
    "day": "Sunday",
    "breakfast": "scrambled egg with spinach and tomato",
    "lunch": "tuna salad with lettuce, cucumber, and tomato",
    "dinner": "bean chili with cauliflower 'rice'",
  },
  "Monday": {
    "day": "Monday",
    "breakfast": "oatmeal with blueberries, milk, and seeds",
    "lunch": "hummus and vegetable wrap",
    "dinner": "sesame salmon, purple sprouting broccoli, and sweet potato mash",
  },
  "Tuesday": {
    "day": "Tuesday",
    "breakfast": "mashed avocado and a fried egg on a slice of rye toast",
    "lunch": "broccoli quinoa and toasted almonds",
    "dinner": "chicken stir fry and soba noodles",
  },
  "Wednesday": {
    "day": "Wednesday",
    "breakfast": "smoothie made with protein powder, berries, and oat milk",
    "lunch": "chicken salad with lettuce and corn",
    "dinner": "roasted Mediterranean vegetables, lentils, and tahini dressing",
  },
  "Thursday": {
    "day": "Thursday",
    "breakfast": "smoothie made with protein powder, berries, and oat milk",
    "lunch": "chicken salad with lettuce and corn",
    "dinner": "roasted Mediterranean vegetables, lentils, and tahini dressing",
  },
  "Friday": {
    "day": "Friday",
    "breakfast": "apple slices with peanut butter",
    "lunch": "minted pea and feta omelet",
    "dinner": "baked sweet potato, chicken breast, greens	",
  },
  "Saturday": {
    "day": "Saturday",
    "breakfast": "breakfast muffin with eggs and vegetables",
    "lunch": "crispy tofu bowl",
    "dinner": "lentil Bolognese with zucchini noodles	",
  },
};

final Map<String, Map<String, dynamic>> weightGainDiet = {
  "Sunday": {
    "day": "Sunday",
    "breakfast": "Peanut Butter on Wholegrain Toast",
    "lunch": "Chicken and Pasta Salad",
    "dinner": "Lamb Chops and Vegetables",
  },
  "Monday": {
    "day": "Monday",
    "breakfast": "Chia Porridge with Fruit",
    "lunch": "Egg, Cheese, and Salad Wrap",
    "dinner": "Baked Salmon, Cous Cous and Vegetables",
  },
  "Tuesday": {
    "day": "Tuesday",
    "breakfast": "Sweet Potato Spanish Omelette",
    "lunch": "Lentil, Vegetables and Barley Soup",
    "dinner": "Spaghetti Bolognese",
  },
  "Wednesday": {
    "day": "Wednesday",
    "breakfast": "Wholegrain Cereal with Milk and Fruit",
    "lunch": "Chicken and Noodle Stir-fry",
    "dinner": "Nasi Goreng Tray Bake",
  },
  "Thursday": {
    "day": "Thursday",
    "breakfast": "Poached Eggs with Sauteed Field Mushroom and Avocado",
    "lunch": "Fish and Chips",
    "dinner": "Mango Chicken and Corn",
  },
  "Friday": {
    "day": "Friday",
    "breakfast": "Fruit Toast with Berry Smoothie",
    "lunch": "Tuna and Quinoa Salad",
    "dinner": "Easy Fish Pie",
  },
  "Saturday": {
    "day": "Saturday",
    "breakfast": "Bechamel Spinach Baked Egg",
    "lunch": "Beef and Noodle Soup",
    "dinner": "Pork Roast and Vegetables",
  },
};

final Map<String, Map<String, dynamic>> muscularDiet = {
  "Sunday": {
    "day": "Sunday",
    "breakfast": "scrambled egg with spinach and tomato",
    "lunch": "tuna salad with lettuce, cucumber, and tomato",
    "dinner": "bean chili with cauliflower 'rice'",
  },
  "Monday": {
    "day": "Monday",
    "breakfast": "oatmeal with blueberries, milk, and seeds",
    "lunch": "hummus and vegetable wrap",
    "dinner": "sesame salmon, purple sprouting broccoli, and sweet potato mash",
  },
  "Tuesday": {
    "day": "Tuesday",
    "breakfast": "mashed avocado and a fried egg on a slice of rye toast",
    "lunch": "broccoli quinoa and toasted almonds",
    "dinner": "chicken stir fry and soba noodles",
  },
  "Wednesday": {
    "day": "Wednesday",
    "breakfast": "smoothie made with protein powder, berries, and oat milk",
    "lunch": "chicken salad with lettuce and corn",
    "dinner": "roasted Mediterranean vegetables, lentils, and tahini dressing",
  },
  "Thursday": {
    "day": "Thursday",
    "breakfast": "Poached Eggs with Sauteed Field Mushroom and Avocado",
    "lunch": "Fish and Chips",
    "dinner": "Mango Chicken and Corn",
  },
  "Friday": {
    "day": "Friday",
    "breakfast": "Fruit Toast with Berry Smoothie",
    "lunch": "Tuna and Quinoa Salad",
    "dinner": "Easy Fish Pie",
  },
  "Saturday": {
    "day": "Saturday",
    "breakfast": "Bechamel Spinach Baked Egg",
    "lunch": "Beef and Noodle Soup",
    "dinner": "Pork Roast and Vegetables",
  },
};

class Diet extends StatefulWidget {
  Diet({Key key}) : super(key: key);

  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  String day;
  @override
  void initState() {
    super.initState();
    var date = DateTime.now();

    print(DateFormat('EEEE').format(date));
    day = DateFormat('EEEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Navbar(
          title: "Diets",
          rightOptions: false,
        ),
        backgroundColor: NowUIColors.bgColorScreen,
        drawer: NowDrawer(currentPage: "Diet"),
        body: Container(
            padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 32),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 32),
                  ),
                  CardCategory(
                      title: day + "\nToday's Diets",
                      pic: articlesCards["Content"]["image"]),
                  Center(child: Text('Today\'s Diet to Lose Weight')),
                  Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: const Icon(Icons.fastfood),
                                title: Text(weightLossDiet[day]["day"]),
                                subtitle: Text('Breakfast: ' +
                                    weightLossDiet[day]["breakfast"] +
                                    '\n' +
                                    'Lunch: ' +
                                    weightLossDiet[day]["lunch"] +
                                    '\n'
                                        'Dinner: ' +
                                    weightLossDiet[day]["dinner"] +
                                    '\n'),
                                isThreeLine: true,
                              ),
                            );
                          })),
                  SizedBox(height: 8.0),
                  Center(child: Text('Today\'s Diet to Gain Weight')),
                  Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: const Icon(Icons.fastfood),
                                title: Text(weightGainDiet[day]["day"]),
                                subtitle: Text('Breakfast: ' +
                                    weightGainDiet[day]["breakfast"] +
                                    '\n' +
                                    'Lunch: ' +
                                    weightGainDiet[day]["lunch"] +
                                    '\n'
                                        'Dinner: ' +
                                    weightGainDiet[day]["dinner"] +
                                    '\n'),
                                isThreeLine: true,
                              ),
                            );
                          })),
                  SizedBox(height: 8.0),
                  Center(child: Text('Today\'s Diet to Build Muscle')),
                  Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: const Icon(Icons.fastfood),
                                title: Text(muscularDiet[day]["day"]),
                                subtitle: Text('Breakfast: ' +
                                    muscularDiet[day]["breakfast"] +
                                    '\n' +
                                    'Lunch: ' +
                                    muscularDiet[day]["lunch"] +
                                    '\n'
                                        'Dinner: ' +
                                    muscularDiet[day]["dinner"] +
                                    '\n'),
                                isThreeLine: true,
                              ),
                            );
                          })),
                  SizedBox(height: 8.0),
                ],
              ),
            )));
  }
}
