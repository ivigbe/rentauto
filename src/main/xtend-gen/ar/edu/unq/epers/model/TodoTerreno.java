package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.Categoria;

@SuppressWarnings("all")
public class TodoTerreno extends Categoria {
  @Override
  public Double calcularCosto(final Auto auto) {
    Double _costoBase = auto.getCostoBase();
    return Double.valueOf(((_costoBase).doubleValue() * 1.10));
  }
}
