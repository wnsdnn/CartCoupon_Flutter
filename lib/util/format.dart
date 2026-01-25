import 'package:intl/intl.dart';

String PriceFormatter(int price) => NumberFormat('###,###,###').format(price);