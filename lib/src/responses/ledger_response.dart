// Copyright 2020 The Stellar Flutter SDK Authors. All rights reserved.
// Use of this source code is governed by a license that can be
// found in the LICENSE file.

import 'response.dart';

/// Represents ledger response received from the horizon server. Each ledger stores the state of the network at a point in time and contains all the changes - transactions, operations, effects, etc. - to that state.
/// See: <a href="https://developers.stellar.org/api/resources/ledgers/" target="_blank">Ledger documentation</a>
class LedgerResponse extends Response {
  int? sequence;
  String? hash;
  String? pagingToken;
  String? prevHash;
  int? successfulTransactionCount;
  int? failedTransactionCount;
  int? operationCount;
  int? txSetOperationCount;
  String? closedAt;
  String? totalCoins;
  String? feePool;
  String? baseReserve;
  String? baseFeeInStroops;
  String? baseReserveInStroops;
  int? maxTxSetSize;
  int? protocolVersion;
  String? headerXdr;
  LedgerResponseLinks? links;

  LedgerResponse(
      this.sequence,
      this.hash,
      this.pagingToken,
      this.prevHash,
      this.successfulTransactionCount,
      this.failedTransactionCount,
      this.operationCount,
      this.txSetOperationCount,
      this.closedAt,
      this.totalCoins,
      this.feePool,
      this.baseFeeInStroops,
      this.baseReserve,
      this.baseReserveInStroops,
      this.maxTxSetSize,
      this.protocolVersion,
      this.headerXdr,
      this.links);

  factory LedgerResponse.fromJson(Map<String, dynamic> json) => LedgerResponse(
      convertInt(json['sequence']),
      json['hash'],
      json['paging_token'],
      json['prev_hash'],
      convertInt(json['successful_transaction_count']),
      convertInt(json['failed_transaction_count']),
      convertInt(json['operation_count']),
      json['tx_set_operation_count'] == null ? null : convertInt(json['tx_set_operation_count']),
      json['closed_at'],
      json['total_coins'],
      json['fee_pool'],
      json['base_fee_in_stroops'].toString(),
      json['base_reserve'],
      json['base_reserve_in_stroops'].toString(),
      convertInt(json['max_tx_set_size']),
      convertInt(json['protocol_version']),
      json['header_xdr'],
      json['_links'] == null ? null : LedgerResponseLinks.fromJson(json['_links']))
    ..rateLimitLimit = convertInt(json['rateLimitLimit'])
    ..rateLimitRemaining = convertInt(json['rateLimitRemaining'])
    ..rateLimitReset = convertInt(json['rateLimitReset']);
}

/// Links connected to a ledger response received from the horizon server.
class LedgerResponseLinks {
  Link? effects;
  Link? operations;
  Link? self;
  Link? transactions;

  LedgerResponseLinks(this.effects, this.operations, this.self, this.transactions);

  factory LedgerResponseLinks.fromJson(Map<String, dynamic> json) => LedgerResponseLinks(
      json['effects'] == null ? null : Link.fromJson(json['effects']),
      json['operations'] == null ? null : Link.fromJson(json['operations']),
      json['self'] == null ? null : Link.fromJson(json['self']),
      json['transactions'] == null ? null : Link.fromJson(json['transactions']));
}
