// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/islamic_education/widgets/sadqah_widgets.dart';
import 'package:burzakh/widgets/under_construction_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/di_container.dart';
import '../../../dashboard/presentation/controller/cubit.dart';


class SadaqahJariyahPage extends StatefulWidget {
  @override
  _SadaqahJariyahPageState createState() => _SadaqahJariyahPageState();
}

class _SadaqahJariyahPageState extends State<SadaqahJariyahPage> {
  int _selectedIndex = 1; // Donate tab selected by default
  int _basketCount = 2;
  final List<ProjectModel> _projects = [
    ProjectModel(
      title: "Kafan (Burial Shroud)",
      description: "The Prophet Muhammad (peace be upon him) said: 'Whoever washes a deceased person and keeps it secret, Allah will forgive him forty times. And whoever shrouds a deceased person, Allah will clothe him with fine silk and brocades in Paradise. And whoever digs a grave for a deceased person and buries him, Allah will reward him with a reward equivalent to providing him with a dwelling place until the Day of Resurrection.'",
      shortDescription: "\"The Prophet Muhammad (peace be upon him) said: 'Whoever shrouds a deceased person, Allah will clothe him with fine silk in Paradise...'\"",
      imageUrl: "assets/images/shroud.jpg",
      price: 250,
      donors: 38,
      progressPercent: 0.76,
      isNew: true,
      isSelected: true,
    ),
    ProjectModel(
      title: "Water Wells",
      description: "Provide clean water to communities in need",
      shortDescription: "Provide clean water to communities in need",
      imageUrl: "assets/images/water_well.jpg",
      price: 2686,
      donors: 64,
      amountRaised: 1750,
      progressPercent: 0.65,
    ),
    ProjectModel(
      title: "Feed the Hungry",
      description: "Provide meals to those in need",
      shortDescription: "Provide meals to those in need",
      imageUrl: "assets/images/food.jpg",
      price: 10,
      donors: 128,
      amountRaised: 3840,
      progressPercent: 0.83,
    ),
    ProjectModel(
      title: "Umrah Sponsorship",
      description: "Sponsor someone who has never performed Umrah to visit the Holy Kaaba",
      shortDescription: "Sponsor someone who has never performed Umrah to visit the Holy Kaaba",
      imageUrl: "assets/images/kaaba.jpg",
      price: 1200,
      donors: 42,
      amountRaised: 840,
      progressPercent: 0.70,
      isNew: true,
    ),
  ];

  List<BasketItem> _basketItems = [];

  @override
  void initState() {
    super.initState();
    // Pre-populate basket for demo
    _basketItems = [
      BasketItem(project: _projects[0], quantity: 1),
      BasketItem(project: _projects[2], quantity: 3),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      decoration: BoxDecoration(
        gradient: AppColor.bgGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              // Main content
              CustomScrollView(
                slivers: [
                  // App Bar
                  SliverAppBar(
                    pinned: false,
                    backgroundColor: Colors.transparent,
                    floating: false,
                    automaticallyImplyLeading: false,
                    // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 0,
                    title: _buildHeader(),
                  ),

                  // Content
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 150),
                                  child: _buildHeroSection()),
                              Positioned(bottom: 0,left: 0,right: 0,child:_buildHadithCard(),)
                            ],
                          ),
                          buildIntroText(),
                          buildBenefitsCard(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: Text(
                              'Choose a Sadaqah Jariyah Project:'.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A4D3D),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),

                  // Projects Grid
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width < 360 ? 1 : 1,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 290
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => _buildProjectCard(_projects[index]),
                        childCount: _projects.length,
                      ),
                    ),
                  ),

                  // Footer
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
                      child: Text(
                        'Your Sadaqah Jariyah donation will be processed securely through our trusted partner charities. 100% of proceeds go to verified Islamic charitable causes in the UAE and internationally, providing continuous rewards.'.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Floating basket button
              // Positioned(
              //   bottom: 80,
              //   right: 20,
              //   child: _buildFloatingBasketButton(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xFF1A4D3D),
            size: 24,
          ),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sadaqah Jariyah'.tr(),
              style: TextStyle(
                color: Color(0xFF1A4D3D),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'صدقة جارية',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1A4D3D).withOpacity(0.9),
            Color(0xFF1A4D3D).withOpacity(0.7),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1A4D3D).withOpacity(0.15),
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeartAnimation(),
            SizedBox(height: 15),
            Text(
              'Ongoing Charity for the Hereafter'.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            // Text(
            //   'Rewards that continue after death',
            //   style: TextStyle(
            //     color: Colors.white.withOpacity(0.9),
            //     fontSize: 15,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildHadithCard() {
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
        border: Border(
          left: BorderSide(
            color: Color(0xFFD9A65E),
            width: 4,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            "'When a person dies, all their deeds come to an end except for three: ongoing charity, beneficial knowledge, or a righteous child who prays for them.'".tr(),
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey[700],
              fontSize: 15,
              height: 1.6,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '— Prophet Muhammad ﷺ'.tr(),
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }







  Widget _buildProjectCard(ProjectModel project) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: project.isSelected
            ? BorderSide(color: Color(0xFF1A4D3D), width: 2)
            : BorderSide.none,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project image
          Stack(
            children: [
              Container(
                height: 30,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(12),
                //     topRight: Radius.circular(12),
                //   ),
                //   image: DecorationImage(
                //     image: AssetImage(project.imageUrl),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Color(0xFF1A4D3D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${"AED".tr()} ${project.price}'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with premium tag
                  Row(
                    children: [
                      Text(
                        project.title.tr(),
                        style: TextStyle(
                          color: Color(0xFF1A4D3D),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (project.isNew)
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFD9A65E), Color(0xFFF3D19B)],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'NEW'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),

                  SizedBox(height: 3),

                  // Description
                  Text(
                    project.shortDescription.tr(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 15),
                  // Progress indicator
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       '${project.donors} donors',
                  //       style: TextStyle(
                  //         fontSize: 12,
                  //         color: Colors.grey[600],
                  //       ),
                  //     ),
                  //     if (project.amountRaised != null)
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  //             decoration: BoxDecoration(
                  //               color: Color(0xFF1A4D3D).withOpacity(0.1),
                  //               borderRadius: BorderRadius.circular(4),
                  //             ),
                  //             child: Text(
                  //               'AED ${project.amountRaised} raised',
                  //               style: TextStyle(
                  //                 fontSize: 12,
                  //                 color: Color(0xFF1A4D3D),
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //   ],
                  // ),

                  SizedBox(height: 5),
                  Spacer(),

                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      // value: project.progressPercent,
                      value:1,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1A4D3D)),
                      minHeight: 4,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Quantity input
                  // if (project == _projects[0]) // Kafan - fixed price
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Container(
                  //             height: 32,
                  //             decoration: BoxDecoration(
                  //               border: Border.all(color: Colors.grey[300]!),
                  //               borderRadius: BorderRadius.circular(8),
                  //             ),
                  //             child: Row(
                  //               children: [
                  //                 InkWell(
                  //                   onTap: () {},
                  //                   child: Container(
                  //                     width: 32,
                  //                     color: Colors.grey[100],
                  //                     child: Icon(Icons.remove, size: 16, color: Colors.grey[600]),
                  //                   ),
                  //                 ),
                  //                 Container(
                  //                   width: 40,
                  //                   color: Colors.white,
                  //                   child: Center(
                  //                     child: Text(
                  //                       '1',
                  //                       style: TextStyle(fontSize: 14),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 InkWell(
                  //                   onTap: () {},
                  //                   child: Container(
                  //                     width: 32,
                  //                     color: Colors.grey[100],
                  //                     child: Icon(Icons.add, size: 16, color: Colors.grey[600]),
                  //                   ),
                  //                 ),
                  //                 Container(
                  //                   padding: EdgeInsets.symmetric(horizontal: 8),
                  //                   child: Text(
                  //                     '1 × AED ${project.price}',
                  //                     style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //
                  //     ],
                  //   )
                  // else // Other projects - amount input
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Donation Amount',
                  //         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  //       ),
                  //       SizedBox(height: 3),
                  //       Container(
                  //         height: 32,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.grey[300]!),
                  //           borderRadius: BorderRadius.circular(6),
                  //         ),
                  //         child: Row(
                  //           children: [
                  //             Container(
                  //               padding: EdgeInsets.symmetric(horizontal: 8),
                  //               color: Colors.grey[100],
                  //               height: 32,
                  //               alignment: Alignment.center,
                  //               child: Text(
                  //                 'AED',
                  //                 style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  //               ),
                  //             ),
                  //             Expanded(
                  //               child: TextField(
                  //                 decoration: InputDecoration(
                  //                   contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  //                   border: InputBorder.none,
                  //                   isDense: true,
                  //                 ),
                  //                 keyboardType: TextInputType.number,
                  //                 textAlign: TextAlign.center,
                  //                 style: TextStyle(fontSize: 14),
                  //                 controller: TextEditingController(
                  //                   text: project == _projects[1] ? '500' :
                  //                   project == _projects[2] ? '30' : '300',
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),

                  SizedBox(height: 6),

                  // Add to basket button
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(context: context, builder: (context) => UnderConstructionDialog(),);
                    },
                    // onPressed: () => _showDonationModal(context),
                    // icon: Icon(Icons.shopping_cart, size: 14,color: Colors.white,),
                    label: Text('Donat Now'.tr()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonColor,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                      padding: EdgeInsets.symmetric(vertical: 0),
                      minimumSize: Size.fromHeight(34),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  SizedBox(height: 6),

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
                        'Make this a monthly donation'.tr(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBasketButton() {
    return GestureDetector(
      onTap: () => _showDonationModal(context),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Color(0xFFD9A65E),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD9A65E).withOpacity(0.4),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 24,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Center(
                  child: Text(
                    _basketCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  void _showDonationModal(BuildContext context) {
    double totalAmount = _basketItems.fold(0, (sum, item) => sum + (item.project.price * item.quantity));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return CartDonation(basketItems: _basketItems, totalAmount: totalAmount);
        },
      ),
    );
  }

}


var dashboardCubit=DiContainer().sl<DashboardCubit>();
