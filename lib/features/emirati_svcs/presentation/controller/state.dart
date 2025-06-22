import 'package:equatable/equatable.dart';

abstract class EmirateSvcsState extends Equatable{
@override // TODO: implement props
  List<Object?> get props => [];
}

class EmirateSvcsInit extends EmirateSvcsState{}
class EmirateSvcsLoading extends EmirateSvcsState{}
class EmirateSvcsLoaded extends EmirateSvcsState{}
class EmirateSvcsError extends EmirateSvcsState{}
