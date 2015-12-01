package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Usuario;
import java.sql.Date;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestUsuario {
  private Usuario u;
  
  @Before
  public void setUp() {
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      @Override
      public void apply(final Usuario it) {
        it.setNombre("Alejandro");
        it.setApellido("Lobos");
        it.setNombreUsuario("al");
        it.setEmail("alobos@gmail.com");
        Date _date = new Date(1980, 05, 10);
        it.setFechaNacimiento(_date);
        it.setPassword("lobos123");
        it.setValidado(Boolean.valueOf(false));
      }
    };
    Usuario _doubleArrow = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
    this.u = _doubleArrow;
  }
  
  @Test
  public void testValidar() {
    this.u.validar();
    Boolean _validado = this.u.getValidado();
    Assert.assertEquals(_validado, Boolean.valueOf(true));
  }
  
  @Test
  public void testUpdatePassword() {
    this.u.updatePassword("lobito");
    String _password = this.u.getPassword();
    Assert.assertEquals(_password, "lobito");
  }
}
