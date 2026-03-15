class Validator {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Không được để trống";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email không được để trống";
    }

    final emailRegex = RegExp(r'^[\w\.-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return "Email sai định dạng";
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return "Số điện thoại không được để trống";
    }

    final phoneRegex = RegExp(r'^[0-9]{10}$');

    if (!phoneRegex.hasMatch(value)) {
      return "Số điện thoại phải 10 số";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Mật khẩu không được để trống";
    }

    if (value.length < 6) {
      return "Mật khẩu phải >= 6 ký tự";
    }

    return null;
  }
}
