package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Ubicacion;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class UbicacionVirtual extends Ubicacion {
  private List<Ubicacion> ubicaciones;
  
  @Pure
  public List<Ubicacion> getUbicaciones() {
    return this.ubicaciones;
  }
  
  public void setUbicaciones(final List<Ubicacion> ubicaciones) {
    this.ubicaciones = ubicaciones;
  }
}
