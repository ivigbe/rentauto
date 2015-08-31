package ar.edu.unq.epers.model

import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario 
{
	
	String nombre
	String apellido
	String nombreUsuario	
	String email
	Date fechaNacimiento
	String password
	new(String nom, String apell, String nomUsuario, String email, Date fechaNac, String userpass){
		
		this.nombre = nom
		this.apellido = apell
		this.nombreUsuario = nomUsuario
		this.email = email
		this.fechaNacimiento = fechaNac
		this.password = userpass
	}
	
	
}