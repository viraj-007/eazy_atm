extension Extension on Object? {
  bool get isNullOrEmpty {
    return this == null || this == '' || this == [];
  }
}
