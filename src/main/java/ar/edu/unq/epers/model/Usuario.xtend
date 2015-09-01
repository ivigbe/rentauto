package ar.edu.unq.epers.model

import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors

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

}