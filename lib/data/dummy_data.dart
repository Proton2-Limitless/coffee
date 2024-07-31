import 'package:coffee/model/menu.dart';
import 'package:coffee/model/meals.dart';

const availableCategories = [
  MenuCategory(
      id: 'c1',
      title: 'Coffee',
      image:
          "https://cdn.pixabay.com/photo/2019/11/11/15/32/coffee-4618705_1280.jpg",
      description: "Freshly Brewed Coffee"),
  MenuCategory(
      id: 'c2',
      title: 'Breakfast',
      image:
          "https://cdn.pixabay.com/photo/2014/09/22/14/49/breakfast-456351_1280.jpg",
      description: "Hearty, hot & fresh"),
  MenuCategory(
    id: 'c3',
    title: 'Munchies',
    image:
        "https://cdn.pixabay.com/photo/2019/01/03/22/40/popcorn-3912111_1280.jpg",
    description: "Perfectly Baked Goodies",
  ),
  MenuCategory(
      id: 'c4',
      title: 'Lunch',
      image:
          "https://cdn.pixabay.com/photo/2023/03/21/20/32/set-table-7868140_1280.jpg",
      description: "Hearty, hot & fresh"),
  MenuCategory(
      id: 'c5',
      title: 'Fries',
      image:
          "https://cdn.pixabay.com/photo/2017/08/14/14/56/crisp-2640743_1280.jpg",
      description: "Fresh & Crispy"),
  MenuCategory(
      id: 'c6',
      title: 'Drinks',
      image:
          "https://cdn.pixabay.com/photo/2017/05/12/08/29/coffee-2306471_1280.jpg",
      description: "Healthy & Fresh"),
];

var dummyMeals = [
  Meal(
    id: "m1",
    categories: ['c1', 'c2'],
    title: "Espresso",
    subtitle: "Bold and Intense",
    affordability: Affordability.affordable,
    description:
        "A concentrated coffee beverage brewed by forcing hot water through finely-ground coffee beans. It has a rich and intense flavor with a velvety crema layer on top.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2019/11/11/15/32/coffee-4618705_1280.jpg",
    price: 5.3,
    rating: 4.3,
    temp: Temp.cold,
  ),
  Meal(
    id: "m2",
    categories: ['c1', 'c2'],
    title: "Cappuccino",
    subtitle: "Creamy and Balanced",
    affordability: Affordability.affordable,
    description:
        "A classic Italian coffee drink consisting of equal parts espresso, steamed milk, and milk foam. It has a creamy texture with a balanced flavor profile.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2017/08/07/22/57/coffee-2608864_1280.jpg",
    price: 12.3,
    rating: 3.3,
    temp: Temp.cold,
  ),
  Meal(
    id: "m3",
    categories: ['c1', 'c2'],
    title: "Latte",
    subtitle: "Smooth and Silky",
    affordability: Affordability.pricey,
    description:
        "A coffee beverage made with a shot of espresso and steamed milk, topped with a small amount of milk foam. It has a smooth and mellow flavor with a hint of sweetness.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2023/08/07/03/59/coffee-8174279_1280.jpg",
    price: 10.3,
    rating: 4.1,
    temp: Temp.hot,
  ),
  Meal(
    id: "m4",
    categories: ['c1'],
    title: "Americano",
    subtitle: "Robust and Versatile",
    affordability: Affordability.luxurious,
    description:
        "A diluted espresso drink made by adding hot water to a shot of espresso. It has a bold flavor similar to drip coffee but with the richness of espresso.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2017/07/27/17/19/ice-coffee-2546041_1280.jpg",
    price: 10,
    rating: 2.3,
    temp: Temp.hot,
  ),
  Meal(
    id: "m5",
    categories: ['c1'],
    title: "Macchiato",
    subtitle: "Bold with a Hint of Sweetness",
    affordability: Affordability.affordable,
    description:
        "An espresso-based coffee with a small amount of steamed milk or milk foam added, creating a layered look. It has a strong espresso flavor with a touch of creaminess.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2016/02/28/23/57/batten-1227812_1280.jpg",
    price: 11.5,
    rating: 1.7,
    temp: Temp.hot,
  ),
  Meal(
    id: "m6",
    categories: ['c1', 'c2'],
    title: "Mocha",
    subtitle: "Indulgent and Luxurious",
    affordability: Affordability.luxurious,
    description:
        "A decadent coffee beverage made with espresso, steamed milk, and chocolate syrup or cocoa powder, often topped with whipped cream. It combines the rich flavors of coffee and chocolate.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2017/03/02/17/41/mocha-2111932_1280.jpg",
    price: 20.5,
    rating: 4.7,
    temp: Temp.cold,
  ),
  Meal(
    id: "m7",
    categories: ['c2'],
    title: "Pancakes",
    subtitle: "A classic breakfast favorite.",
    affordability: Affordability.affordable,
    description:
        "Fluffy pancakes served with maple syrup and a side of fresh berries.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2017/09/19/08/52/pancake-2764589_1280.jpg",
    price: 1.5,
    rating: 4.7,
  ),
  Meal(
      id: "m8",
      categories: ['c2'],
      title: "Eggs Benedict",
      subtitle: "A decadent breakfast indulgence.",
      affordability: Affordability.luxurious,
      description:
          "Poached eggs atop toasted English muffins, topped with hollandaise sauce and served with crispy bacon.",
      imageUrl:
          "https://cdn.pixabay.com/photo/2018/10/22/14/56/breakfast-3765559_1280.jpg",
      price: 20.5,
      rating: 1.7),
  Meal(
    id: "m9",
    categories: ['c2'],
    title: "Avocado Toast",
    subtitle: "A nutritious and trendy breakfast choice.",
    affordability: Affordability.pricey,
    description:
        "Sliced avocado on toasted whole grain bread, garnished with cherry tomatoes and a sprinkle of feta cheese.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2021/02/13/11/05/toast-6011147_1280.jpg",
    price: 10.5,
    rating: 2.7,
  ),
  Meal(
      id: "m10",
      categories: ['c2'],
      title: "French Toast",
      subtitle: "A comforting breakfast classic.",
      affordability: Affordability.luxurious,
      description:
          "Thick slices of bread dipped in a mixture of eggs, milk, and cinnamon, then fried until golden brown and served with a dusting of powdered sugar.",
      imageUrl:
          "https://cdn.pixabay.com/photo/2020/11/21/08/46/french-toast-5763429_1280.jpg",
      price: 20.5,
      rating: 4.7),
  Meal(
    id: "m11",
    categories: ['c2'],
    title: "Greek Yogurt Parfait",
    subtitle: "A light and refreshing breakfast option.",
    affordability: Affordability.affordable,
    description:
        "Layers of creamy Greek yogurt, granola, and fresh fruit, drizzled with honey and sprinkled with nuts.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2015/03/30/12/45/parfait-698633_1280.jpg",
    price: 2.5,
    rating: 4.7,
  ),
  Meal(
    id: "m12",
    categories: ['c3'],
    title: "Nachos Supreme",
    subtitle: "A perfect appetizer for sharing.",
    affordability: Affordability.affordable,
    description:
        "Crispy tortilla chips topped with melted cheese, jalapenos, sour cream, guacamole, and salsa.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2016/02/16/11/48/nachos-1203214_1280.jpg",
    price: 2.2,
    rating: 4.7,
  ),
  Meal(
    id: "m13",
    categories: ['c3'],
    title: "Chicken Wings",
    subtitle: "A classic game day snack.",
    affordability: Affordability.luxurious,
    description:
        "Crispy fried chicken wings tossed in your choice of sauce, served with celery sticks and blue cheese dressing.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2022/01/18/08/43/wings-6946618_1280.jpg",
    price: 8.5,
    rating: 3.7,
  ),
  Meal(
      id: "m14",
      categories: ['c3'],
      title: "Mozzarella Sticks",
      subtitle: "Irresistibly cheesy finger food.",
      affordability: Affordability.affordable,
      description:
          "Breaded and fried mozzarella cheese sticks served with marinara sauce for dipping.",
      imageUrl:
          "https://cdn.pixabay.com/photo/2016/08/19/16/51/tomato-salad-1605697_1280.jpg",
      price: 0.8,
      rating: 4.0),
  Meal(
    id: "m15",
    categories: ['c3', 'c5'],
    title: "Loaded Potato Skins",
    subtitle: "A hearty and satisfying snack.",
    affordability: Affordability.affordable,
    description:
        "Crispy potato skins filled with melted cheese, bacon bits, sour cream, and chives.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2015/01/24/02/06/potatoes-609661_1280.jpg",
    price: 2.5,
    rating: 2.7,
  ),
  Meal(
    id: "m16",
    categories: ['c4'],
    title: "Grilled Chicken Caesar Salad",
    subtitle: "A lighter option for lunch.",
    affordability: Affordability.luxurious,
    description:
        "Grilled chicken breast served over crisp romaine lettuce with Caesar dressing, croutons, and Parmesan cheese.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2014/01/17/08/56/caesar-246818_1280.jpg",
    price: 10.2,
    rating: 3.8,
  ),
  Meal(
    id: "m17",
    categories: ['c4'],
    title: "Classic BLT Sandwich",
    subtitle: "A timeless favorite.",
    affordability: Affordability.affordable,
    description:
        "Crispy bacon, fresh lettuce, and ripe tomatoes served on toasted bread with mayonnaise.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2015/03/28/19/58/sandwich-696417_1280.jpg",
    price: 2.5,
    rating: 4.7,
  ),
  Meal(
    id: "m18",
    categories: ['c4'],
    title: "Vegetable Stir-Fry",
    subtitle: "A healthy and flavorful lunch choice.",
    affordability: Affordability.luxurious,
    description:
        "Fresh vegetables stir-fried in a savory sauce, served over steamed rice.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2011/05/25/14/49/fry-up-7627_1280.jpg",
    price: 20.5,
    rating: 4.7,
  ),
  Meal(
    id: "m19",
    categories: ['c5'],
    title: "Garlic Parmesan Fries",
    subtitle: "A gourmet twist on classic fries.",
    affordability: Affordability.luxurious,
    description:
        "Crispy French fries tossed in garlic butter and Parmesan cheese, sprinkled with parsley.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2013/06/16/13/53/garlic-139659_1280.jpg",
    price: 20.5,
    rating: 4.7,
  ),
  Meal(
    id: "m20",
    categories: ['c5'],
    title: "Sweet Potato Fries",
    subtitle: "A tasty alternative to regular fries",
    affordability: Affordability.luxurious,
    description:
        "Thinly sliced sweet potatoes, lightly seasoned and baked until crispy.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2016/01/26/00/53/potatoe-1161819_1280.jpg",
    price: 20.5,
    rating: 4.7,
  ),
  Meal(
    id: "m21",
    categories: ['c6', 'c1'],
    title: "Iced Caramel Macchiato",
    subtitle: "A refreshing coffee treat.",
    affordability: Affordability.luxurious,
    description:
        "Espresso and milk poured over ice, sweetened with caramel syrup and topped with whipped cream.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2015/06/28/19/38/iced-coffee-824818_1280.jpg",
    price: 20.5,
    rating: 4.7,
    temp: Temp.cold,
  ),
  Meal(
    id: "m22",
    categories: ['c6'],
    title: "Mango Tango Smoothie",
    subtitle: "A tropical delight in a glass.",
    affordability: Affordability.luxurious,
    description:
        "A blend of ripe mangoes, yogurt, and orange juice, served chilled.",
    imageUrl:
        "https://cdn.pixabay.com/photo/2023/07/11/00/02/mango-smoothie-8119280_1280.jpg",
    price: 20.5,
    rating: 4.7,
  ),
];
