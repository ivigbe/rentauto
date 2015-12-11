package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Empresa;
import ar.edu.unq.epers.model.Familiar;
import ar.edu.unq.epers.model.Ubicacion;
import ar.edu.unq.epers.model.Usuario;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Before;
import org.mockito.Mockito;

@SuppressWarnings("all")
public class AbstractTest {
  protected Auto auto;
  
  protected Categoria categoriaFamiliar;
  
  protected Ubicacion retiro;
  
  protected Ubicacion aeroparque;
  
  protected Usuario usuarioPrueba;
  
  protected Usuario usuarioEmpresa;
  
  protected Empresa empresa;
  
  @Before
  public void setUp() {
    Familiar _familiar = new Familiar();
    this.categoriaFamiliar = _familiar;
    Ubicacion _ubicacion = new Ubicacion("Retiro");
    this.retiro = _ubicacion;
    Ubicacion _ubicacion_1 = new Ubicacion("Aeroparque");
    this.aeroparque = _ubicacion_1;
    Auto _auto = new Auto("Peugeot", "505", Integer.valueOf(1990), "XXX123", this.categoriaFamiliar, Double.valueOf(100D), this.retiro);
    this.auto = _auto;
    Usuario _mock = Mockito.<Usuario>mock(Usuario.class);
    this.usuarioPrueba = _mock;
    Usuario _mock_1 = Mockito.<Usuario>mock(Usuario.class);
    this.usuarioEmpresa = _mock_1;
    Empresa _empresa = new Empresa();
    final Procedure1<Empresa> _function = new Procedure1<Empresa>() {
      @Override
      public void apply(final Empresa it) {
        it.setCuit("30-11223344-90");
        it.setNombreEmpresa("Empresa Fantasmita");
        it.setCantidadMaximaDeReservasActivas(2);
        it.setValorMaximoPorDia(Double.valueOf(1000D));
      }
    };
    Empresa _doubleArrow = ObjectExtensions.<Empresa>operator_doubleArrow(_empresa, _function);
    this.empresa = _doubleArrow;
    List<Usuario> _usuarios = this.empresa.getUsuarios();
    _usuarios.add(this.usuarioEmpresa);
  }
}
