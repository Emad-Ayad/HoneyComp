import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrdersEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    String formattedDate = '';
    try {
      DateTime date = DateTime.parse(order.date);
      formattedDate = DateFormat('yyyy/MM/dd - hh:mm a').format(date);
    } catch (e) {
      formattedDate = order.date;
    }

    String mappedStatus = _mapStatus(context, order.status);
    Color statusColor = _getStatusColor(order.status);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'طلب #${order.uId.substring(0, 8).toUpperCase()}',
                style: AppTextStyles.subtitle2,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  mappedStatus,
                  style: AppTextStyles.caption.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            formattedDate,
            style: AppTextStyles.bodyText2.copyWith(color: Colors.grey),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${order.cartEntity.cartList.length} منتجات',
                style: AppTextStyles.bodyText1,
              ),
              Text(
                '${order.cartEntity.getTotalPrice() + (order.payWithCash == true ? 40 : 0)} جنيه',
                style: AppTextStyles.subtitle1.copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _mapStatus(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return S.of(context).underReview;
      case 'shipped':
        return S.of(context).shipped;
      case 'delivered':
        return S.of(context).delivered;
      case 'cancelled':
        return S.of(context).canceled;
      default:
        return status;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'shipped':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
