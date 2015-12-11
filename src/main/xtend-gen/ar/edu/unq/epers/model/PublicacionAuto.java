package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.CalificacionAuto;
import ar.edu.unq.epers.model.NivelVisibilidadAuto;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtend.lib.annotations.EqualsHashCode;
import org.eclipse.xtext.xbase.lib.Pure;
import org.mongojack.ObjectId;

@Accessors
@EqualsHashCode
@SuppressWarnings("all")
public class PublicacionAuto {
  @ObjectId
  @JsonProperty("_id")
  private String id;
  
  private String comentario;
  
  private String nombreDeUsuario;
  
  private Integer numeroSolicitudDeUnaReserva;
  
  private CalificacionAuto calificacion;
  
  private NivelVisibilidadAuto visibilidad;
  
  public PublicacionAuto() {
  }
  
  public PublicacionAuto(final String unComentario, final String unNombreUsuario, final Integer unNumeroReserva, final CalificacionAuto unaCalificacion, final NivelVisibilidadAuto unaPrivacidad) {
    this.comentario = unComentario;
    this.nombreDeUsuario = unNombreUsuario;
    this.numeroSolicitudDeUnaReserva = unNumeroReserva;
    this.calificacion = unaCalificacion;
    this.visibilidad = unaPrivacidad;
  }
  
  @Pure
  public String getId() {
    return this.id;
  }
  
  public void setId(final String id) {
    this.id = id;
  }
  
  @Pure
  public String getComentario() {
    return this.comentario;
  }
  
  public void setComentario(final String comentario) {
    this.comentario = comentario;
  }
  
  @Pure
  public String getNombreDeUsuario() {
    return this.nombreDeUsuario;
  }
  
  public void setNombreDeUsuario(final String nombreDeUsuario) {
    this.nombreDeUsuario = nombreDeUsuario;
  }
  
  @Pure
  public Integer getNumeroSolicitudDeUnaReserva() {
    return this.numeroSolicitudDeUnaReserva;
  }
  
  public void setNumeroSolicitudDeUnaReserva(final Integer numeroSolicitudDeUnaReserva) {
    this.numeroSolicitudDeUnaReserva = numeroSolicitudDeUnaReserva;
  }
  
  @Pure
  public CalificacionAuto getCalificacion() {
    return this.calificacion;
  }
  
  public void setCalificacion(final CalificacionAuto calificacion) {
    this.calificacion = calificacion;
  }
  
  @Pure
  public NivelVisibilidadAuto getVisibilidad() {
    return this.visibilidad;
  }
  
  public void setVisibilidad(final NivelVisibilidadAuto visibilidad) {
    this.visibilidad = visibilidad;
  }
  
  @Override
  @Pure
  public boolean equals(final Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    PublicacionAuto other = (PublicacionAuto) obj;
    if (this.id == null) {
      if (other.id != null)
        return false;
    } else if (!this.id.equals(other.id))
      return false;
    if (this.comentario == null) {
      if (other.comentario != null)
        return false;
    } else if (!this.comentario.equals(other.comentario))
      return false;
    if (this.nombreDeUsuario == null) {
      if (other.nombreDeUsuario != null)
        return false;
    } else if (!this.nombreDeUsuario.equals(other.nombreDeUsuario))
      return false;
    if (this.numeroSolicitudDeUnaReserva == null) {
      if (other.numeroSolicitudDeUnaReserva != null)
        return false;
    } else if (!this.numeroSolicitudDeUnaReserva.equals(other.numeroSolicitudDeUnaReserva))
      return false;
    if (this.calificacion == null) {
      if (other.calificacion != null)
        return false;
    } else if (!this.calificacion.equals(other.calificacion))
      return false;
    if (this.visibilidad == null) {
      if (other.visibilidad != null)
        return false;
    } else if (!this.visibilidad.equals(other.visibilidad))
      return false;
    return true;
  }
  
  @Override
  @Pure
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((this.id== null) ? 0 : this.id.hashCode());
    result = prime * result + ((this.comentario== null) ? 0 : this.comentario.hashCode());
    result = prime * result + ((this.nombreDeUsuario== null) ? 0 : this.nombreDeUsuario.hashCode());
    result = prime * result + ((this.numeroSolicitudDeUnaReserva== null) ? 0 : this.numeroSolicitudDeUnaReserva.hashCode());
    result = prime * result + ((this.calificacion== null) ? 0 : this.calificacion.hashCode());
    result = prime * result + ((this.visibilidad== null) ? 0 : this.visibilidad.hashCode());
    return result;
  }
}
