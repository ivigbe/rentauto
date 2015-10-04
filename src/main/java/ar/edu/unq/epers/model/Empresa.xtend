package ar.edu.unq.epers.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Empresa {
	String cuit
	String nombreEmpresa

	List<Usuario> usuarios = newArrayList
	List<Reserva> reservas = newArrayList

	int cantidadMaximaDeReservasActivas
	Double valorMaximoPorDia
	List<Categoria> categoriasAdmitidas = newArrayList
	Integer empresaId

	new() {
	}

	new(String cuit, String nombreEmpresa, Double valor, int cant) {
		this.cuit = cuit
		this.nombreEmpresa = nombreEmpresa
		this.valorMaximoPorDia = valor
		this.cantidadMaximaDeReservasActivas = cant
	}

	def agregarReserva(Reserva unaReserva) {
		unaReserva.validarReserva
		reservas.add(unaReserva)
	}

	def validarReserva(Reserva unaReserva) {
		if (reservasActivas.size == cantidadMaximaDeReservasActivas)
			throw new ReservaException("No se pueden tener más reservas para esta empresa")
		if (unaReserva.costoPorDia > valorMaximoPorDia)
			throw new ReservaException("El costo por dia excede el maximo de la empresa")
		if (!this.usuarios.contains(unaReserva.usuario))
			throw new ReservaException("El usuario no pertenece a la empresa")
		if (!this.categoriasAdmitidas.empty && !this.categoriasAdmitidas.contains(unaReserva.auto.categoria))
			throw new ReservaException("La categoria no esta admitida por la empresa")
	}

	def reservasActivas() {
		reservas.filter[activa]
	}
}