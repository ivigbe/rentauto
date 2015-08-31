package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServicioUsuario 
{	
	Home home
	
	def void registrarUsuario(Usuario p) throws UsuarioYaExisteException
	{
		if(! home.existeUsuarioHome(p.nombreUsuario))
			home.registrarUsuario(p)
			
		else
			throw new UsuarioYaExisteException()
	}
	
	
	def void validarCuenta(String codigoValidacion) throws ValidacionException
	{
		home.validarCuentaHome(codigoValidacion)
	}
	
	def ingresarUsuario(String userName, String password) throws UsuarioNoExisteException
	{
		home.ingresarUsuarioHome(userName, password)
	}
	
	def cambiarPassword(String user, String password, String newPassword)
	{
		home.cambiarPasswordHome(user, password, newPassword)
	}
}