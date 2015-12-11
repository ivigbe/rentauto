package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.HomeReserva;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Deportivo;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.Ubicacion;
import ar.edu.unq.epers.model.Usuario;
import ar.edu.unq.epers.services.ServicioReserva;
import com.google.common.base.Objects;
import java.util.Date;
import java.util.List;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestServicioReserva {
  private HomeReserva home;
  
  private ServicioReserva serviceReserva;
  
  private Reserva unaReserva;
  
  private Ubicacion uOrigen;
  
  private Ubicacion uDestino;
  
  private Date finicio;
  
  private Date fechaFin;
  
  private Auto auto;
  
  private Usuario usuario;
  
  private Categoria cateroriaVehiculo;
  
  @Before
  public void setUp() {
    HomeReserva _homeReserva = new HomeReserva();
    this.home = _homeReserva;
    Ubicacion _ubicacion = new Ubicacion("Quilmes");
    this.uOrigen = _ubicacion;
    Ubicacion _ubicacion_1 = new Ubicacion("Puerto Madero");
    this.uDestino = _ubicacion_1;
    Date _date = new Date();
    this.finicio = _date;
    Date _date_1 = new Date();
    this.fechaFin = _date_1;
    Usuario _usuario = new Usuario();
    this.usuario = _usuario;
    Deportivo _deportivo = new Deportivo();
    this.cateroriaVehiculo = _deportivo;
    Auto _auto = new Auto("Mazda", "RX", Integer.valueOf(2009), "xxx123", this.cateroriaVehiculo, Double.valueOf(120000.0), this.uOrigen);
    this.auto = _auto;
    Reserva _reserva = new Reserva(Integer.valueOf(1), this.uOrigen, this.uDestino, this.finicio, this.fechaFin, this.auto, this.usuario);
    this.unaReserva = _reserva;
    ServicioReserva _servicioReserva = new ServicioReserva(this.home);
    this.serviceReserva = _servicioReserva;
    this.serviceReserva.guardarReserva(this.unaReserva);
    this.serviceReserva.hacerReserva(this.unaReserva);
  }
  
  @Test
  public void testGuardarReserva() {
    Integer _reservaId = this.unaReserva.getReservaId();
    final Reserva res = this.serviceReserva.getReservaPorId((_reservaId).intValue());
    Integer _reservaId_1 = res.getReservaId();
    Integer _reservaId_2 = this.unaReserva.getReservaId();
    boolean _equals = Objects.equal(_reservaId_1, _reservaId_2);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void testHacerReserva() {
    List<Reserva> _reservas = this.auto.getReservas();
    boolean _contains = _reservas.contains(this.unaReserva);
    Assert.assertTrue(_contains);
  }
  
  @After
  public void limpiar() {
    SessionManager.resetSessionFactory();
  }
}
