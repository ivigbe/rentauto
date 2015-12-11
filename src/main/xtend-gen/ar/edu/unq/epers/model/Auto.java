package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Categoria;
import ar.edu.unq.epers.model.Reserva;
import ar.edu.unq.epers.model.Ubicacion;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.common.base.Objects;
import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.mongojack.ObjectId;

@Accessors
@SuppressWarnings("all")
public class Auto {
  private String marca;
  
  private String modelo;
  
  private Integer año;
  
  private String patente;
  
  private Double costoBase;
  
  private Categoria categoria;
  
  @ObjectId
  @JsonProperty("_id")
  private Integer autoId;
  
  private List<Reserva> reservas = CollectionLiterals.<Reserva>newArrayList();
  
  private Ubicacion ubicacionInicial;
  
  public Auto() {
  }
  
  public Auto(final String marca, final String modelo, final Integer anio, final String patente, final Categoria categoria, final Double costoBase, final Ubicacion ubicacionInicial) {
    this.marca = marca;
    this.modelo = modelo;
    this.año = anio;
    this.patente = patente;
    this.costoBase = costoBase;
    this.categoria = categoria;
    this.ubicacionInicial = ubicacionInicial;
  }
  
  public Ubicacion getUbicacion() {
    Date _date = new Date();
    return this.ubicacionParaDia(_date);
  }
  
  public Ubicacion ubicacionParaDia(final Date unDia) {
    Ubicacion _xblockexpression = null;
    {
      final Function1<Reserva, Boolean> _function = new Function1<Reserva, Boolean>() {
        @Override
        public Boolean apply(final Reserva it) {
          Date _fin = it.getFin();
          return Boolean.valueOf((_fin.compareTo(unDia) <= 0));
        }
      };
      final Reserva encontrado = IterableExtensions.<Reserva>findLast(this.reservas, _function);
      Ubicacion _xifexpression = null;
      boolean _notEquals = (!Objects.equal(encontrado, null));
      if (_notEquals) {
        _xifexpression = encontrado.getDestino();
      } else {
        _xifexpression = this.ubicacionInicial;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public Boolean estaLibre(final Date desde, final Date hasta) {
    final Function1<Reserva, Boolean> _function = new Function1<Reserva, Boolean>() {
      @Override
      public Boolean apply(final Reserva it) {
        boolean _seSuperpone = it.seSuperpone(desde, hasta);
        return Boolean.valueOf((!_seSuperpone));
      }
    };
    return Boolean.valueOf(IterableExtensions.<Reserva>forall(this.reservas, _function));
  }
  
  public List<Reserva> agregarReserva(final Reserva reserva) {
    List<Reserva> _xblockexpression = null;
    {
      reserva.validar();
      this.reservas.add(reserva);
      final Function1<Reserva, Date> _function = new Function1<Reserva, Date>() {
        @Override
        public Date apply(final Reserva it) {
          return it.getInicio();
        }
      };
      _xblockexpression = ListExtensions.<Reserva, Date>sortInplaceBy(this.reservas, _function);
    }
    return _xblockexpression;
  }
  
  public Double costoTotal() {
    return this.categoria.calcularCosto(this);
  }
  
  @Override
  public boolean equals(final Object object) {
    boolean _xblockexpression = false;
    {
      final Auto otroAauto = ((Auto) object);
      boolean _and = false;
      boolean _notEquals = (!Objects.equal(otroAauto, null));
      if (!_notEquals) {
        _and = false;
      } else {
        boolean _equals = Objects.equal(otroAauto.autoId, this.autoId);
        _and = _equals;
      }
      _xblockexpression = _and;
    }
    return _xblockexpression;
  }
  
  @Pure
  public String getMarca() {
    return this.marca;
  }
  
  public void setMarca(final String marca) {
    this.marca = marca;
  }
  
  @Pure
  public String getModelo() {
    return this.modelo;
  }
  
  public void setModelo(final String modelo) {
    this.modelo = modelo;
  }
  
  @Pure
  public Integer getAño() {
    return this.año;
  }
  
  public void setAño(final Integer año) {
    this.año = año;
  }
  
  @Pure
  public String getPatente() {
    return this.patente;
  }
  
  public void setPatente(final String patente) {
    this.patente = patente;
  }
  
  @Pure
  public Double getCostoBase() {
    return this.costoBase;
  }
  
  public void setCostoBase(final Double costoBase) {
    this.costoBase = costoBase;
  }
  
  @Pure
  public Categoria getCategoria() {
    return this.categoria;
  }
  
  public void setCategoria(final Categoria categoria) {
    this.categoria = categoria;
  }
  
  @Pure
  public Integer getAutoId() {
    return this.autoId;
  }
  
  public void setAutoId(final Integer autoId) {
    this.autoId = autoId;
  }
  
  @Pure
  public List<Reserva> getReservas() {
    return this.reservas;
  }
  
  public void setReservas(final List<Reserva> reservas) {
    this.reservas = reservas;
  }
  
  @Pure
  public Ubicacion getUbicacionInicial() {
    return this.ubicacionInicial;
  }
  
  public void setUbicacionInicial(final Ubicacion ubicacionInicial) {
    this.ubicacionInicial = ubicacionInicial;
  }
}
