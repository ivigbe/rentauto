package ar.edu.unq.epers.services

import ar.edu.unq.epers.model.Usuario
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*

class TestServicioRedSocial {
	Usuario u1
	Usuario u2
	Usuario u3
	Usuario u4
	ServicioRedSocial service
	
	@Before
	def void setUp(){
		u1 = new Usuario("fv")
		u2 = new Usuario("ib")
		u3 = new Usuario("jp")
		u4 = new Usuario("ManoloPerez")
		service = new ServicioRedSocial()
		service.agregarUsuario(u1)
		service.agregarUsuario(u2)
		service.agregarUsuario(u3)
		service.agregarUsuario(u4)
		service.agregarComoAmigo(u1, u2)
		service.agregarComoAmigo(u2, u3)
		service.agregarComoAmigo(u2, u4)
	}
	
	@Test
	def void testObtengoAMisAmigos(){
		
		assertEquals(u2, service.obtenerAmigos(u1).head) 
		//assertTrue(service.obtenerAmigos(u2).contains(u4))
	}
}