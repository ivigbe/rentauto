package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.HomeUsuario;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Usuario;
import ar.edu.unq.epers.services.ServicioUsuario;
import com.google.common.base.Objects;
import java.util.Date;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestServicioUsuario {
  private HomeUsuario home;
  
  private ServicioUsuario service;
  
  private Usuario u;
  
  private Usuario u2;
  
  private Usuario u3;
  
  private Usuario u4;
  
  @Before
  public void setUp() {
    Date _date = new Date();
    Usuario _usuario = new Usuario("Homero", "Simpson", "fv", "1234", "homero@gmail.com", _date);
    this.u = _usuario;
    Date _date_1 = new Date();
    Usuario _usuario_1 = new Usuario("Bart", "Simpson", "ib", "3456", "bart@gmail.com", _date_1);
    this.u2 = _usuario_1;
    Date _date_2 = new Date();
    Usuario _usuario_2 = new Usuario("Lisa", "Simpson", "jp", "4567", "lisa@gmail.com", _date_2);
    this.u3 = _usuario_2;
    Date _date_3 = new Date();
    Usuario _usuario_3 = new Usuario("Marge", "Simpson", "ManoloPerez", "7812", "marge@gmail.com", _date_3);
    this.u4 = _usuario_3;
    HomeUsuario _homeUsuario = new HomeUsuario();
    this.home = _homeUsuario;
    ServicioUsuario _servicioUsuario = new ServicioUsuario(this.home);
    this.service = _servicioUsuario;
    this.service.guardarUsuario(this.u);
    this.service.guardarUsuario(this.u2);
    this.service.guardarUsuario(this.u3);
    this.service.guardarUsuario(this.u4);
  }
  
  @Test
  public void testGuardarUsuario() {
    Integer _usuarioId = this.u.getUsuarioId();
    final Usuario usuario = this.service.getUsuarioPorId((_usuarioId).intValue());
    Integer _usuarioId_1 = this.u2.getUsuarioId();
    final Usuario usuario2 = this.service.getUsuarioPorId((_usuarioId_1).intValue());
    Integer _usuarioId_2 = this.u3.getUsuarioId();
    final Usuario usuario3 = this.service.getUsuarioPorId((_usuarioId_2).intValue());
    Integer _usuarioId_3 = this.u4.getUsuarioId();
    final Usuario usuario4 = this.service.getUsuarioPorId((_usuarioId_3).intValue());
    Integer _usuarioId_4 = usuario.getUsuarioId();
    Integer _usuarioId_5 = this.u.getUsuarioId();
    boolean _equals = Objects.equal(_usuarioId_4, _usuarioId_5);
    Assert.assertTrue(_equals);
    Integer _usuarioId_6 = usuario2.getUsuarioId();
    Integer _usuarioId_7 = this.u2.getUsuarioId();
    boolean _equals_1 = Objects.equal(_usuarioId_6, _usuarioId_7);
    Assert.assertTrue(_equals_1);
    Integer _usuarioId_8 = usuario3.getUsuarioId();
    Integer _usuarioId_9 = this.u3.getUsuarioId();
    boolean _equals_2 = Objects.equal(_usuarioId_8, _usuarioId_9);
    Assert.assertTrue(_equals_2);
    Integer _usuarioId_10 = usuario4.getUsuarioId();
    Integer _usuarioId_11 = this.u4.getUsuarioId();
    boolean _equals_3 = Objects.equal(_usuarioId_10, _usuarioId_11);
    Assert.assertTrue(_equals_3);
  }
  
  @After
  public void limpiar() {
    SessionManager.resetSessionFactory();
  }
}
