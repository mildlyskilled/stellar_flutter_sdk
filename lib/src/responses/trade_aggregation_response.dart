// Copyright 2020 The Stellar Flutter SDK Authors. All rights reserved.
// Use of this source code is governed by a license that can be
// found in the LICENSE file.

import 'response.dart';

/// Represents a trade aggregation response from horizon server. A trade aggregation represents aggregated statistics on an asset pair (base and counter) for a specific time period. Trade aggregations are useful to developers of trading clients and provide historical trade data.
/// See: <a href="https://developers.stellar.org/api/aggregations/trade-aggregations/" target="_blank">Trade aggregations</a>
class TradeAggregationResponse extends Response {
  String? timestamp;
  String? tradeCount;
  String? baseVolume;
  String? counterVolume;
  String? avg;
  String? high;
  String? low;
  String? open;
  String? close;

  TradeAggregationResponse(this.timestamp, this.tradeCount, this.baseVolume, this.counterVolume,
      this.avg, this.high, this.low, this.open, this.close);

  DateTime getDate() {
    return DateTime.fromMillisecondsSinceEpoch(int.tryParse(this.timestamp!)!);
  }

  factory TradeAggregationResponse.fromJson(Map<String, dynamic> json) =>
      new TradeAggregationResponse(
          json['timestamp'],
          json['trade_count'],
          json['base_volume'],
          json['counter_volume'],
          json['avg'],
          json['high'],
          json['low'],
          json['open'],
          json['close'])
        ..rateLimitLimit = convertInt(json['rateLimitLimit'])
        ..rateLimitRemaining = convertInt(json['rateLimitRemaining'])
        ..rateLimitReset = convertInt(json['rateLimitReset']);
}
