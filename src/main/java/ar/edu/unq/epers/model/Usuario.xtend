package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import java.util.List
import java.util.ArrayList

@Accessors
class Usuario {

	String nombre
	String apellido
	String nombreUsuario
	String email
	Date fechaNacimiento
	String password
	Boolean validado
	List<Reserva> reservas  = newArrayList()
	Integer usuarioId
	
	new(){}
	
	new(String name, String apell, String nameUser, String pass, String email, Date fechaNacimiento)
	{
		this.nombre = name
		this.apellido = apell
		this.nombreUsuario = nameUser
		this.password = pass
		this.email = email
		this.fechaNacimiento = fechaNacimiento
		this.reservas = new ArrayList <Reserva>()
	}
	
	new(String nameUser){
		
		this.nombreUsuario = nameUser
	}

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