package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomeUsuario
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Usuario
import java.util.Date
import org.junit.After
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestServicioUsuario {
//
//	EnviadorDeMails enviadorMails
//
//	Mail mail
//
//	HomeUsuario home
//
//	ServicioUsuario servicio
//
//	Usuario u1
//	Usuario u2
//	Usuario u3
//
//	@Before
//	def void setUp() {
//
//		// Mock instances:
//		this.enviadorMails = mock(EnviadorDeMails)
//
//		// Services and Home
//		this.home = mock(HomeUsuario)
//
//		this.servicio = new ServicioUsuario(home, enviadorMails)
//
//		// Users
//		this.u1 = new Usuario => [
//
//			nombre = "Manolo"
//			apellido = "Perez"
//			nombreUsuario = "ManoloPerez"
//			email = "manolo@gmail.com"
//			fechaNacimiento = new Date(2015, 06, 04)
//			password = "pepe"
//			validado = false
//		]
//
//		this.u2 = new Usuario => [
//
//			nombre = "juan"
//			apellido = "pogba"
//			nombreUsuario = "jp"
//			email = "pogba@gmail.com"
//			fechaNacimiento = new Date(1990, 12, 06)
//			password = "gol"
//			validado = false
//		]
//
//		this.u3 = new Usuario => [
//
//			nombre = "pedro"
//			apellido = "gomez"
//			nombreUsuario = "pg"
//			email = "gomez@gmail.com"
//			fechaNacimiento = new Date(1990, 11, 15)
//			password = "gol"
//			validado = false
//		]
//
//		// Mail
//		mail = new Mail()
//	}
//
//	@Test
//	def void testEnviarMail() {
//
//		servicio.registrarUsuario(u3)
//		verify(enviadorMails).enviarMail(any(Mail))
//	}
//
//	@Test
//	def void testRegistrarUsuario() {
//
//		servicio.registrarUsuario(u1)
//		assertFalse(u1.validado)
//	}
//
//	// Exceptions tests
//	@Test(expected=UsuarioYaExisteException)
//	def void testExpcepcionUsuarioYaRegistrado() {
//
//		when(home.getUsuarioPorNombreUsuario("jp")).thenReturn(u2)
//
//		servicio.registrarUsuario(u2)
//		assertFalse(u2.validado)
//	}
//
//	@Test(expected=PasswordInvalidoException)
//	def void testExpcepcionPasswordInvalido() {
//
//		servicio.cambiarPassword("jp", "gol", "gol")
//		assertTrue(u2.password == "gol")
//	}
//
//	@Test(expected=ValidacionException)
//	def void testExcepcionValidacion() {
//
//		when(home.getUsuarioPorCodigo("jppogba@gmail.com")).thenReturn(u2)
//
//		servicio.validarCuenta("jppogba@gmail.com")
//		assertFalse(u2.validado)
//	}
//
//	@Test
//	def void testCambiarPassword() {
//
//		when(this.home.getUsuarioPorNombreUsuario("ManoloPerez")).thenReturn(u1)
//
//		servicio.cambiarPassword(u1.nombreUsuario, u1.password, "linux")
//		assertTrue(u1.password == "linux")
//	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	HomeUsuario home
	ServicioUsuario service
	Usuario u

	@Before
	def void setUp() {
		u = new Usuario("Homero", "Simpson", "elHomer", "1234", "homero@gmail.com", new Date())
		home = new HomeUsuario()
		service = new ServicioUsuario(home)

		service.guardarUsuario(u)
	}

	@Test
	def void testGuardarUsuario() {
		val usuario = service.getUsuarioPorId(u.usuarioId)
		assertTrue(usuario.usuarioId == u.usuarioId)
	}

	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}

}