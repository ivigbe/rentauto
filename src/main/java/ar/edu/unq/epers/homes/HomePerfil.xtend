package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.CalificacionAuto
import ar.edu.unq.epers.homes.Collection
import ar.edu.unq.epers.model.Usuario
import ar.edu.unq.epers.model.Auto
import ar.edu.unq.epers.homes.SistemDB
import ar.edu.unq.epers.model.ComentarioAuto
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class HomePerfil {

	List<Usuario> usuarios = newArrayList()
	List<Auto> autos = newArrayList()
	Collection<ComentarioAuto> homeComentarios
	Collection<CalificacionAuto> homeCalificaciones

	new() {
		this.homeComentarios = SistemDB.instance().collection(ComentarioAuto)
		this.homeCalificaciones = SistemDB.instance().collection(CalificacionAuto)
	}

	def agregarUsuario(Usuario u) {

		this.usuarios.add(u)
	}

	def calificar(CalificacionAuto c, ComentarioAuto coment) {

		this.homeCalificaciones.insert(c)
		this.homeComentarios.insert(coment)
	}

}