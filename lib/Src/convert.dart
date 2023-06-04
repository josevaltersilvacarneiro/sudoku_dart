(int, int) convert(int sectionRow, int houseColumn, int dimension) {
  int inv_rs = (sectionRow ~/ dimension) * dimension + houseColumn ~/ dimension;
  int inv_ci = (sectionRow % dimension) * dimension + houseColumn % dimension;

  return (inv_rs, inv_ci);
}
