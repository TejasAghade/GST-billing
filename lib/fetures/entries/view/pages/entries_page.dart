import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_management/core/constants/sizes.dart';
import 'package:shop_management/core/providers/sidebar_notifier.dart';
import 'package:shop_management/core/theme/app_pallet.dart';
import 'package:shop_management/core/theme/text_style.dart';
import 'package:shop_management/core/widgets/custom_datepicker_widget.dart';
import 'package:shop_management/core/widgets/custom_text_form_field_widget.dart';
import 'package:shop_management/core/widgets/sidebar_widget.dart';
import 'package:shop_management/fetures/entries/model/entries.model.dart';
import 'package:shop_management/fetures/entries/viewModel/e_quotations_viewmodel.dart';
import 'package:shop_management/fetures/entries/viewModel/entries_viewmodel.dart';

class EntriesPage extends ConsumerStatefulWidget {
  const EntriesPage({super.key});

  @override
  ConsumerState<EntriesPage> createState() => _EntriesPageState();
}

class _EntriesPageState extends ConsumerState<EntriesPage> {

  TextEditingController deliveryDate = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    deliveryDate.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    ref.read(sidebarNotifierProvider).selectTile(2);

    final quotationList = ref.watch(eQuotationsViewmodelProvider);
    final entryList = ref.watch(entriesViewModelProvider);

    return Scaffold(
      body: Row(
        children: [
          const SideBar(),
          Column(
            children: [
              const SizedBox(height: 40,),
              SizedBox(
                width: 300,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    prefixIcon: const Icon(CupertinoIcons.search, color: Pallet.gray,),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Pallet.gray
                      )
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Pallet.gray
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Pallet.gray
                      )
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              quotationList!.when(
                data: (quotation){
                  return quotation.data == null || quotation.data!.isEmpty? const Center(
                    child: Text( "No data!"),
                  ) : SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: MediaQuery.of(context).size.height - 140,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: quotation.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1, color: Pallet.borderColor))
                                ),
                                child: ListTile(
                                  title: Text(quotation.data![index].item!.toString(), style: customText(size: 16, fontWeight: FontWeight.w500),),
                                  subtitle: Row(
                                    children: [
                                      const SizedBox(width: 5,),
                                      Text("₹ ", style: regularTextMedium,),
                                      Text(quotation.data![index].charges.toString()),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: (){
                                      ref.read(entriesViewModelProvider.notifier).addItemsToList(
                                        item: Item(
                                          itemId:quotation.data![index].id,
                                          itemName: quotation.data![index].item,
                                          charges: quotation.data![index].charges
                                        )
                                      );
                                    },
                                    icon: const Icon(CupertinoIcons.add_circled, color: Pallet.primaryColor,),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace){
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }, 
                loading: (){
                  return const Center(
                    child: CircularProgressIndicator(color: Pallet.primaryColor,),
                  );
                }
              ),
            ],
          ),
          width20(),
          const VerticalDivider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40,),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Invoice No: ', style: regularTextBold),
                        TextSpan(text: 'INV-22439', style: regularText),
                      ],
                    ),
                  ),

                  height20(),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Gst: ', style: regularTextBold),
                        TextSpan(text: '18%', style: regularText),
                      ],
                    ),
                  ),
                      
                  const SizedBox(height: 20,),
                  const Divider(),
                  const SizedBox(height: 20,),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: const CustomTextFormField(
                          width: 400,
                          lable: "Customer name",
                        ),
                      ),
                      const CustomTextFormField(
                        width: 300,
                        lable: "Mobile number",
                      ),
                    ],
                  ),
                  height20(),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: const CustomTextFormField(
                          width: 400,
                          lable: "Delivery address",
                        ),
                      ),
                      CustomDatepickerWidget(
                        width: 200,
                        suffixIcon: const Icon(CupertinoIcons.calendar_circle, color: Pallet.primaryLightColor,),
                        hintText: "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                        lable: "Delivery date",
                        controller: deliveryDate,
                      )
                    ],
                  ),
                  height20(),
                  const Divider(),
                  height20(),
                  Text("Items", style: mediumTextMedium,),
                  height20(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        
                        Expanded(
                          child: entryList!.when(
                            data: (entries){
                              return entries.items == null || entries.items!.isEmpty? const Center(
                                child: Text("Add items"),
                              ) : SingleChildScrollView(
                                physics: const ScrollPhysics(),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height - 420,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: entries.items!.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              border: Border(bottom: BorderSide(width: 1, color: Pallet.borderColor))
                                            ),
                                            child: ListTile(
                                              title: Text(entries.items![index].itemName!.toString(), style: customText(size: 16, fontWeight: FontWeight.w500),),
                                              subtitle: Row(
                                                children: [
                                                  const SizedBox(width: 5,),
                                                  Text("₹ ", style: regularTextMedium,),
                                                  Text(entries.items![index].charges.toString()),
                                                ],
                                              ),
                                              trailing: IconButton(
                                                onPressed: (){
                                                  ref.read(entriesViewModelProvider.notifier).removeItemFromList(itemId: entries.items![index].itemId!);
                                                },
                                                icon: const Icon(CupertinoIcons.minus_circle, color: Pallet.dark,),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            error: (error, stackTrace){
                              return const Center(
                                child: Text("Something went wrong"),
                              );
                            }, 
                            loading: (){
                              return const Center(
                                child: CircularProgressIndicator(color: Pallet.primaryColor,),
                              );
                            }
                          ),
                        ),
                        const VerticalDivider(),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.only(bottom: 50, left: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: 'Bill amount:  ₹ ', style: regularTextBold),
                                    TextSpan(text: '10000', style: regularText),
                                  ],
                                ),
                              ),
                              height20(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: 'Bill amount + gst:  ₹ ', style: regularTextBold),
                                    TextSpan(text: '11800', style: regularText),
                                  ],
                                ),
                              ),
                            
                            ],
                          ),
                        )
               
                      
                      ],
                    ),
                  ),
                  
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   margin: const EdgeInsets.only(bottom: 25),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       RichText(
                  //         text: TextSpan(
                  //           children: [
                  //             TextSpan(text: 'Gst: ', style: regularTextBold),
                  //             TextSpan(text: '18%', style: regularText),
                  //           ],
                  //         ),
                  //       ),
                        
                  //       RichText(
                  //         text: TextSpan(
                  //           children: [
                  //             TextSpan(text: 'Bill amount: ', style: regularTextBold),
                  //             TextSpan(text: '10000', style: regularText),
                  //           ],
                  //         ),
                  //       ),
                        
                  //       RichText(
                  //         text: TextSpan(
                  //           children: [
                  //             TextSpan(text: 'Bill amount with gst: ', style: regularTextBold),
                  //             TextSpan(text: '11800', style: regularText),
                  //           ],
                  //         ),
                  //       ),
                      
                  //     ],
                  //   ),
                  // )
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}