package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.Collection;
import ar.edu.unq.epers.homes.HomePublicacion;
import ar.edu.unq.epers.homes.HomeUsuario;
import ar.edu.unq.epers.model.CalificacionAuto;
import ar.edu.unq.epers.model.Mensaje;
import ar.edu.unq.epers.model.NivelVisibilidadAuto;
import ar.edu.unq.epers.model.PublicacionAuto;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.Usuario;
import ar.edu.unq.epers.services.ServicioRedSocial;
import ar.edu.unq.epers.services.ServicioUsuario;
import java.util.Date;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mongojack.JacksonDBCollection;

@SuppressWarnings("all")
public class TestServicioRedSocial {
  private Usuario u1;
  
  private Usuario u2;
  
  private Usuario u3;
  
  private Usuario u4;
  
  private Mensaje m;
  
  private ServicioUsuario service;
  
  private HomeUsuario home;
  
  private ServicioRedSocial redSocial;
  
  private HomePublicacion perfil;
  
  private PublicacionAuto publicacionPrivada;
  
  private PublicacionAuto publicacionPublica;
  
  private PublicacionAuto publicacionPublicaU1;
  
  private PublicacionAuto publicacionPublicaU4;
  
  private PublicacionAuto publicacionAmigos;
  
  private Reserva r1;
  
  private Reserva r2;
  
  private Reserva r3;
  
  @Before
  public void setUp() {
    Date _date = new Date();
    Usuario _usuario = new Usuario("Homero", "Simpson", "fv", "1234", "homero@gmail.com", _date);
    this.u1 = _usuario;
    Date _date_1 = new Date();
    Usuario _usuario_1 = new Usuario("Bart", "Simpson", "ib", "3456", "bart@gmail.com", _date_1);
    this.u2 = _usuario_1;
    Date _date_2 = new Date();
    Usuario _usuario_2 = new Usuario("Lisa", "Simpson", "jp", "4567", "lisa@gmail.com", _date_2);
    this.u3 = _usuario_2;
    Date _date_3 = new Date();
    Usuario _usuario_3 = new Usuario("Marge", "Simpson", "ManoloPerez", "7812", "marge@gmail.com", _date_3);
    this.u4 = _usuario_3;
    Mensaje _mensaje = new Mensaje("Hola Mundo!");
    this.m = _mensaje;
    HomePublicacion _homePublicacion = new HomePublicacion();
    this.perfil = _homePublicacion;
    ServicioRedSocial _servicioRedSocial = new ServicioRedSocial(this.perfil);
    this.redSocial = _servicioRedSocial;
    HomeUsuario _homeUsuario = new HomeUsuario();
    this.home = _homeUsuario;
    ServicioUsuario _servicioUsuario = new ServicioUsuario(this.home, this.redSocial);
    this.service = _servicioUsuario;
    this.service.guardarUsuario(this.u1);
    this.service.guardarUsuario(this.u2);
    this.service.guardarUsuario(this.u3);
    this.service.guardarUsuario(this.u4);
    this.redSocial.agregarComoAmigo(this.u1, this.u2);
    this.redSocial.agregarComoAmigo(this.u2, this.u3);
    this.redSocial.agregarComoAmigo(this.u2, this.u4);
    this.redSocial.enviarMensajeA(this.u2, this.u4, this.m);
    Reserva _reserva = new Reserva(Integer.valueOf(1));
    this.r1 = _reserva;
    Reserva _reserva_1 = new Reserva(Integer.valueOf(2));
    this.r2 = _reserva_1;
    Reserva _reserva_2 = new Reserva(Integer.valueOf(3));
    this.r3 = _reserva_2;
    String _nombreUsuario = this.u2.getNombreUsuario();
    Integer _numeroSolicitud = this.r1.getNumeroSolicitud();
    PublicacionAuto _publicacionAuto = new PublicacionAuto("malisimo el auto", _nombreUsuario, _numeroSolicitud, 
      CalificacionAuto.MALO, NivelVisibilidadAuto.PUBLICO);
    this.publicacionPublica = _publicacionAuto;
    String _nombreUsuario_1 = this.u1.getNombreUsuario();
    Integer _numeroSolicitud_1 = this.r1.getNumeroSolicitud();
    PublicacionAuto _publicacionAuto_1 = new PublicacionAuto("muy buena atencion", _nombreUsuario_1, _numeroSolicitud_1, 
      CalificacionAuto.BUENO, NivelVisibilidadAuto.PUBLICO);
    this.publicacionPublicaU1 = _publicacionAuto_1;
    String _nombreUsuario_2 = this.u4.getNombreUsuario();
    Integer _numeroSolicitud_2 = this.r2.getNumeroSolicitud();
    PublicacionAuto _publicacionAuto_2 = new PublicacionAuto("mala la atencion", _nombreUsuario_2, _numeroSolicitud_2, 
      CalificacionAuto.MALO, NivelVisibilidadAuto.PUBLICO);
    this.publicacionPublicaU4 = _publicacionAuto_2;
    String _nombreUsuario_3 = this.u2.getNombreUsuario();
    Integer _numeroSolicitud_3 = this.r2.getNumeroSolicitud();
    PublicacionAuto _publicacionAuto_3 = new PublicacionAuto("me lo guardo", _nombreUsuario_3, _numeroSolicitud_3, 
      CalificacionAuto.REGULAR, NivelVisibilidadAuto.PRIVADO);
    this.publicacionPrivada = _publicacionAuto_3;
    String _nombreUsuario_4 = this.u2.getNombreUsuario();
    Integer _numeroSolicitud_4 = this.r3.getNumeroSolicitud();
    PublicacionAuto _publicacionAuto_4 = new PublicacionAuto("solo para amigos", _nombreUsuario_4, _numeroSolicitud_4, 
      CalificacionAuto.EXCELENTE, NivelVisibilidadAuto.SOLOAMIGOS);
    this.publicacionAmigos = _publicacionAuto_4;
    this.redSocial.ingresarPublicacionReserva(this.publicacionPublica);
    this.redSocial.ingresarPublicacionReserva(this.publicacionPrivada);
    this.redSocial.ingresarPublicacionReserva(this.publicacionAmigos);
    this.redSocial.ingresarPublicacionReserva(this.publicacionPublicaU1);
    this.redSocial.ingresarPublicacionReserva(this.publicacionPublicaU4);
  }
  
  @Test
  public void testObtengoAMisAmigos() {
    final Set<Usuario> amigosU1 = this.redSocial.obtenerAmigos(this.u1);
    final Set<Usuario> amigosU2 = this.redSocial.obtenerAmigos(this.u2);
    String _nombreUsuario = this.u2.getNombreUsuario();
    Usuario _head = IterableExtensions.<Usuario>head(amigosU1);
    String _nombreUsuario_1 = _head.getNombreUsuario();
    Assert.assertEquals(_nombreUsuario, _nombreUsuario_1);
    String _nombreUsuario_2 = this.u4.getNombreUsuario();
    Usuario _head_1 = IterableExtensions.<Usuario>head(amigosU2);
    String _nombreUsuario_3 = _head_1.getNombreUsuario();
    Assert.assertEquals(_nombreUsuario_2, _nombreUsuario_3);
  }
  
  @Test
  public void testPreguntoSiSonAmigos() {
    Boolean _sonAmigos = this.redSocial.sonAmigos(this.u2, this.u3);
    Assert.assertTrue((_sonAmigos).booleanValue());
  }
  
  @Test
  public void testMandoMsjeAMisAmigos() {
    final Set<Mensaje> mensajesU2 = this.redSocial.obtenerMensajesEnviados(this.u2);
    boolean _contains = mensajesU2.contains(this.m);
    Assert.assertTrue(_contains);
  }
  
  @Test
  public void testVeoMsjeDeMisAmigos() {
    final Set<Mensaje> mensajesU4 = this.redSocial.obtenerMensajesRecibidos(this.u4);
    boolean _contains = mensajesU4.contains(this.m);
    Assert.assertTrue(_contains);
  }
  
  @Test
  public void testObtengoAmigosDeMisAmigos() {
    final Set<Usuario> conectadasU1 = this.redSocial.obtenerPersonasConectadas(this.u1);
    boolean _contains = conectadasU1.contains(this.u2);
    Assert.assertTrue(_contains);
    boolean _contains_1 = conectadasU1.contains(this.u3);
    Assert.assertTrue(_contains_1);
    boolean _contains_2 = conectadasU1.contains(this.u4);
    Assert.assertTrue(_contains_2);
  }
  
  @Test
  public void testCalificoUnAutoQueAlquileExcelente() {
    List<PublicacionAuto> _verPublicaciones = this.redSocial.verPublicaciones(this.u2, this.u2);
    boolean _contains = _verPublicaciones.contains(this.publicacionPrivada);
    Assert.assertTrue(_contains);
  }
  
  @Test
  public void testEstablezcoUnNivelDeVisibilidadAUnaPublicacion() {
    NivelVisibilidadAuto _visibilidad = this.publicacionAmigos.getVisibilidad();
    Assert.assertEquals(NivelVisibilidadAuto.SOLOAMIGOS, _visibilidad);
  }
  
  @Test
  public void testUnUsuarioVeElPerfilDeUnUsuarioAmigo() {
    final List<PublicacionAuto> publicaciones = this.redSocial.verPublicaciones(this.u1, this.u2);
    boolean _contains = publicaciones.contains(this.publicacionAmigos);
    Assert.assertTrue(_contains);
    boolean _contains_1 = publicaciones.contains(this.publicacionPublica);
    Assert.assertTrue(_contains_1);
    boolean _contains_2 = publicaciones.contains(this.publicacionPrivada);
    Assert.assertFalse(_contains_2);
  }
  
  @Test
  public void testUnUsuarioVeElPerfilDeUnUsuarioDelQueNoEsAmigo() {
    final List<PublicacionAuto> publicaciones = this.redSocial.verPublicaciones(this.u1, this.u4);
    boolean _contains = publicaciones.contains(this.publicacionPublicaU4);
    Assert.assertTrue(_contains);
    boolean _contains_1 = publicaciones.contains(this.publicacionPublicaU1);
    Assert.assertFalse(_contains_1);
  }
  
  @After
  public void cleanDB() {
    Collection<PublicacionAuto> _homePublicacion = this.perfil.getHomePublicacion();
    JacksonDBCollection<PublicacionAuto, String> _mongoCollection = _homePublicacion.getMongoCollection();
    _mongoCollection.drop();
  }
}
