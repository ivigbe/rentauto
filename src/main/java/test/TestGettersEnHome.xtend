package test

import ar.edu.unq.epers.model.Home
import ar.edu.unq.epers.model.Usuario
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

@Accessors
class TestGettersEnHome {

	Home home
	Usuario usuario
	
	@Before
	def void setUp() {
		this.home = new Home()
		
		
		this.usuario = new Usuario => [
			
			nombre = "Manolo"
			apellido = "Perez"
			nombreUsuario = "ManoloPerez"
			email = "manolo@gmail.com"
			fechaNacimiento = new Date(1994, 04, 06)
			password = "pepe"
			validado = false
		]
	}

	@Test
	def void testIngresarNuevoUsuario() {
		this.home.ingresarNuevoUsuario(usuario)
		val usu = this.home.getUsuarioPorNombreUsuario("ManoloPerez")
		assertTrue(usu.apellido == "Perez")
		
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
		
}