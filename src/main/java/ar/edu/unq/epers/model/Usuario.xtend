package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.Date

@Accessors
class Usuario {

	String nombre
	String apellido
	String nombreUsuario
	String email
	Date fechaNacimiento
	String password
	Boolean validado;


	def validar() {
		this.validado = true
	}

	/**
	 * Proposito: El usuario actualiza su password.
	 */
	def updatePassword(String newPass) {
		this.password = newPass
	}

}