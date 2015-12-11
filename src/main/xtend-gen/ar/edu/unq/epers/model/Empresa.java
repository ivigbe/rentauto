package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.ReservaException;
import ar.edu.unq.epers.model.Usuario;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Empresa {
  private String cuit;
  
  private String nombreEmpresa;
  
  private List<Usuario> usuarios = CollectionLiterals.<Usuario>newArrayList();
  
  private List<Reserva> reservas = CollectionLiterals.<Reserva>newArrayList();
  
  private int cantidadMaximaDeReservasActivas;
  
  private Double valorMaximoPorDia;
  
  private List<Categoria> categoriasAdmitidas = CollectionLiterals.<Categoria>newArrayList();
  
  private Integer empresaId;
  
  public Empresa() {
  }
  
  public Empresa(final String cuit, final String nombreEmpresa, final Double valor, final int cant) {
    this.cuit = cuit;
    this.nombreEmpresa = nombreEmpresa;
    this.valorMaximoPorDia = valor;
    this.cantidadMaximaDeReservasActivas = cant;
  }
  
  public boolean agregarReserva(final Reserva unaReserva) {
    boolean _xblockexpression = false;
    {
      this.validarReserva(unaReserva);
      _xblockexpression = this.reservas.add(unaReserva);
    }
    return _xblockexpression;
  }
  
  public void validarReserva(final Reserva unaReserva) {
    Iterable<Reserva> _reservasActivas = this.reservasActivas();
    int _size = IterableExtensions.size(_reservasActivas);
    boolean _equals = (_size == this.cantidadMaximaDeReservasActivas);
    if (_equals) {
      throw new ReservaException("No se pueden tener más reservas para esta empresa");
    }
    int _costoPorDia = unaReserva.costoPorDia();
    boolean _greaterThan = (_costoPorDia > (this.valorMaximoPorDia).doubleValue());
    if (_greaterThan) {
      throw new ReservaException("El costo por dia excede el maximo de la empresa");
    }
    Usuario _usuario = unaReserva.getUsuario();
    boolean _contains = this.usuarios.contains(_usuario);
    boolean _not = (!_contains);
    if (_not) {
      throw new ReservaException("El usuario no pertenece a la empresa");
    }
    boolean _and = false;
    boolean _isEmpty = this.categoriasAdmitidas.isEmpty();
    boolean _not_1 = (!_isEmpty);
    if (!_not_1) {
      _and = false;
    } else {
      Auto _auto = unaReserva.getAuto();
      Categoria _categoria = _auto.getCategoria();
      boolean _contains_1 = this.categoriasAdmitidas.contains(_categoria);
      boolean _not_2 = (!_contains_1);
      _and = _not_2;
    }
    if (_and) {
      throw new ReservaException("La categoria no esta admitida por la empresa");
    }
  }
  
  public Iterable<Reserva> reservasActivas() {
    final Function1<Reserva, Boolean> _function = new Function1<Reserva, Boolean>() {
      @Override
      public Boolean apply(final Reserva it) {
        return Boolean.valueOf(it.isActiva());
      }
    };
    return IterableExtensions.<Reserva>filter(this.reservas, _function);
  }
  
  @Pure
  public String getCuit() {
    return this.cuit;
  }
  
  public void setCuit(final String cuit) {
    this.cuit = cuit;
  }
  
  @Pure
  public String getNombreEmpresa() {
    return this.nombreEmpresa;
  }
  
  public void setNombreEmpresa(final String nombreEmpresa) {
    this.nombreEmpresa = nombreEmpresa;
  }
  
  @Pure
  public List<Usuario> getUsuarios() {
    return this.usuarios;
  }
  
  public void setUsuarios(final List<Usuario> usuarios) {
    this.usuarios = usuarios;
  }
  
  @Pure
  public List<Reserva> getReservas() {
    return this.reservas;
  }
  
  public void setReservas(final List<Reserva> reservas) {
    this.reservas = reservas;
  }
  
  @Pure
  public int getCantidadMaximaDeReservasActivas() {
    return this.cantidadMaximaDeReservasActivas;
  }
  
  public void setCantidadMaximaDeReservasActivas(final int cantidadMaximaDeReservasActivas) {
    this.cantidadMaximaDeReservasActivas = cantidadMaximaDeReservasActivas;
  }
  
  @Pure
  public Double getValorMaximoPorDia() {
    return this.valorMaximoPorDia;
  }
  
  public void setValorMaximoPorDia(final Double valorMaximoPorDia) {
    this.valorMaximoPorDia = valorMaximoPorDia;
  }
  
  @Pure
  public List<Categoria> getCategoriasAdmitidas() {
    return this.categoriasAdmitidas;
  }
  
  public void setCategoriasAdmitidas(final List<Categoria> categoriasAdmitidas) {
    this.categoriasAdmitidas = categoriasAdmitidas;
  }
  
  @Pure
  public Integer getEmpresaId() {
    return this.empresaId;
  }
  
  public void setEmpresaId(final Integer empresaId) {
    this.empresaId = empresaId;
  }
}
