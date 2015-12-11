package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.HomeAuto;
import ar.edu.unq.epers.homes.HomeProvider;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.Turismo;
import ar.edu.unq.epers.model.Ubicacion;
import ar.edu.unq.epers.model.Usuario;
import ar.edu.unq.epers.services.ServicioAuto;
import com.google.common.base.Objects;
import java.util.Date;
import java.util.List;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestServicioAuto {
  private HomeAuto home;
  
  private ServicioAuto serviceAuto;
  
  private Categoria categoriaVehiculo = new Turismo();
  
  private Ubicacion uInicial = new Ubicacion("Capital");
  
  private Ubicacion uDestino = new Ubicacion("Villa 31");
  
  private Auto auto1 = new Auto("Ford", "Focus", Integer.valueOf(2010), "xls500", this.categoriaVehiculo, Double.valueOf(15000.0), this.uInicial);
  
  private Date fechaReservaInicio;
  
  private Date fechaReservaFin;
  
  private Reserva unaReserva;
  
  private Usuario unUsuario = new Usuario();
  
  private Auto auto2 = new Auto("Fiat", "Uno", Integer.valueOf(2011), "tle189", this.categoriaVehiculo, Double.valueOf(60000.0), this.uInicial);
  
  @Before
  public void setUp() {
    HomeAuto _autoHome = HomeProvider.getAutoHome();
    this.home = _autoHome;
    Date _date = new Date(2015, 20, 5);
    this.fechaReservaInicio = _date;
    Date _date_1 = new Date(2015, 20, 6);
    this.fechaReservaFin = _date_1;
    Reserva _reserva = new Reserva(Integer.valueOf(2), this.uInicial, this.uDestino, this.fechaReservaInicio, this.fechaReservaFin, this.auto2, this.unUsuario);
    this.unaReserva = _reserva;
    this.auto2.agregarReserva(this.unaReserva);
    ServicioAuto _servicioAuto = new ServicioAuto(this.home);
    this.serviceAuto = _servicioAuto;
    this.serviceAuto.guardarAuto(this.auto1);
    this.serviceAuto.guardarAuto(this.auto2);
  }
  
  @Test
  public void testGuardarAuto() {
    Integer _autoId = this.auto2.getAutoId();
    Auto _autoPorId = this.serviceAuto.getAutoPorId((_autoId).intValue());
    boolean _equals = Objects.equal(_autoPorId, this.auto2);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void testObtengoAutosPorUbicacion() {
    final List<Auto> autosPorUbicacion = this.serviceAuto.autosPorUbicacion(this.uInicial);
    int _size = autosPorUbicacion.size();
    Assert.assertEquals(_size, 2);
  }
  
  @Test
  public void testObtengoAutosPorCategoria() {
    final List<Auto> autosPorCategoria = this.serviceAuto.autosPorCategoria(this.categoriaVehiculo);
    int _size = autosPorCategoria.size();
    boolean _equals = (_size == 2);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void testObtengoAutosPorMarca() {
    String _marca = this.auto1.getMarca();
    final List<Auto> autosPorMarca = this.serviceAuto.autosPorMarca(_marca);
    int _size = autosPorMarca.size();
    boolean _equals = (_size == 1);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void testAutosDisponiblesParaReserva() {
    final List<Auto> disponibles = this.serviceAuto.disponibilidadDeAutos(this.uInicial, this.fechaReservaInicio, this.fechaReservaFin);
    int _size = disponibles.size();
    boolean _equals = (_size == 1);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void testAutosConReservaDisponibles() {
    final List<Auto> disponibles = this.serviceAuto.disponibilidadDeAutos(this.uDestino, this.fechaReservaInicio, this.fechaReservaFin);
    int _size = disponibles.size();
    boolean _equals = (_size == 0);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void testParaSaberPor() {
    Date _date = new Date(2015, 22, 6);
    Date _date_1 = new Date(2015, 30, 6);
    final List<Auto> disponibles = this.serviceAuto.obtenerAutosPor(this.uInicial, this.uDestino, _date, _date_1, this.categoriaVehiculo);
    int _size = disponibles.size();
    boolean _equals = (_size == 1);
    Assert.assertTrue(_equals);
    boolean _contains = disponibles.contains(this.auto1);
    Assert.assertTrue(_contains);
  }
  
  @After
  public void limpiar() {
    SessionManager.resetSessionFactory();
  }
}
