package ar.edu.unq.epers.services;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.homes.HomeProvider;
import ar.edu.unq.epers.homes.SessionManager;
import ar.edu.unq.epers.model.Empresa;
import ar.edu.unq.epers.services.ServicioEmpresa;
import com.google.common.base.Objects;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestServicioEmpresa {
  private GenericHome<Empresa> home;
  
  private ServicioEmpresa serviceEmpresa;
  
  private Empresa unaEmpresa;
  
  @Before
  public void setUp() {
    GenericHome<Empresa> _empresaHome = HomeProvider.getEmpresaHome();
    this.home = _empresaHome;
    Empresa _empresa = new Empresa("120", "Los Dragones magicos verdesColorados ", Double.valueOf(4.2), 3);
    this.unaEmpresa = _empresa;
    ServicioEmpresa _servicioEmpresa = new ServicioEmpresa(this.home);
    this.serviceEmpresa = _servicioEmpresa;
    this.serviceEmpresa.guardarEmpresa(this.unaEmpresa);
  }
  
  @Test
  public void testParaGuardarEmpresa() {
    Integer _empresaId = this.unaEmpresa.getEmpresaId();
    final Empresa res = this.serviceEmpresa.getEmpresaPorId((_empresaId).intValue());
    Integer _empresaId_1 = res.getEmpresaId();
    Integer _empresaId_2 = this.unaEmpresa.getEmpresaId();
    boolean _equals = Objects.equal(_empresaId_1, _empresaId_2);
    Assert.assertTrue(_equals);
  }
  
  @After
  public void limpiar() {
    SessionManager.resetSessionFactory();
  }
}
