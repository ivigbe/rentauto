package test

import org.junit.Before
//import static org.mockito.Mockito.*;
import org.junit.Test
import static org.junit.Assert.*
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.epers.model.Home
import ar.edu.unq.epers.model.Usuario

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

	/*@Test
	def void testIngresarNuevoUsuario() {
		this.home.ingresarNuevoUsuario(usuario)
		val usu = this.home.getUsuarioPorNombreUsuario("ManoloPerez")
		assertTrue(usu.apellido == "Perez")
		
	}*/
	@Test
	def void testGuardarCodValicacion() {
		//this.home.guardarCodigoValidacion(usuario.nombreUsuario, "mp3")		
		val x = this.home.getUsuarioPorCodigo("mp3")
		assertTrue(x.nombre == "Manolo")
	}
	
		@Test
	def void testGetUsuarioDesconocido() {
		usuario = this.home.getUsuarioPorNombreUsuario("jj")		
		assertTrue(usuario == null)
	}
	
	@Test
	def void testGetUsuarioPorCodigo() {
		usuario = this.home.getUsuarioPorCodigo("uncodigo")
		println(usuario.nombre +" ") 
		println(usuario.apellido +" " )
		println(usuario.nombreUsuario +" ")
		println(usuario.password +" ")
		println(usuario.email +" ")
		println(usuario.fechaNacimiento +" ")
		println(usuario.validado +" ")
		
		assertTrue(usuario.apellido == "vigo")
	}
	
	@Test
	def void testGetUsuarioPorNombreDeUsuario() {
		usuario = this.home.getUsuarioPorNombreUsuario("ib")
		println(usuario.nombre +" ") 
		println(usuario.apellido +" " )
		println(usuario.nombreUsuario +" ")
		println(usuario.password +" ")
		println(usuario.email +" ")
		println(usuario.fechaNacimiento +" ")
		println(usuario.validado +" ")
		
		assertTrue(usuario.nombre == "ivan")
	}
	
	@Test
	def void testGetUsuarioPorLogin() {
		usuario = this.home.getUsuarioPorLogin("ib", "puto")
		println(usuario.nombre +" ") 
		println(usuario.apellido +" " )
		println(usuario.nombreUsuario +" ")
		println(usuario.password +" ")
		println(usuario.email +" ")
		println(usuario.fechaNacimiento +" ")
		println(usuario.validado +" ")
		
		assertTrue(usuario.email == "iv@gmail.com")
	}		
}