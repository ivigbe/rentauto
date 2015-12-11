package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Auto;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public abstract class Categoria {
  private String nombre;
  
  private Integer categoriaId;
  
  public abstract Double calcularCosto(final Auto auto);
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public Integer getCategoriaId() {
    return this.categoriaId;
  }
  
  public void setCategoriaId(final Integer categoriaId) {
    this.categoriaId = categoriaId;
  }
}
