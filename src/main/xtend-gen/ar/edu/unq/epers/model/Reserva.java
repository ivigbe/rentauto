package ar.edu.unq.epers.model;

import ar.edu.unq.epers.extensions.DateExtensions;
import ar.edu.unq.epers.model.Auto;
import ar.edu.unq.epers.model.ReservaException;
import ar.edu.unq.epers.model.Ubicacion;
import ar.edu.unq.epers.model.Usuario;
import com.google.common.base.Objects;
import java.util.Date;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.DateTime;
import org.joda.time.Days;

@Accessors
@SuppressWarnings("all")
public class Reserva {
  private Integer numeroSolicitud;
  
  private Ubicacion origen;
  
  private Ubicacion destino;
  
  private Date inicio;
  
  private Date fin;
  
  private Auto auto;
  
  private Usuario usuario;
  
  private Integer reservaId;
  
  public Reserva() {
  }
  
  public Reserva(final Integer n) {
    this.numeroSolicitud = n;
  }
  
  public Reserva(final Integer numeroSoli, final Ubicacion ori, final Ubicacion des, final Date fechaI, final Date fechaF, final Auto au, final Usuario user) {
    this.numeroSolicitud = numeroSoli;
    this.origen = ori;
    this.destino = des;
    this.inicio = fechaI;
    this.fin = fechaF;
    this.auto = au;
    this.usuario = user;
  }
  
  public double costo() {
    DateTime _dateTime = new DateTime(this.inicio);
    DateTime _dateTime_1 = new DateTime(this.fin);
    Days _daysBetween = Days.daysBetween(_dateTime, _dateTime_1);
    final int cantidadDeDias = _daysBetween.getDays();
    Double _costoTotal = this.auto.costoTotal();
    return (cantidadDeDias * (_costoTotal).doubleValue());
  }
  
  public void validar() {
    final Ubicacion ubicacionInicial = this.auto.ubicacionParaDia(this.inicio);
    boolean _notEquals = (!Objects.equal(ubicacionInicial, this.origen));
    if (_notEquals) {
      throw new ReservaException("El auto no tiene la ubicación de origen buscada");
    }
    Boolean _estaLibre = this.auto.estaLibre(this.inicio, this.fin);
    boolean _not = (!(_estaLibre).booleanValue());
    if (_not) {
      throw new ReservaException("El auto no esta libre en el periodo pedido");
    }
  }
  
  public boolean isActiva() {
    boolean _and = false;
    Date _hoy = DateExtensions.hoy();
    boolean _lessEqualsThan = (this.inicio.compareTo(_hoy) <= 0);
    if (!_lessEqualsThan) {
      _and = false;
    } else {
      Date _hoy_1 = DateExtensions.hoy();
      boolean _lessEqualsThan_1 = (_hoy_1.compareTo(this.fin) <= 0);
      _and = _lessEqualsThan_1;
    }
    return _and;
  }
  
  public boolean seSuperpone(final Date desde, final Date hasta) {
    boolean _and = false;
    boolean _lessEqualsThan = (this.inicio.compareTo(desde) <= 0);
    if (!_lessEqualsThan) {
      _and = false;
    } else {
      boolean _lessEqualsThan_1 = (desde.compareTo(this.fin) <= 0);
      _and = _lessEqualsThan_1;
    }
    if (_and) {
      return true;
    }
    boolean _and_1 = false;
    boolean _lessEqualsThan_2 = (this.inicio.compareTo(hasta) <= 0);
    if (!_lessEqualsThan_2) {
      _and_1 = false;
    } else {
      boolean _lessEqualsThan_3 = (hasta.compareTo(this.fin) <= 0);
      _and_1 = _lessEqualsThan_3;
    }
    if (_and_1) {
      return true;
    }
    boolean _and_2 = false;
    boolean _lessEqualsThan_4 = (desde.compareTo(this.inicio) <= 0);
    if (!_lessEqualsThan_4) {
      _and_2 = false;
    } else {
      boolean _lessEqualsThan_5 = (this.fin.compareTo(hasta) <= 0);
      _and_2 = _lessEqualsThan_5;
    }
    if (_and_2) {
      return true;
    }
    return false;
  }
  
  public int costoPorDia() {
    return 0;
  }
  
  public boolean reservar() {
    boolean _xblockexpression = false;
    {
      this.auto.agregarReserva(this);
      _xblockexpression = this.usuario.agregarReserva(this);
    }
    return _xblockexpression;
  }
  
  @Pure
  public Integer getNumeroSolicitud() {
    return this.numeroSolicitud;
  }
  
  public void setNumeroSolicitud(final Integer numeroSolicitud) {
    this.numeroSolicitud = numeroSolicitud;
  }
  
  @Pure
  public Ubicacion getOrigen() {
    return this.origen;
  }
  
  public void setOrigen(final Ubicacion origen) {
    this.origen = origen;
  }
  
  @Pure
  public Ubicacion getDestino() {
    return this.destino;
  }
  
  public void setDestino(final Ubicacion destino) {
    this.destino = destino;
  }
  
  @Pure
  public Date getInicio() {
    return this.inicio;
  }
  
  public void setInicio(final Date inicio) {
    this.inicio = inicio;
  }
  
  @Pure
  public Date getFin() {
    return this.fin;
  }
  
  public void setFin(final Date fin) {
    this.fin = fin;
  }
  
  @Pure
  public Auto getAuto() {
    return this.auto;
  }
  
  public void setAuto(final Auto auto) {
    this.auto = auto;
  }
  
  @Pure
  public Usuario getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final Usuario usuario) {
    this.usuario = usuario;
  }
  
  @Pure
  public Integer getReservaId() {
    return this.reservaId;
  }
  
  public void setReservaId(final Integer reservaId) {
    this.reservaId = reservaId;
  }
}
