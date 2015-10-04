package ar.edu.unq.epers.homes

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.epers.homes.HomeUsuario
import ar.edu.unq.epers.model.Usuario

@Accessors
class TestHomeUsuario {
/*
	HomeUsuario home
	Usuario usuario

	@Before
	def void setUp() {
		this.home = new HomeUsuario()

		this.usuario = new Usuario => [

			nombre = "Liu"
			apellido = "Kan"
			nombreUsuario = "LiuKan"
			email = "kan@gmail.com"
			fechaNacimiento = new Date(1910, 04, 06)
			password = "1234"
			validado = false
		]
	}

	@Test
	def void testIngresarNuevoUsuario() {
		this.home.ingresarNuevoUsuario(usuario)
		val usu = this.home.getUsuarioPorNombreUsuario("LiuKan")
		assertTrue(usu.apellido == "Kan")

	}

	@Test
	def void testGuardarCodValicacion() {
		this.home.guardarCodigoValidacion(usuario.nombreUsuario, "mp3")
		val x = this.home.getUsuarioPorCodigo("mp3")
		assertTrue(x.nombre == "Liu")
	}

	@Test
	def void testGetUsuarioDesconocido() {
		usuario = this.home.getUsuarioPorNombreUsuario("jj")
		assertTrue(usuario == null)
	}

	@Test
	def void testGetUsuarioPorCodigo() {
		usuario = this.home.getUsuarioPorCodigo("120")

		assertTrue(usuario.apellido == "vigo")
	}

	@Test
	def void testGetUsuarioPorNombreDeUsuario() {
		usuario = this.home.getUsuarioPorNombreUsuario("ib")

		assertTrue(usuario.nombre == "ivan")
	}

	@Test
	def void testGetUsuarioPorLogin() {
		usuario = this.home.getUsuarioPorLogin("ib", "123")

		assertTrue(usuario.email == "iv@gmail.com")
	}
	*/
}