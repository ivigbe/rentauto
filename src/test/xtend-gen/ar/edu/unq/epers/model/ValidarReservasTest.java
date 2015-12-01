package ar.edu.unq.epers.model;

import ar.edu.unq.epers.extensions.DateExtensions;
import ar.edu.unq.epers.model.AbstractTest;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.ReservaException;
import java.util.Date;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class ValidarReservasTest extends AbstractTest {
  @Test
  public void reservaUnica() {
    Reserva _reserva = new Reserva();
    final Procedure1<Reserva> _function = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(ValidarReservasTest.this.retiro);
        it.setDestino(ValidarReservasTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 01);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setFin(_nuevaFecha_1);
        it.setAuto(ValidarReservasTest.this.auto);
        it.setUsuario(ValidarReservasTest.this.usuarioPrueba);
        it.reservar();
      }
    };
    ObjectExtensions.<Reserva>operator_doubleArrow(_reserva, _function);
    List<Reserva> _reservas = this.auto.getReservas();
    int _size = _reservas.size();
    Assert.assertEquals(1, _size);
  }
  
  @Test
  public void reservaQueNoSePisan() {
    Reserva _reserva = new Reserva();
    final Procedure1<Reserva> _function = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(ValidarReservasTest.this.retiro);
        it.setDestino(ValidarReservasTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 01);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setFin(_nuevaFecha_1);
        it.setAuto(ValidarReservasTest.this.auto);
        it.setUsuario(ValidarReservasTest.this.usuarioPrueba);
        it.reservar();
      }
    };
    ObjectExtensions.<Reserva>operator_doubleArrow(_reserva, _function);
    Reserva _reserva_1 = new Reserva();
    final Procedure1<Reserva> _function_1 = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(ValidarReservasTest.this.aeroparque);
        it.setDestino(ValidarReservasTest.this.retiro);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 06);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 07);
        it.setFin(_nuevaFecha_1);
        it.setAuto(ValidarReservasTest.this.auto);
        it.setUsuario(ValidarReservasTest.this.usuarioPrueba);
        it.reservar();
      }
    };
    ObjectExtensions.<Reserva>operator_doubleArrow(_reserva_1, _function_1);
    List<Reserva> _reservas = this.auto.getReservas();
    int _size = _reservas.size();
    Assert.assertEquals(2, _size);
  }
  
  @Test(expected = ReservaException.class)
  public void reservaQueSePisan() {
    Reserva _reserva = new Reserva();
    final Procedure1<Reserva> _function = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(ValidarReservasTest.this.retiro);
        it.setDestino(ValidarReservasTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 01);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setFin(_nuevaFecha_1);
        it.setAuto(ValidarReservasTest.this.auto);
      }
    };
    Reserva _doubleArrow = ObjectExtensions.<Reserva>operator_doubleArrow(_reserva, _function);
    this.auto.agregarReserva(_doubleArrow);
    Reserva _reserva_1 = new Reserva();
    final Procedure1<Reserva> _function_1 = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(ValidarReservasTest.this.aeroparque);
        it.setDestino(ValidarReservasTest.this.retiro);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 04);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 07);
        it.setFin(_nuevaFecha_1);
        it.setAuto(ValidarReservasTest.this.auto);
      }
    };
    Reserva _doubleArrow_1 = ObjectExtensions.<Reserva>operator_doubleArrow(_reserva_1, _function_1);
    this.auto.agregarReserva(_doubleArrow_1);
    Assert.fail();
  }
  
  @Test(expected = ReservaException.class)
  public void reservasSinSentido() {
    Reserva _reserva = new Reserva();
    final Procedure1<Reserva> _function = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(ValidarReservasTest.this.retiro);
        it.setDestino(ValidarReservasTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 01);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setFin(_nuevaFecha_1);
        it.setAuto(ValidarReservasTest.this.auto);
      }
    };
    Reserva _doubleArrow = ObjectExtensions.<Reserva>operator_doubleArrow(_reserva, _function);
    this.auto.agregarReserva(_doubleArrow);
    Reserva _reserva_1 = new Reserva();
    final Procedure1<Reserva> _function_1 = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(ValidarReservasTest.this.retiro);
        it.setDestino(ValidarReservasTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 07);
        it.setFin(_nuevaFecha_1);
        it.setAuto(ValidarReservasTest.this.auto);
      }
    };
    Reserva _doubleArrow_1 = ObjectExtensions.<Reserva>operator_doubleArrow(_reserva_1, _function_1);
    this.auto.agregarReserva(_doubleArrow_1);
    Assert.fail();
  }
}
