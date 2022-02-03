import 'package:flutter/material.dart' hide ReorderableList;
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';

class ReorderableListSimple extends StatefulWidget {
  const ReorderableListSimple({
    Key? key,
    required this.children,
    required this.onReorder,
    this.padding,
  }) : super(key: key);

  final List<Widget> children;
  final ReorderCallback onReorder;
  final EdgeInsets? padding;

  @override
  State<ReorderableListSimple> createState() => _ReorderableListSimpleState();
}

class _ReorderableListSimpleState extends State<ReorderableListSimple> {
  int? _newIndex;
  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = List<Widget>.from(widget.children);
  }

  @override
  didUpdateWidget(ReorderableListSimple oldWidget) {
    super.didUpdateWidget(oldWidget);
    _children = List<Widget>.from(widget.children);
  }

  int _oldIndexOfKey(Key key) {
    return widget.children
        .indexWhere((Widget w) => Key(w.hashCode.toString()) == key);
  }

  int _indexOfKey(Key key) {
    return _children
        .indexWhere((Widget w) => Key(w.hashCode.toString()) == key);
  }

  Widget _buildReorderableItem(BuildContext context, int index) {
    return ReorderableItemSimple(
      key: Key(_children[index].hashCode.toString()),
      innerItem: _children[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableList(
      child: ListView.builder(
        padding: widget.padding,
        itemCount: _children.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildReorderableItem(context, index);
        },
      ),

      // child: Container(
      //   padding: widget.padding,
      //   child: CustomScrollView(
      //     slivers: <Widget>[
      //       SliverList(
      //         delegate: SliverChildBuilderDelegate(
      //           (BuildContext context, int index) {
      //             return _buildReorderableItem(context, index);
      //           },
      //           childCount: widget.children.length,
      //         ),
      //       )
      //     ],
      //   ),
      // ),

      onReorder: (Key draggedItem, Key newPosition) {
        int draggingIndex = _indexOfKey(draggedItem);
        int newPositionIndex = _indexOfKey(newPosition);

        final item = _children[draggingIndex];
        setState(() {
          _newIndex = newPositionIndex;

          _children.removeAt(draggingIndex);
          _children.insert(newPositionIndex, item);
        });

        return true;
      },
      onReorderDone: (Key draggedItem) {
        int oldIndex = _oldIndexOfKey(draggedItem);
        if (_newIndex != null) widget.onReorder(oldIndex, _newIndex!);
        _newIndex = null;
      },
    );
  }
}

class ReorderableItemSimple extends StatelessWidget {
  const ReorderableItemSimple({
    required Key key,
    required this.innerItem,
  }) : super(key: key);

  final Widget innerItem;

  Widget _buildInnerItem(BuildContext context) {
    return innerItem;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
      key: key!,
      childBuilder: (BuildContext context, ReorderableItemState state) {
        return Opacity(
          opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
          child: _buildInnerItem(context),
        );
      },
    );
  }
}
