package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.Reserva;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;
import org.mongojack.ObjectId;

@Accessors
@SuppressWarnings("all")
public class Usuario {
  private String nombre;
  
  private String apellido;
  
  private String nombreUsuario;
  
  private String email;
  
  private Date fechaNacimiento;
  
  private String password;
  
  private Boolean validado;
  
  private List<Reserva> reservas = CollectionLiterals.<Reserva>newArrayList();
  
  @ObjectId
  @JsonProperty("_id")
  private Integer usuarioId;
  
  public Usuario() {
  }
  
  public Usuario(final String name, final String apell, final String nameUser, final String pass, final String email, final Date fechaNacimiento) {
    this.nombre = name;
    this.apellido = apell;
    this.nombreUsuario = nameUser;
    this.password = pass;
    this.email = email;
    this.fechaNacimiento = fechaNacimiento;
    ArrayList<Reserva> _arrayList = new ArrayList<Reserva>();
    this.reservas = _arrayList;
  }
  
  public Usuario(final String nameUser) {
    this.nombreUsuario = nameUser;
  }
  
  public Boolean validar() {
    return this.validado = Boolean.valueOf(true);
  }
  
  /**
   * Proposito: El usuario actualiza su password.
   */
  public String updatePassword(final String newPass) {
    return this.password = newPass;
  }
  
  public boolean agregarReserva(final Reserva unaReserva) {
    return this.reservas.add(unaReserva);
  }
  
  public List<Reserva> getReservas() {
    return this.reservas;
  }
  
  @Override
  public boolean equals(final Object u) {
    boolean _tripleEquals = (this == u);
    if (_tripleEquals) {
      return true;
    }
    if ((u instanceof Usuario)) {
      final Usuario other = ((Usuario) u);
      return Objects.equal(other.usuarioId, this.usuarioId);
    }
    return false;
  }
  
  @Override
  public int hashCode() {
    return this.usuarioId.hashCode();
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getApellido() {
    return this.apellido;
  }
  
  public void setApellido(final String apellido) {
    this.apellido = apellido;
  }
  
  @Pure
  public String getNombreUsuario() {
    return this.nombreUsuario;
  }
  
  public void setNombreUsuario(final String nombreUsuario) {
    this.nombreUsuario = nombreUsuario;
  }
  
  @Pure
  public String getEmail() {
    return this.email;
  }
  
  public void setEmail(final String email) {
    this.email = email;
  }
  
  @Pure
  public Date getFechaNacimiento() {
    return this.fechaNacimiento;
  }
  
  public void setFechaNacimiento(final Date fechaNacimiento) {
    this.fechaNacimiento = fechaNacimiento;
  }
  
  @Pure
  public String getPassword() {
    return this.password;
  }
  
  public void setPassword(final String password) {
    this.password = password;
  }
  
  @Pure
  public Boolean getValidado() {
    return this.validado;
  }
  
  public void setValidado(final Boolean validado) {
    this.validado = validado;
  }
  
  public void setReservas(final List<Reserva> reservas) {
    this.reservas = reservas;
  }
  
  @Pure
  public Integer getUsuarioId() {
    return this.usuarioId;
  }
  
  public void setUsuarioId(final Integer usuarioId) {
    this.usuarioId = usuarioId;
  }
}
