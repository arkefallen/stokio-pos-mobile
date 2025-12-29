import 'package:intl/intl.dart';

/// Currency formatter for Indonesian Rupiah
class CurrencyFormatter {
  static final _formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  /// Formats a number as Indonesian Rupiah
  /// Example: 50000 -> 'Rp 50.000'
  static String format(num value) {
    return _formatter.format(value);
  }

  /// Formats with compact notation for large numbers
  /// Example: 1500000 -> 'Rp 1,5jt'
  static String formatCompact(num value) {
    if (value >= 1000000000) {
      return 'Rp ${(value / 1000000000).toStringAsFixed(1)}M';
    } else if (value >= 1000000) {
      return 'Rp ${(value / 1000000).toStringAsFixed(1)}jt';
    } else if (value >= 1000) {
      return 'Rp ${(value / 1000).toStringAsFixed(0)}rb';
    }
    return format(value);
  }
}

/// Date formatters for consistent date display
class DateFormatter {
  /// Full date format: 26 Desember 2024
  static String formatFull(DateTime date) {
    return DateFormat('d MMMM yyyy', 'id_ID').format(date);
  }

  /// Short date format: 26/12/2024
  static String formatShort(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Time format: 14:30
  static String formatTime(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  /// Date and time: 26 Des 2024, 14:30
  static String formatDateTime(DateTime date) {
    return DateFormat('d MMM yyyy, HH:mm', 'id_ID').format(date);
  }

  /// Relative time: 'Just now', '5 minutes ago', 'Yesterday'
  static String formatRelative(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return formatShort(date);
    }
  }
}

/// Quantity formatter
class QuantityFormatter {
  /// Format quantity with unit
  static String format(int quantity, {String unit = 'pcs'}) {
    return '$quantity $unit';
  }
}
