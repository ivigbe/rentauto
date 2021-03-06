package ar.edu.unq.epers.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongojack.ObjectId
import com.datastax.driver.mapping.annotations.UDT

@Accessors
//@EqualsHashCode //Para que genere los metodos equals y hashcode. Sirve para hacer la comparacion entre objetos
@UDT(keyspace = "simplex", name = "Auto")
class Auto {
	String marca
	String modelo
	Integer año
	String patente
	Double costoBase
	Categoria categoria
	@ObjectId
	@JsonProperty("_id")
	Integer autoId
	
	//Debe estar ordenado
	List<Reserva> reservas = newArrayList()
	Ubicacion ubicacionInicial
	
	new(){}

	new(String marca, String modelo, Integer anio, String patente, Categoria categoria, Double costoBase, Ubicacion ubicacionInicial){
		this.marca = marca
		this.modelo = modelo
		this.año = anio
		this.patente = patente
		this.costoBase = costoBase
		this.categoria = categoria
		this.ubicacionInicial = ubicacionInicial
	}

	def getUbicacion(){
		this.ubicacionParaDia(new Date());
	}
	
	def ubicacionParaDia(Date unDia){
		val encontrado = reservas.findLast[ it.fin <= unDia ]
		if(encontrado != null){
			encontrado.destino
		}else{
			ubicacionInicial
		}
	}
	
	def Boolean estaLibre(Date desde, Date hasta){
		reservas.forall[ !seSuperpone(desde,hasta) ]
	}
	
	def agregarReserva(Reserva reserva){
		reserva.validar
		reservas.add(reserva)
		reservas.sortInplaceBy[inicio]
	}
	
	def costoTotal(){
		categoria.calcularCosto(this)
	}
	
	override def equals(Object object){
		val otroAauto = object as Auto
		otroAauto != null && otroAauto.autoId == autoId
	}
	
}
