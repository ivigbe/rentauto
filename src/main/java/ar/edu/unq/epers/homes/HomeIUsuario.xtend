package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.IUsuario

class HomeIUsuario {
	
	def get(int id){
		return SessionManager.getSession().get(typeof(IUsuario) ,id) as IUsuario
	}
	
	def save(IUsuario iu) {
		SessionManager.getSession().saveOrUpdate(iu)
	}
}