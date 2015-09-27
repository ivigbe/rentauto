package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Auto

class HomeAuto {
	
	def get(int id){
		return SessionManager.getSession().get(typeof(Auto) ,id) as Auto
	}
	
	def save(Auto a) {
		SessionManager.getSession().saveOrUpdate(a)
	}
}