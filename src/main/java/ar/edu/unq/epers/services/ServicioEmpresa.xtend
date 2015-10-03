package ar.edu.unq.epers.services

import ar.edu.unq.epers.homes.GenericHome
import ar.edu.unq.epers.homes.SessionManager
import ar.edu.unq.epers.model.Empresa

class ServicioEmpresa {
	
	GenericHome<Empresa> home
	
	new(GenericHome<Empresa> h)
	{
		this.home = h
	}
	
	def void guardarEmpresa(Empresa e)
	{
		SessionManager.runInSession[|
			
			home.save(e)
		]
	}
	
	def getEmpresaPorId(int id)
	{
		SessionManager.runInSession[|
			
			home.get(id)
		]
	}
}