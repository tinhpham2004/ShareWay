import 'package:copy_with_extension/copy_with_extension.dart';
part 'option_item.g.dart';

@CopyWith()
class OptionItem {
  final String? idString;
  final int? idInt;
  final String? name;
  OptionItem({
    this.idString,
    this.idInt,
    this.name,
  });
}
