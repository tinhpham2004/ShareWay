import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/input/text_field_input.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_widget.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/add_vehicle/bloc/add_vehicle_bloc.dart';

class AddVehicleSearchDialog extends StatefulWidget {
  final AddVehicleBloc bloc;
  final void Function(OptionItem)? onSelected;

  AddVehicleSearchDialog({super.key, required this.bloc, this.onSelected});

  @override
  _AddVehicleSearchDialogState createState() => _AddVehicleSearchDialogState();
}

class _AddVehicleSearchDialogState extends State<AddVehicleSearchDialog> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();
  final PagingController<int, OptionItem> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _setupPagingController();
    _setupBlocListener();
  }

  void _setupPagingController() {
    _pagingController.addPageRequestListener((pageKey) {
      widget.bloc.onFetchVehicles(
        context: context,
        pageKey: pageKey,
        vehicleName: _searchController.text,
      );
    });
  }

  void _setupBlocListener() {
    widget.bloc.stream.listen((state) {
      if (state.isLoading) return;
      if (state.hasMoreData) {
        _pagingController.appendPage(state.vehicles, state.pageKey);
      } else {
        _pagingController.appendLastPage(state.vehicles);
      }
    });
  }

  void _filterItems() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _pagingController.refresh();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _pagingController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldInput(
              controller: _searchController,
              onChanged: (value) {
                _filterItems();
              },
            ),
            spaceH16,
            Expanded(
              child: PagedListView<int, OptionItem>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<OptionItem>(
                  itemBuilder: (context, item, index) => ListTile(
                    leading: AppIcon.motorbike,
                    title: Text(item.name ?? "Unknown"),
                    onTap: () {
                      widget.onSelected?.call(item);
                      Navigator.of(context).pop();
                    },
                  ),
                  newPageProgressIndicatorBuilder: (_) => const LoadingWidget(),
                  firstPageProgressIndicatorBuilder: (_) =>
                      const LoadingWidget(),
                  noItemsFoundIndicatorBuilder: (_) => const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showAddVehicleSearchDialog({
  required BuildContext context,
  void Function(OptionItem)? onSelected,
}) {
  final bloc = context.read<AddVehicleBloc>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: bloc,
        child: AddVehicleSearchDialog(bloc: bloc, onSelected: onSelected),
      );
    },
  );
}
