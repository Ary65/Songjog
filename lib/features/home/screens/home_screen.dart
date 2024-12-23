import 'package:flutter/material.dart';
import 'package:songjog/constants/colors.dart';
import 'package:songjog/features/home/widgets/slider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CarouselSlider(),
            Column(
              children: [
                // Header Section with image and text

                // Grid Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return MenuItemWidget(
                        icon: menuItems[index]['icon'],
                        label: menuItems[index]['label'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItemWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primaryColor.withOpacity(.1),
          child: Icon(
            icon,
            size: 30,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

// Sample Menu Items
final List<Map<String, dynamic>> menuItems = [
  {'icon': Icons.local_hospital, 'label': 'হাসপাতাল'},
  {'icon': Icons.directions_bus, 'label': 'বাসের সময়সূচি'},
  {'icon': Icons.train, 'label': 'ট্রেনের সময়সূচি'},
  {'icon': Icons.place, 'label': 'দর্শনীয় স্থান'},
  {'icon': Icons.home, 'label': 'বাসা ভাড়া'},
  {'icon': Icons.shopping_bag, 'label': 'শপিং'},
  {'icon': Icons.local_fire_department, 'label': 'ফায়ার সার্ভিস'},
  {'icon': Icons.local_police, 'label': 'থানা- পুলিশ'},
  {'icon': Icons.web, 'label': 'ওয়েবসাইট'},
  {'icon': Icons.electric_bolt, 'label': 'বিদ্যুৎ অফিস'},
  {'icon': Icons.computer, 'label': 'ডায়াগনস্টিক'},
  {'icon': Icons.bloodtype, 'label': 'রক্ত'},
  {'icon': Icons.hotel, 'label': 'হোটেল'},
  {'icon': Icons.car_rental, 'label': 'গাড়ি ভাড়া'},
  {'icon': Icons.work, 'label': 'চাকরি'},
  {'icon': Icons.business, 'label': 'উদ্যোক্তা'},
  {'icon': Icons.school, 'label': 'শিক্ষক'},
  {'icon': Icons.person, 'label': 'পাল্লার'},
  {'icon': Icons.restaurant, 'label': 'রেস্টুরেন্ট'},
  {'icon': Icons.apartment, 'label': 'ফ্ল্যাট ও জমি'},
];
