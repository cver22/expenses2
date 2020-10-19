import 'package:expenses/env.dart';
import 'package:expenses/models/categories/my_category/my_category.dart';
import 'package:expenses/models/categories/my_subcategory/my_subcategory.dart';
import 'package:expenses/models/log/log.dart';
import 'package:expenses/models/settings/settings.dart';
import 'package:expenses/screens/categories/category_list_tile.dart';
import 'package:expenses/screens/categories/edit_category_dialog.dart';
import 'package:expenses/store/actions/actions.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/db_consts.dart';
import 'package:expenses/utils/keys.dart';
import 'package:expenses/utils/maybe.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//This widget is used in all category and subcategory lists throughout the application

class NewCategoryListDialog extends StatefulWidget {
  final CategoryOrSubcategory categoryOrSubcategory;
  final VoidCallback backChevron;
  final Log log;
  final SettingsLogEntry settingsLogEntry;

  NewCategoryListDialog(
      {Key key, @required this.categoryOrSubcategory, this.backChevron, this.log, @required this.settingsLogEntry})
      : super(key: key);

  @override
  _NewCategoryListDialogState createState() => _NewCategoryListDialogState();
}

class _NewCategoryListDialogState extends State<NewCategoryListDialog> {
  @override
  Widget build(BuildContext context) {
    List<MyCategory> _categories = [];
    List<MySubcategory> _subcategories = [];
    SettingsLogEntry _settingsLogEntry = widget.settingsLogEntry;

    //determines which list is passed based on if it comes from default or the entry
    switch (widget.settingsLogEntry) {
      case SettingsLogEntry.settings:
        Settings _settings = Env.store.state.settingsState.settings.value;
        _categories = _settings.defaultCategories;
        _subcategories = _settings.defaultSubcategories;
        break;
      case SettingsLogEntry.log:
        //do something
        break;
      case SettingsLogEntry.entry:
        if (widget.log != null) {
          _categories = widget.log.categories;
          if (widget.categoryOrSubcategory == CategoryOrSubcategory.subcategory) {
            _subcategories = widget.log.subcategories
                .where(
                    (element) => element.parentCategoryId == Env.store.state.entriesState.selectedEntry.value.category)
                .toList();
          }
        }
        break;
    }

    print('setLogEnt: $_settingsLogEntry, cat or sub: ${widget.categoryOrSubcategory}');

    if (_settingsLogEntry == SettingsLogEntry.settings) {
      return ConnectState(
          where: notIdentical,
          map: (state) => state.settingsState,
          builder: (state) {
            print('the current state is $state');
            return buildDialog(_categories, _subcategories, context, _settingsLogEntry);
          });
    } else {
      return ConnectState(
          where: notIdentical,
          map: (state) => state.logsState,
          builder: (state) {
            print('the current state is $state');
            return buildDialog(_categories, _subcategories, context, _settingsLogEntry);
          });
    }
  }

  Dialog buildDialog(List<MyCategory> _categories, List<MySubcategory> _subcategories, BuildContext context,
      SettingsLogEntry _settingsLogEntry) {
    return Dialog(
      //TODO move to constants
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.chevron_left),
                //if no back action is passed, automatically set to pop context
                onPressed: widget.backChevron ?? () => Get.back(),
              ),
              Text(
                widget.categoryOrSubcategory == CategoryOrSubcategory.category ? CATEGORY : SUBCATEGORY,
                //TODO currently uses the database constants to label the dialog, will need to change to if function that utilizes the constants to trigger the UI constants
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          //shows this list view if the category list comes from the log
          _entryCategoryListView(_categories, _subcategories, context, _settingsLogEntry),
        ],
      ),
    );
  }

  ListView _entryCategoryListView(List<MyCategory> _categories, List<MySubcategory> _subcategories,
      BuildContext context, SettingsLogEntry _settingsLogEntry) {
    return ListView(
        shrinkWrap: true,
        //TODO implement onReorder
        children: widget.categoryOrSubcategory == CategoryOrSubcategory.subcategory
            ? _subcategoryList(_subcategories, _categories, context, _settingsLogEntry)
            : _categoryList(_categories, context, _settingsLogEntry));
  }

  List<CategoryListTile> _categoryList(List<MyCategory> _categories, BuildContext context, SettingsLogEntry setLogEnt) {
    return _categories
        .map(
          (MyCategory category) => CategoryListTile(
            category: category,
            onLongPress: () => _switchCatOnLongPress(category, setLogEnt),
            onTap: () => _switchOnCatTap(category, setLogEnt),
          ),
        )
        .toList();
  }

  Future<dynamic> _switchOnCatTap(MyCategory category, SettingsLogEntry setLogEnt) {
    switch (setLogEnt) {
      case SettingsLogEntry.settings:
        return _settingsCatOnTap(category);
        break;
      case SettingsLogEntry.entry:
        return _entryCatOnTap(category);
        break;
      case SettingsLogEntry.log:
        return null;
        break;
      default:
        print('Error encountered loading Cat on Tap');
        return null;
        break;
    }
  }

  Future<dynamic> _settingsCatOnTap(MyCategory category) {
    Settings settings = Env.store.state.settingsState.settings.value;
    return Get.dialog(
      EditCategoryDialog(
        save: (name, unused) => Env.store.dispatch(
          UpdateSettings(
            settings: Maybe.maybe(
              settings.editLogCategories(
                category: category.copyWith(name: name),
              ),
            ),
          ),
        ),

        /*setDefault: (category) => {
          Env.logsFetcher.updateLog(log.setCategoryDefault(log: log, category: category)),
        },*/

        //TODO create delete function
        category: category,
        categoryOrSubcategory: CategoryOrSubcategory.category,
        //TODO - make functioning category edit dialog
      ),
    );
  }

  Future<dynamic> _entryCatOnTap(MyCategory category) {
    Env.store.dispatch(ChangeEntryCategories(category: category.id));
    Get.back();
    return Get.dialog(
      NewCategoryListDialog(
        categoryOrSubcategory: CategoryOrSubcategory.subcategory,
        log: widget.log,
        key: ExpenseKeys.subcategoriesDialog,
        settingsLogEntry: SettingsLogEntry.entry,
        backChevron: () => {
          Get.back(),
          Get.dialog(
            NewCategoryListDialog(
              categoryOrSubcategory: CategoryOrSubcategory.category,
              log: Env.store.state.logsState.logs[Env.store.state.entriesState.selectedEntry.value.logId],
              key: ExpenseKeys.categoriesDialog,
              settingsLogEntry: SettingsLogEntry.entry,
            ),
          ),
        },
      ),
    );
  }

  Future<dynamic> _switchCatOnLongPress(MyCategory category, SettingsLogEntry setLogEnt) {
    switch (setLogEnt) {
      case SettingsLogEntry.settings:
        return null;
        break;
      case SettingsLogEntry.entry:
        return _entryCatOnLongPress(category);
        break;
      case SettingsLogEntry.log:
        return null;
        break;
      default:
        print('Error encountered loading Cat On Long Press');
        return null;
        break;
    }
  }

  Future<dynamic> _entryCatOnLongPress(MyCategory category) {
    return Get.dialog(
      EditCategoryDialog(
        save: (name, unused) => Env.logsFetcher
            .updateLog(widget.log.editLogCategories(log: widget.log, category: category.copyWith(name: name))),

        /*setDefault: (category) => {
          Env.logsFetcher.updateLog(log.setCategoryDefault(log: log, category: category)),
        },*/

        //TODO create delete function
        category: category,
        categoryOrSubcategory: CategoryOrSubcategory.category,
        //TODO - make functioning category edit dialog
      ),
    );
  }

  List<CategoryListTile> _subcategoryList(List<MySubcategory> _subcategories, List<MyCategory> _categories,
      BuildContext context, SettingsLogEntry setLogEnt) {
    return _subcategories
        .map(
          (MySubcategory subcategory) => CategoryListTile(
            category: subcategory,
            onTap: () => _switchSubOnTap(subcategory, _categories, setLogEnt),
            onLongPress: () => _switchSubOnLongPress(subcategory, _categories, setLogEnt),
          ),
        )
        .toList();
  }

  Future<dynamic> _switchSubOnTap(MySubcategory subcategory, List<MyCategory> _categories, SettingsLogEntry setLogEnt) {
    switch (setLogEnt) {
      case SettingsLogEntry.settings:
        return _settingsSubOnTap(subcategory, _categories);
        break;
      case SettingsLogEntry.entry:
        return _entrySubOnTap(subcategory);
        break;
      case SettingsLogEntry.log:
        return null;
        break;
      default:
        print('Error encountered loading Sub On Tap');
        return null;
        break;
    }
  }

  Future<dynamic> _settingsSubOnTap(MySubcategory subcategory, List<MyCategory> _categories) {
    Settings settings = Env.store.state.settingsState.settings.value;
    return Get.dialog(
      EditCategoryDialog(
        categories: _categories,
        save: (name, parentCategoryId) => Env.store.dispatch(
          UpdateSettings(
            settings: Maybe.maybe(
              settings.editLogSubcategories(settings: settings,
                subcategory: subcategory.copyWith(name: name, parentCategoryId: parentCategoryId),
              ),
            ),
          ),
        ),
        //TODO default function

        //TODO create delete function
        category: subcategory,
        categoryOrSubcategory: CategoryOrSubcategory.subcategory,
      ),
    );
  }

  Future<void> _entrySubOnTap(MySubcategory subcategory) async {
    //onTap method for Entry Subcategories
    Env.store.dispatch(UpdateSelectedEntry(subcategory: subcategory.id));
    Get.back();
  }

  Future<dynamic> _switchSubOnLongPress(
      MySubcategory subcategory, List<MyCategory> _categories, SettingsLogEntry setLogEnt) {
    switch (setLogEnt) {
      case SettingsLogEntry.settings:
        return null;
        break;
      case SettingsLogEntry.entry:
        return _entrySubOnLongPress(subcategory, _categories);
        break;
      case SettingsLogEntry.log:
        return null;
        break;
      default:
        print('Error encountered loading Sub On Long Press');
        return null;
        break;
    }
  }

  Future<dynamic> _entrySubOnLongPress(MySubcategory subcategory, List<MyCategory> _categories) {
    return Get.dialog(
      EditCategoryDialog(
        categories: _categories,
        save: (name, parentCategoryId) => {
          Env.logsFetcher.updateLog(widget.log.editLogSubcategories(
              log: widget.log, subcategory: subcategory.copyWith(name: name, parentCategoryId: parentCategoryId))),
          //TODO refactor, if the parentId of a subcategory does not match the category when its edited, the subcategory should clear from the UI for the entry
        },

        //TODO default function

        //TODO create delete function
        category: subcategory,
        categoryOrSubcategory: CategoryOrSubcategory.subcategory,
      ),
    );
  }
}
