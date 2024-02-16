import 'package:flutter/material.dart';

import '../../../models/models.dart';

///Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2024] Meditab Software Inc.
/// All Rights Reserved.
///
///NOTICE:  All information contained herein is, and remains
///the property of Meditab Software Inc. and its suppliers,
///if any.  The intellectual and technical concepts contained
///herein are proprietary to Meditab Software Incorporated
///and its suppliers and may be covered by U.S. and Foreign Patents,
///patents in process, and are protected by trade secret or copyright law.
///Dissemination of this information or reproduction of this material
///is strictly forbidden unless prior written permission is obtained
///from Meditab Software Incorporated.
///
///File Name: stock_tile
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 16/01/24
///

class StockTile extends StatelessWidget {
  const StockTile({super.key, required this.dataSet});

  final FinalDataModel dataSet;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('symbol: ${dataSet.symbol ?? '0'}'),
          Text('instrument: ${dataSet.instrument ?? '0'}'),
          Text('timestamp: ${dataSet.timestamp ?? '0'}'),
          Text('previousClose: ${dataSet.previousClose?.toString() ?? '0'}'),
          Text('openInterest: ${dataSet.openInterest?.toString() ?? '0'}'),
          Text(
              'changeInOpenInterest: ${dataSet.changeInOpenInterest?.toString() ?? '0'}'),
          Text('ceOI: ${dataSet.ceOI?.toString() ?? '0'}'),
          Text('ceCIOI: ${dataSet.ceCIOI?.toString() ?? '0'}'),
          Text('peOI: ${dataSet.peOI?.toString() ?? '0'}'),
          Text('peCIOI: ${dataSet.peCIOI?.toString() ?? '0'}'),
          Text('openPrice: ${dataSet.openPrice?.toString() ?? '0'}'),
          Text('highPrice: ${dataSet.highPrice?.toString() ?? '0'}'),
          Text('lowPrice: ${dataSet.lowPrice?.toString() ?? '0'}'),
          Text('closePrice: ${dataSet.closePrice?.toString() ?? '0'}'),
          Text('averagePrice: ${dataSet.averagePrice?.toString() ?? '0'}'),
          Text('ttlTrdQty: ${dataSet.ttlTrdQty?.toString() ?? '0'}'),
          Text(
              'deliveryQuantity: ${dataSet.deliveryQuantity?.toString() ?? '0'}'),
          Text(
              'fiftyTwoWeekHigh: ${dataSet.fiftyTwoWeekHigh?.toString() ?? '0'}'),
          Text(
              'fiftyTwoWeekLow: ${dataSet.fiftyTwoWeekLow?.toString() ?? '0'}'),
          Text('futureOIPer: ${dataSet.futureOIPer?.toString() ?? '0'}'),
          Text('pricePer: ${dataSet.pricePer?.toString() ?? '0'}'),
          Text('pCR: ${dataSet.pCR?.toString() ?? '0'}'),
          Text('c2Support: ${dataSet.c2Support?.toString() ?? '0'}'),
          Text('c2Resistance: ${dataSet.c2Resistance?.toString() ?? '0'}'),
          Text('c2High: ${dataSet.c2High?.toString() ?? '0'}'),
          Text('c2Low: ${dataSet.c2Low?.toString() ?? '0'}'),
          Text('volumeFactor: ${dataSet.volumeFactor?.toString() ?? '0'}'),
          Text('deliveryFactor: ${dataSet.deliveryFactor?.toString() ?? '0'}'),
          Text('support1: ${dataSet.support1?.toString() ?? '0'}'),
          Text('support2: ${dataSet.support2?.toString() ?? '0'}'),
          Text('resistance1: ${dataSet.resistance1?.toString() ?? '0'}'),
          Text('resistance2: ${dataSet.resistance2?.toString() ?? '0'}'),
        ],
      ),
    );
  }
}
