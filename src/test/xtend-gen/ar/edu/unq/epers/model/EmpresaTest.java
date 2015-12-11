package ar.edu.unq.epers.model;

import ar.edu.unq.epers.extensions.DateExtensions;
import ar.edu.unq.epers.model.AbstractTest;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.ReservaEmpresarial;
import ar.edu.unq.epers.model.ReservaException;
import java.util.Date;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class EmpresaTest extends AbstractTest {
  @Test
  public void reservaOk() {
    ReservaEmpresarial _reservaEmpresarial = new ReservaEmpresarial();
    final Procedure1<ReservaEmpresarial> _function = new Procedure1<ReservaEmpresarial>() {
      @Override
      public void apply(final ReservaEmpresarial it) {
        it.setOrigen(EmpresaTest.this.retiro);
        it.setDestino(EmpresaTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 01);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setFin(_nuevaFecha_1);
        it.setAuto(EmpresaTest.this.auto);
        it.setUsuario(EmpresaTest.this.usuarioEmpresa);
        it.setEmpresa(EmpresaTest.this.empresa);
        it.reservar();
      }
    };
    ObjectExtensions.<ReservaEmpresarial>operator_doubleArrow(_reservaEmpresarial, _function);
    List<Reserva> _reservas = this.empresa.getReservas();
    int _size = _reservas.size();
    Assert.assertEquals(1, _size);
  }
  
  @Test(expected = ReservaException.class)
  public void reservaUsuarioInvalido() {
    ReservaEmpresarial _reservaEmpresarial = new ReservaEmpresarial();
    final Procedure1<ReservaEmpresarial> _function = new Procedure1<ReservaEmpresarial>() {
      @Override
      public void apply(final ReservaEmpresarial it) {
        it.setOrigen(EmpresaTest.this.retiro);
        it.setDestino(EmpresaTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 01);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setFin(_nuevaFecha_1);
        it.setAuto(EmpresaTest.this.auto);
        it.setUsuario(EmpresaTest.this.usuarioPrueba);
        it.setEmpresa(EmpresaTest.this.empresa);
        it.reservar();
      }
    };
    ObjectExtensions.<ReservaEmpresarial>operator_doubleArrow(_reservaEmpresarial, _function);
    Assert.fail();
  }
}
