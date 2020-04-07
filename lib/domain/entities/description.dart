import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Description  extends Equatable{
  final String title;
  final String description;
  final int pageViews;

  Description({
    @required this.title,
    @required this.description,
    this.pageViews});

  @override
  // TODO: implement props
  List<Object> get props => [title, description, pageViews];
}