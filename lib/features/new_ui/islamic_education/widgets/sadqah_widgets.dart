// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/islamic_education/ui/sadqah_ui.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class ProjectModel {
  final String title;
  final String description;
  final String shortDescription;
  final String imageUrl;
  final double price;
  final int donors;
  final int? amountRaised;
  final double progressPercent;
  final bool isNew;
  final bool isSelected;

  ProjectModel({
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.imageUrl,
    required this.price,
    required this.donors,
    this.amountRaised,
    required this.progressPercent,
    this.isNew = false,
    this.isSelected = false,
  });
}

class BasketItem {
  final ProjectModel project;
  int quantity;

  BasketItem({
    required this.project,
    required this.quantity,
  });
}


Widget buildTabButton(String text, {bool isActive = false}) {
  return Expanded(
    child: InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? Color(0xFF1A4D3D) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? Color(0xFF1A4D3D) : Colors.grey[600],
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}

class CartDonation extends StatefulWidget {
  CartDonation({super.key, required this.basketItems, required this.totalAmount});
  List<BasketItem> basketItems;
  double totalAmount;
  @override
  State<CartDonation> createState() => CartDonationState();
}

class CartDonationState extends State<CartDonation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColor.buttonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Donation Basket',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Tabs
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                buildTabButton('Basket', isActive: true),
                buildTabButton('Dedication'),
                buildTabButton('Payment'),
              ],
            ),
          ),

          // Basket items
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                ...widget.basketItems.map((item) => buildBasketItem(item, setState)).toList(),
                SizedBox(height: 20),

                // Summary
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal'),
                          Text('AED ${widget.totalAmount.toStringAsFixed(0)}'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(height: 1, color: Colors.grey[300]),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'AED ${widget.totalAmount.toStringAsFixed(0)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Recurring toggle
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: AppColor.greyLight1(),
                        trackOutlineColor: WidgetStatePropertyAll(AppColor.greyLight1()),
                        value: false,
                        onChanged: (value) {},
                        activeColor: Color(0xFF1A4D3D),
                        activeTrackColor: Color(0xFF1A4D3D).withOpacity(0.5),
                      ),
                    ),
                    Text(
                      'Make this a monthly recurring donation',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Certificate option
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.card_membership,
                            color: Color(0xFFD9A65E),
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Digital Certificate',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Receive a digital certificate for your donation that you can share with your loved ones.',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: Color(0xFF1A4D3D),
                          ),
                          Text(
                            'Generate certificate',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Certificate preview will appear here',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontStyle: FontStyle.italic,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                // Share options
                Row(
                  children: [
                    Expanded(child: CustomElevatedButton(onPressed: () {},iconData: Icons.share,iconHeight: 15,bgColor: Colors.green,height: 35,iconColor: Colors.white,text: 'WhatsApp')),
                    SizedBox(width: 10),
                    Expanded(child: CustomElevatedButton(onPressed: () {},bgColor: Color(0xFF3498db),iconData: Icons.email,iconHeight: 15,height: 35,iconColor: Colors.white,text: 'Email')),

                  ],
                ),
              ],
            ),
          ),

          // Footer
          Container(
              margin: EdgeInsets.all(16),
              child: CustomElevatedButton(onPressed: (){}, text: "Complete Donation")),
          
        ],
      ),
    );
  }
}


Widget buildBasketItem(BasketItem item, StateSetter setState) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
    ),
    child: Row(
      children: [
        // Item image
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(item.project.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(width: 15),

        // Item details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.project.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 3),
              Text(
                '${item.quantity} × AED ${item.project.price}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        // Remove button
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.close,
              color: Colors.red[400],
              size: 18,
            ),
          ),
        ),
      ],
    ),
  );
}


Widget buildIntroText() {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
    child: Text(
      'Sadaqah Jariyah is a special form of charity in Islam that continues to benefit you or your loved ones even after death. By establishing ongoing charitable projects, you create a source of continuous rewards that flow to the Hereafter.'.tr(),
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 15,
        height: 1.6,
      ),
    ),
  );
}


Widget buildBenefitsCard() {
  return Container(
    margin: EdgeInsets.fromLTRB(16, 0, 16, 24),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 15,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Benefits of Sadaqah for the Deceased:'.tr(),
          style: TextStyle(
            color: Color(0xFF1A4D3D),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        Divider(
          color: Color(0xFFEAE7E0),
          thickness: 1,
          height: 30,
        ),
        _buildBenefitItem(
          icon: Icons.security,
          color: Color(0xFF1A4D3D),
          text: 'Continuous reward (Jariyah) for the deceased',
        ),
        _buildBenefitItem(
          icon: Icons.home,
          color: Color(0xFFD9A65E),
          text: 'Ease the hardship of those in the grave',
        ),
        _buildBenefitItem(
          icon: Icons.favorite,
          color: Color(0xFF1A4D3D),
          text: 'Comforts the heart of the giver',
        ),
        _buildBenefitItem(
          icon: Icons.info,
          color: Color(0xFFD9A65E),
          text: 'Shows gratitude to Allah during difficult times',
        ),
        _buildBenefitItem(
          icon: Icons.book,
          color: Color(0xFF1A4D3D),
          text: 'Follows the Prophetic guidance in times of loss',
          isLast: true,
        ),
      ],
    ),
  );
}


Widget _buildBenefitItem({
  required IconData icon,
  required Color color,
  required String text,
  bool isLast = false,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: isLast ? 0 : 16),
    padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: isLast ? Colors.transparent : Color(0xFFEAE7E0).withOpacity(0.5),
          width: 1,
        ),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            size: 16,
            color: color,
          ),
        ),
        SizedBox(width: 14),
        Expanded(
          child: Text(
            text.tr(),
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}


class HeartAnimation extends StatefulWidget {
  const HeartAnimation({super.key});

  @override
  State<HeartAnimation> createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation> with TickerProviderStateMixin{
late  Animation<double> animation;
late  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true); // animation will loop back and forth

    animation=Tween<double>(begin: 0.8,end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Easing.linear));
    super.initState();
  }
  @override
  void dispose() {
    animation.isDismissed;
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Container(
        width:animation.value* 80,
        height:animation.value* 80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.favorite,
            color: Color(0xFFD9A65E),
            size: 40,
          ),
        ),
      )
    );
  }
}
