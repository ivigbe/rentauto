package ar.edu.unq.epers.model;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtend.lib.annotations.EqualsHashCode;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@EqualsHashCode
@SuppressWarnings("all")
public class Ubicacion {
  private String nombre;
  
  private Integer ubicacionId;
  
  public Ubicacion() {
  }
  
  public Ubicacion(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public Integer getUbicacionId() {
    return this.ubicacionId;
  }
  
  public void setUbicacionId(final Integer ubicacionId) {
    this.ubicacionId = ubicacionId;
  }
  
  @Override
  @Pure
  public boolean equals(final Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Ubicacion other = (Ubicacion) obj;
    if (this.nombre == null) {
      if (other.nombre != null)
        return false;
    } else if (!this.nombre.equals(other.nombre))
      return false;
    if (this.ubicacionId == null) {
      if (other.ubicacionId != null)
        return false;
    } else if (!this.ubicacionId.equals(other.ubicacionId))
      return false;
    return true;
  }
  
  @Override
  @Pure
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((this.nombre== null) ? 0 : this.nombre.hashCode());
    result = prime * result + ((this.ubicacionId== null) ? 0 : this.ubicacionId.hashCode());
    return result;
  }
}
