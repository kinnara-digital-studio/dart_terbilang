library dart_terbilang;

class Spelling {
  String terbilang(dynamic num) {
    List<dynamic> revDecimal = [];
    List<dynamic> rev = num.toString()
        .replaceFirst(RegExp(r"\.[^]*"), "")
        .split('')
        .reversed
        .toList();
    if (num.toString().indexOf('.') >= 0) {
      revDecimal = num.toString()
          .substring(num.toString().indexOf('.') + 1)
          .split('')
          .reversed
          .toList();
    }
    print(rev);
    print(revDecimal);
    var result = '';
    var thousands = '';

    // handle decimal
    if (revDecimal.isNotEmpty) {
      for (var i = 0; i < revDecimal.length; i++)
        result = _toWords(revDecimal, i, decimal: true) + result;
      result = 'koma ' + result;
    }

    // handle non-decimal
    for (var i = 0; i < rev.length; i++) {
      if (i == 3) {
        thousands = 'ribu ';
      } else if (i == 6) {
        thousands = 'juta ';
      } else if (i == 9) {
        thousands = 'miliar ';
      } else if (i == 12) {
        thousands = 'triliun ';
      } else if (i == 15) {
        thousands = 'kuadriliun ';
      } else if (i == 18) {
        thousands = 'kuantiliun ';
      } else if (i == 21) {
        thousands = 'sekstiliun ';
      } else if (i == 24) {
        thousands = 'septiliun ';
      } else if (i == 27) {
        thousands = 'oktiliun ';
      } else if (i == 30) {
        thousands = 'noniliun ';
      } else if (i == 33) {
        thousands = 'desiliun ';
      }

      if (rev[i] != "0") {
        if ((i % 3) == 0) {
          if ((rev.asMap()[i + 1] == '1')) {
            result = _toWords(rev, i) + 'belas ' + thousands + result;
            i++;
          } else {
            result = _toWords(rev, i) + thousands + result;
          }
          thousands = '';
        } else if ((i % 3) == 2) {
          result = _toWords(rev, i) + 'ratus ' + thousands + result;
          thousands = '';
        } else if ((i % 3) == 1) {
          result = _toWords(rev, i) + 'puluh ' + thousands + result;
          thousands = '';
        }
      }
    }
    return result;
  }

  String _toWords(List<dynamic> arr, int index, {bool decimal = false}) {
    var number = arr[index];
    switch (number) {
      case '.':
        if (decimal) return 'koma ';
        return '';
      case '0':
        if (decimal) return 'nol ';
        return '';
      case '1':
        if (!decimal &&
            (index == 1 ||
                index == 2 ||
                (arr.asMap()[index + 1] == '1') ||
                (index % 3) == 1 ||
                (index % 3) == 2 ||
                ((index + 1 == arr.length) && (index % 3 == 0)))) return 'se';
        return 'satu ';
      case '2':
        return 'dua ';
      case '3':
        return 'tiga ';
      case '4':
        return 'empat ';
      case '5':
        return 'lima ';
      case '6':
        return 'enam ';
      case '7':
        return 'tujuh ';
      case '8':
        return 'delapan ';
      case '9':
        return 'sembilan ';
      default:
        return '';
    }
  }
}
