import 'package:flutter/material.dart';
import './widget/home_header.dart';
import './widget/promo_card.dart';
import './widget/product_card.dart';
import './widget/category_list.dart';
import './widget/clothes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Dresses';

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          children: [
            const HomeHeader(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: WelcomeText(),
            ),
            const SizedBox(height: 10),
            const PromoBannerSection(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Arrival',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('View All', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ProductCard(
                    imagePath: 'assets/images/offwhite.png',
                    name: 'Roller Rabbit',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/nike_shoes.png',
                    name: 'endless rose',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/bag_promo.png',
                    name: 'Nike T-Shirt',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CategoryList(
              onSelected: onCategorySelected,
              selected: selectedCategory,
            ),
            const SizedBox(height: 20),
            TopDresses(selectedCategory: selectedCategory),
          ],
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Welcome,",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Our Fashions App",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class PromoBannerSection extends StatefulWidget {
  const PromoBannerSection({super.key});

  @override
  State<PromoBannerSection> createState() => _PromoBannerSectionState();
}

class _PromoBannerSectionState extends State<PromoBannerSection> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final promoList = [
      const PromoCard(
        discountText: "50% Off",
        subtitle: "On everything today",
        code: "FSCREATION",
        imagePath: "assets/images/bag_promo.png",
      ),
      const PromoCard(
        discountText: "70% Off",
        subtitle: "On every item",
        code: "EXTRA70",
        imagePath: "assets/images/bag_promo.png",
      ),
      const PromoCard(
        discountText: "Buy 1 Get 1",
        subtitle: "Selected items only",
        code: "BUY1FREE1",
        imagePath: "assets/images/bag_promo.png",
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: _pageController,
            itemCount: promoList.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: promoList[index],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            promoList.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.black
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
