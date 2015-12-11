package ar.edu.unq.epers.model;

import ar.edu.unq.epers.extensions.DateExtensions;
import ar.edu.unq.epers.model.AbstractTest;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.Ubicacion;
import java.util.Date;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class UbicacionPorFechaTest extends AbstractTest {
  @Test
  public void ubicacionReservasVacias() {
    Ubicacion _ubicacionInicial = this.auto.getUbicacionInicial();
    Ubicacion _ubicacion = this.auto.getUbicacion();
    Assert.assertEquals(_ubicacionInicial, _ubicacion);
  }
  
  @Test
  public void ubicacionUnaReserva() {
    Reserva _reserva = new Reserva();
    final Procedure1<Reserva> _function = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(UbicacionPorFechaTest.this.retiro);
        it.setDestino(UbicacionPorFechaTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 01);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setFin(_nuevaFecha_1);
        it.setAuto(UbicacionPorFechaTest.this.auto);
        it.setUsuario(UbicacionPorFechaTest.this.usuarioPrueba);
        it.reservar();
      }
    };
    ObjectExtensions.<Reserva>operator_doubleArrow(_reserva, _function);
    Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 02, 28);
    Ubicacion _ubicacionParaDia = this.auto.ubicacionParaDia(_nuevaFecha);
    Assert.assertEquals(this.retiro, _ubicacionParaDia);
    Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 01);
    Ubicacion _ubicacionParaDia_1 = this.auto.ubicacionParaDia(_nuevaFecha_1);
    Assert.assertEquals(this.retiro, _ubicacionParaDia_1);
    Date _nuevaFecha_2 = DateExtensions.nuevaFecha(2015, 03, 02);
    Ubicacion _ubicacionParaDia_2 = this.auto.ubicacionParaDia(_nuevaFecha_2);
    Assert.assertEquals(this.retiro, _ubicacionParaDia_2);
    Date _nuevaFecha_3 = DateExtensions.nuevaFecha(2015, 03, 05);
    Ubicacion _ubicacionParaDia_3 = this.auto.ubicacionParaDia(_nuevaFecha_3);
    Assert.assertEquals(this.aeroparque, _ubicacionParaDia_3);
    Date _nuevaFecha_4 = DateExtensions.nuevaFecha(2015, 03, 06);
    Ubicacion _ubicacionParaDia_4 = this.auto.ubicacionParaDia(_nuevaFecha_4);
    Assert.assertEquals(this.aeroparque, _ubicacionParaDia_4);
  }
  
  @Test
  public void ubicacionDosReservas() {
    Reserva _reserva = new Reserva();
    final Procedure1<Reserva> _function = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(UbicacionPorFechaTest.this.retiro);
        it.setDestino(UbicacionPorFechaTest.this.aeroparque);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 01);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 05);
        it.setFin(_nuevaFecha_1);
        it.setAuto(UbicacionPorFechaTest.this.auto);
        it.setUsuario(UbicacionPorFechaTest.this.usuarioPrueba);
        it.reservar();
      }
    };
    ObjectExtensions.<Reserva>operator_doubleArrow(_reserva, _function);
    Reserva _reserva_1 = new Reserva();
    final Procedure1<Reserva> _function_1 = new Procedure1<Reserva>() {
      @Override
      public void apply(final Reserva it) {
        it.setOrigen(UbicacionPorFechaTest.this.aeroparque);
        it.setDestino(UbicacionPorFechaTest.this.retiro);
        Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 03, 06);
        it.setInicio(_nuevaFecha);
        Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 10);
        it.setFin(_nuevaFecha_1);
        it.setAuto(UbicacionPorFechaTest.this.auto);
        it.setUsuario(UbicacionPorFechaTest.this.usuarioPrueba);
        it.reservar();
      }
    };
    ObjectExtensions.<Reserva>operator_doubleArrow(_reserva_1, _function_1);
    Date _nuevaFecha = DateExtensions.nuevaFecha(2015, 02, 28);
    Ubicacion _ubicacionParaDia = this.auto.ubicacionParaDia(_nuevaFecha);
    Assert.assertEquals(this.retiro, _ubicacionParaDia);
    Date _nuevaFecha_1 = DateExtensions.nuevaFecha(2015, 03, 1);
    Ubicacion _ubicacionParaDia_1 = this.auto.ubicacionParaDia(_nuevaFecha_1);
    Assert.assertEquals(this.retiro, _ubicacionParaDia_1);
    Date _nuevaFecha_2 = DateExtensions.nuevaFecha(2015, 03, 2);
    Ubicacion _ubicacionParaDia_2 = this.auto.ubicacionParaDia(_nuevaFecha_2);
    Assert.assertEquals(this.retiro, _ubicacionParaDia_2);
    Date _nuevaFecha_3 = DateExtensions.nuevaFecha(2015, 03, 5);
    Ubicacion _ubicacionParaDia_3 = this.auto.ubicacionParaDia(_nuevaFecha_3);
    Assert.assertEquals(this.aeroparque, _ubicacionParaDia_3);
    Date _nuevaFecha_4 = DateExtensions.nuevaFecha(2015, 03, 6);
    Ubicacion _ubicacionParaDia_4 = this.auto.ubicacionParaDia(_nuevaFecha_4);
    Assert.assertEquals(this.aeroparque, _ubicacionParaDia_4);
    Date _nuevaFecha_5 = DateExtensions.nuevaFecha(2015, 03, 9);
    Ubicacion _ubicacionParaDia_5 = this.auto.ubicacionParaDia(_nuevaFecha_5);
    Assert.assertEquals(this.aeroparque, _ubicacionParaDia_5);
    Date _nuevaFecha_6 = DateExtensions.nuevaFecha(2015, 03, 11);
    Ubicacion _ubicacionParaDia_6 = this.auto.ubicacionParaDia(_nuevaFecha_6);
    Assert.assertEquals(this.retiro, _ubicacionParaDia_6);
    Date _nuevaFecha_7 = DateExtensions.nuevaFecha(2015, 03, 11);
    Ubicacion _ubicacionParaDia_7 = this.auto.ubicacionParaDia(_nuevaFecha_7);
    Assert.assertEquals(this.retiro, _ubicacionParaDia_7);
  }
}
