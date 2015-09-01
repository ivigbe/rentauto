package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServicioUsuario {
	Home home

	def void registrarUsuario(Usuario p) throws UsuarioYaExisteException
	{
		this.home.registrarUsuario(p)
	}

	def void validarCuenta(String codigoValidacion) throws ValidacionException
	{
		val usuario = this.home.getUsuarioPorCodigo(codigoValidacion)

		if (usuario == null)
			throw new ValidacionException()

		usuario.validar()

		this.home.actualizar()
	}

	def ingresarUsuario(String userName, String password) throws UsuarioNoExisteException
	{
		home.ingresarUsuarioHome(userName, password)
	}

	def cambiarPassword(String user, String password, String newPassword) {
		home.cambiarPasswordHome(user, password, newPassword)
	}
}