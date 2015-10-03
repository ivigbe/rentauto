package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.model.Empresa
import org.junit.Before
import ar.edu.unq.epers.homes.HomeProvider
import org.junit.After
import ar.edu.unq.epers.homes.SessionManager

class TestServicioEmpresa {

	GenericHome<Empresa> home
	ServicioEmpresa s
	Empresa e

	@Before
	def void setUp() {
		home = HomeProvider.empresaHome
		e = new Empresa()

		s = new ServicioEmpresa(home)
	}

	@After
	def void limpiar() {
		SessionManager::resetSessionFactory()
	}
}