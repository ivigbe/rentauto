package ar.edu.unq.epers.homes;

import ar.edu.unq.epers.homes.GenericHome;
import ar.edu.unq.epers.homes.HomeAuto;
import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Empresa;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.Ubicacion;
import ar.edu.unq.epers.model.Usuario;

@SuppressWarnings("all")
public class HomeProvider {
  public static HomeAuto getAutoHome() {
    return new HomeAuto();
  }
  
  public static GenericHome<Categoria> getCategoriaHome() {
    return new GenericHome<Categoria>(Categoria.class);
  }
  
  public static GenericHome<Ubicacion> getUbicacionHome() {
    return new GenericHome<Ubicacion>(Ubicacion.class);
  }
  
  public static GenericHome<Empresa> getEmpresaHome() {
    return new GenericHome<Empresa>(Empresa.class);
  }
  
  public static GenericHome<Usuario> getUsuarioHome() {
    return new GenericHome<Usuario>(Usuario.class);
  }
  
  public static GenericHome<Reserva> getReservaHome() {
    return new GenericHome<Reserva>(Reserva.class);
  }
}
