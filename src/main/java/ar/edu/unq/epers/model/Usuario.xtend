package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.Date
import java.util.List

@Accessors
class Usuario {

	String nombre
	String apellido
	String nombreUsuario
	String email
	Date fechaNacimiento
	String password
	Boolean validado
	List<Reserva> reservas
	Integer usuarioId 

	def validar() {
		this.validado = true
	}

	/**
	 * Proposito: El usuario actualiza su password.
	 */
	def updatePassword(String newPass) {
		this.password = newPass
	}
	
	def agregarReserva(Reserva unaReserva) {
		this.reservas.add(unaReserva)
	}
	
	def getReservas() {
		return this.reservas
	}

}