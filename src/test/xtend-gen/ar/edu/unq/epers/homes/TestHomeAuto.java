package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.homes.HomeAuto;
import ar.edu.unq.epers.homes.HomeProvider;
import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Ubicacion;
import org.junit.Before;
import org.mockito.Mockito;
import org.mockito.stubbing.OngoingStubbing;

@SuppressWarnings("all")
public class TestHomeAuto {
  private Auto auto;
  
  private GenericHome<Auto> home;
  
  private Categoria categoriaVehiculo;
  
  private Ubicacion ubicacion;
  
  @Before
  public void setUp() {
    HomeAuto _autoHome = HomeProvider.getAutoHome();
    this.home = _autoHome;
    Categoria _mock = Mockito.<Categoria>mock(Categoria.class);
    this.categoriaVehiculo = _mock;
    String _nombre = this.categoriaVehiculo.getNombre();
    OngoingStubbing<String> _when = Mockito.<String>when(_nombre);
    _when.thenReturn("Familiar");
    Ubicacion _mock_1 = Mockito.<Ubicacion>mock(Ubicacion.class);
    this.ubicacion = _mock_1;
    String _nombre_1 = this.ubicacion.getNombre();
    OngoingStubbing<String> _when_1 = Mockito.<String>when(_nombre_1);
    _when_1.thenReturn("Retiro");
    Auto _auto = new Auto("Kia", "H5", Integer.valueOf(2009), "xls550", this.categoriaVehiculo, Double.valueOf(15000.0), this.ubicacion);
    this.auto = _auto;
  }
}
