package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Empresa;
import ar.edu.unq.epers.model.Reserva;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class ReservaEmpresarial extends Reserva {
  private Empresa empresa;
  
  private String nombreContacto;
  
  private String cargoContacto;
  
  @Override
  public boolean reservar() {
    boolean _xblockexpression = false;
    {
      super.reservar();
      _xblockexpression = this.empresa.agregarReserva(this);
    }
    return _xblockexpression;
  }
  
  @Pure
  public Empresa getEmpresa() {
    return this.empresa;
  }
  
  public void setEmpresa(final Empresa empresa) {
    this.empresa = empresa;
  }
  
  @Pure
  public String getNombreContacto() {
    return this.nombreContacto;
  }
  
  public void setNombreContacto(final String nombreContacto) {
    this.nombreContacto = nombreContacto;
  }
  
  @Pure
  public String getCargoContacto() {
    return this.cargoContacto;
  }
  
  public void setCargoContacto(final String cargoContacto) {
    this.cargoContacto = cargoContacto;
  }
}
