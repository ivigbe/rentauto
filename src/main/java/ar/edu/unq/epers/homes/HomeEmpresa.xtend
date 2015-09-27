package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Empresa

class HomeEmpresa {
	
	def get(int id){
		return SessionManager.getSession().get(typeof(Empresa) ,id) as Empresa
	}
	
	def save(Empresa e) {
		SessionManager.getSession().saveOrUpdate(e)
	}
}