package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.HomePerfil
import ar.edu.unq.epers.homes.HomeUsuario
import ar.edu.unq.epers.model.Mensaje
import ar.edu.unq.epers.model.Usuario
import java.util.Date
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import ar.edu.unq.epers.model.ComentarioAuto
import ar.edu.unq.epers.model.CalificacionAuto
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.model.Reserva
import ar.edu.unq.epers.homes.HomeReserva

class TestServicioRedSocial {
	Usuario u1
	Usuario u2
	Usuario u3
	Usuario u4
	Mensaje m
	ServicioUsuario service
	HomeUsuario home
	ServicioRedSocial redSocial
	HomePerfil perfil
	ComentarioAuto coment1
	Auto a
	Reserva r
	HomeReserva homeReserva
	ServicioReserva serviceReserva
	
	@Before
	def void setUp(){
		//Red Social
		u1 = new Usuario("Homero", "Simpson", "fv", "1234", "homero@gmail.com", new Date())
		u2 = new Usuario("Bart", "Simpson", "ib", "3456", "bart@gmail.com", new Date())
		u3 = new Usuario("Lisa", "Simpson", "jp", "4567", "lisa@gmail.com", new Date())
		u4 = new Usuario("Marge", "Simpson", "ManoloPerez", "7812", "marge@gmail.com", new Date())
		m = new Mensaje("Hola Mundo!")
		redSocial = new ServicioRedSocial()
		home = new HomeUsuario()
		service = new ServicioUsuario(home, redSocial)
		service.guardarUsuario(u1)
		service.guardarUsuario(u2)
		service.guardarUsuario(u3)
		service.guardarUsuario(u4)
		redSocial.agregarComoAmigo(u1, u2)
		redSocial.agregarComoAmigo(u2, u3)
		redSocial.agregarComoAmigo(u2, u4)
		
		redSocial.enviarMensajeA(u2, u4, m)
		
		//COMENTARIOS
		a = new Auto()
		r = new Reserva(a)
		homeReserva = new HomeReserva()
		serviceReserva = new ServicioReserva(homeReserva)
		serviceReserva.hacerReserva(r)
		coment1 = new ComentarioAuto("Muy bueno")
		perfil = new HomePerfil()
	}
	
	@Test
	def void testObtengoAMisAmigos(){
		
		val amigosU1 = redSocial.obtenerAmigos(u1)
		val amigosU2 = redSocial.obtenerAmigos(u2)
		
		assertEquals(u2.nombreUsuario, amigosU1.head.nombreUsuario)
		assertEquals(u4.nombreUsuario, amigosU2.head.nombreUsuario)
	}
	
	@Test
	def void testPreguntoSiSonAmigos(){
		
		assertTrue(redSocial.sonAmigos(u2, u3))
	}
	
	@Test
	def void testMandoMsjeAMisAmigos(){
		
		val mensajesU2 = redSocial.obtenerMensajesEnviados(u2)
		
		assertTrue(mensajesU2.contains(m))
	}
	
	@Test
	def void testVeoMsjeDeMisAmigos(){
		
		val mensajesU4 = redSocial.obtenerMensajesRecibidos(u4)
		
		assertTrue(mensajesU4.contains(m))
	}
	
	@Test
	def void testObtengoAmigosDeMisAmigos(){
		
		val conectadasU1 = redSocial.obtenerPersonasConectadas(u1)
		
		assertTrue(conectadasU1.contains(u2))
		assertTrue(conectadasU1.contains(u3))
		assertTrue(conectadasU1.contains(u4))
	}
	
	@Test
	def void testCalificoUnAutoQueAlquile()
	{
		redSocial.calificarAutoAlquilado(CalificacionAuto.EXCELENTE, coment1, u1)
		assertEquals(1, redSocial.homePerfil.homeCalificaciones)
	}
	
	
}