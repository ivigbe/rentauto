package ar.edu.unq.epers.model;

import ar.edu.unq.epers.model.AbstractTest;
import ar.edu.unq.epers.model.Deportivo;
import ar.edu.unq.epers.model.TodoTerreno;
import ar.edu.unq.epers.model.Turismo;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class CalculoDePrecioTest extends AbstractTest {
  @Test
  public void precioFamiliar() {
    Double _costoTotal = this.auto.costoTotal();
    Double _costoBase = this.auto.getCostoBase();
    double _plus = ((_costoBase).doubleValue() + 200);
    Assert.assertEquals((_costoTotal).doubleValue(), _plus, 0);
  }
  
  @Test
  public void precioTodoTerreno() {
    TodoTerreno _todoTerreno = new TodoTerreno();
    this.auto.setCategoria(_todoTerreno);
    Double _costoTotal = this.auto.costoTotal();
    Double _costoBase = this.auto.getCostoBase();
    double _multiply = ((_costoBase).doubleValue() * 1.10);
    Assert.assertEquals((_costoTotal).doubleValue(), _multiply, 0);
  }
  
  @Test
  public void precioDeportivo() {
    Deportivo _deportivo = new Deportivo();
    this.auto.setCategoria(_deportivo);
    Double _costoTotal = this.auto.costoTotal();
    Double _costoBase = this.auto.getCostoBase();
    double _multiply = ((_costoBase).doubleValue() * 1.20);
    Assert.assertEquals((_costoTotal).doubleValue(), _multiply, 0);
  }
  
  @Test
  public void precioTurismo() {
    Turismo _turismo = new Turismo();
    this.auto.setCategoria(_turismo);
    Double _costoTotal = this.auto.costoTotal();
    Double _costoBase = this.auto.getCostoBase();
    double _minus = ((_costoBase).doubleValue() - 200);
    Assert.assertEquals((_costoTotal).doubleValue(), _minus, 0);
  }
}
