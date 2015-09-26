package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Categoria

class HomeCategoria {
	
	def get(int id){
		return SessionManager.getSession().get(typeof(Categoria) ,id) as Categoria
	}
	
	def save(Categoria c) {
		SessionManager.getSession().saveOrUpdate(c)
	}
}