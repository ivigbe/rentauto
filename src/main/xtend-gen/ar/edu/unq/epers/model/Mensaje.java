package ar.edu.unq.epers.model;

import com.google.common.base.Objects;

@SuppressWarnings("all")
public class Mensaje {
  public String value;
  
  public long fecha;
  
  public Mensaje() {
  }
  
  public Mensaje(final String msje) {
    this.value = msje;
  }
  
  @Override
  public boolean equals(final Object m) {
    boolean _tripleEquals = (this == m);
    if (_tripleEquals) {
      return true;
    }
    if ((m instanceof Mensaje)) {
      final Mensaje other = ((Mensaje) m);
      return Objects.equal(other.value, this.value);
    }
    return false;
  }
  
  @Override
  public int hashCode() {
    return this.value.hashCode();
  }
}
