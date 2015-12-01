package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.homes.HomeProvider;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Ubicacion;
import ar.edu.unq.epers.services.ServicioUbicacion;
import com.google.common.base.Objects;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestServicioUbicacion {
  private GenericHome<Ubicacion> home;
  
  private Ubicacion ubicacion;
  
  private ServicioUbicacion serviceHome;
  
  @Before
  public void setUp() {
    GenericHome<Ubicacion> _ubicacionHome = HomeProvider.getUbicacionHome();
    this.home = _ubicacionHome;
    Ubicacion _ubicacion = new Ubicacion("Neuquen");
    this.ubicacion = _ubicacion;
    ServicioUbicacion _servicioUbicacion = new ServicioUbicacion(this.home);
    this.serviceHome = _servicioUbicacion;
    this.serviceHome.guardarUbicacion(this.ubicacion);
  }
  
  @Test
  public void testGuardoUnaUbicacion() {
    Integer _ubicacionId = this.ubicacion.getUbicacionId();
    final Ubicacion res = this.serviceHome.getUbicacionPorId((_ubicacionId).intValue());
    Integer _ubicacionId_1 = res.getUbicacionId();
    Integer _ubicacionId_2 = this.ubicacion.getUbicacionId();
    boolean _equals = Objects.equal(_ubicacionId_1, _ubicacionId_2);
    Assert.assertTrue(_equals);
  }
  
  @After
  public void limpiar() {
    SessionManager.resetSessionFactory();
  }
}
