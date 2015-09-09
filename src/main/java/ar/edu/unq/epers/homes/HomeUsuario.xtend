package ar.edu.unq.epers.homes

import ar.edu.unq.epers.model.Usuario
import java.sql.Connection
import java.sql.DriverManager
import java.sql.PreparedStatement
import java.sql.ResultSet

class HomeUsuario {

	Connection c
	PreparedStatement ps
	ResultSet rs

	/**
	 * Genera una conexion a la base de datos.
	 */
	private def Connection conectar() throws Exception{
		Class.forName("com.mysql.jdbc.Driver")
		return DriverManager.getConnection("jdbc:mysql://localhost/Epers_DB?user=root&password=root")
	}

	/**
	 * Vuelve a armar un usuario con todos sus atributos.
	 */
	private def rearmarUsuario(ResultSet rs2) {
		val user = new Usuario => [
			nombre = rs2.getString("NOMBRE")
			apellido = rs2.getString("APELLIDO")
			nombreUsuario = rs2.getString("NOMBREUSUARIO")
			password = rs2.getString("PASSWORD")
			email = rs2.getString("EMAIL")
			fechaNacimiento = rs2.getDate("FECHADENACIMIENTO")
			validado = rs2.getBoolean("VALIDADO")
		]

		return user
	}

	/**
	 * Setea los atributos del usuario en la base de datos.
	 */
	private def setUsuario(PreparedStatement ps, Usuario u) {
		ps.setString(1, u.nombre)
		ps.setString(2, u.apellido)
		ps.setString(3, u.nombreUsuario)
		ps.setString(4, u.password)
		ps.setObject(5, u.email)
		ps.setDate(6, u.fechaNacimiento)
		ps.setBoolean(7, u.validado)
	}

	/**
	 * Ingresa un nuevo usuario a la base de datos.
	 */
	def ingresarNuevoUsuario(Usuario usuarionuevo) {
		try {
			c = this.conectar()
			ps = c.
				prepareStatement(
					"INSERT INTO USUARIO (NOMBRE, APELLIDO, NOMBREUSUARIO, PASSWORD, EMAIL, FECHADENACIMIENTO, VALIDADO) VALUES (?,?,?,?,?,?,?)"
				)

			this.setUsuario(ps, usuarionuevo)

			ps.execute()

		} finally {
			if (ps != null)
				ps.close()

			if (c != null) {
				c.close()
				c = null
			}
		}
	}

	def getUsuarioPor(String parametro) { // este ignorenlo que estoy viendo solamente como hcer "factor comun" de los otros 3 getters
		try {
			c = this.conectar()

			parametro.toUpperCase

			rs = ps.executeQuery()

			if (rs.next()) {
				return rearmarUsuario(rs)
			} else {
				return null
			}

		} finally {
			if (ps != null)
				ps.close()

			if (c != null) {
				c.close()
				c = null
			}
		}

	}

	/**
	 * Toma a un usuario de la base de datos por el codigo de validacion.
	 */
	def getUsuarioPorCodigo(String n) {
		try {
			c = this.conectar()

			ps = c.
				prepareStatement(
					"SELECT NOMBRE, APELLIDO, USUARIO.NOMBREUSUARIO, PASSWORD, EMAIL, FECHADENACIMIENTO, VALIDADO FROM USUARIO JOIN USUARIO_CODIGO ON USUARIO.NOMBREUSUARIO = USUARIO_CODIGO.NOMBREUSUARIO WHERE CODIGO = ?"
				)
			ps.setString(1, n)

			rs = ps.executeQuery()

			if (rs.next()) {
				return rearmarUsuario(rs)
			} else {
				return null
			}

		} finally {
			if (ps != null)
				ps.close()

			if (c != null) {
				c.close()
				c = null
			}
		}
	}

	/**
	 * Toma a un usuario de la base de datos por el nombre de usuario.
	 */
	def getUsuarioPorNombreUsuario(String nombreUser) {
		try {
			c = this.conectar()

			ps = c.prepareStatement(
				"SELECT * FROM USUARIO WHERE NOMBREUSUARIO = ?"
			)
			ps.setString(1, nombreUser)

			rs = ps.executeQuery()

			if (rs.next()) {
				return rearmarUsuario(rs)
			} else {
				return null
			}

		} finally {
			if (ps != null)
				ps.close()

			if (c != null) {
				c.close()
				c = null
			}
		}
	}

	/**
	 * Toma al usuario de la base de datos por su nombre de usuario y password.
	 */
	def getUsuarioPorLogin(String user, String pass) {
		try {
			c = this.conectar()

			ps = c.prepareStatement(
				"SELECT * FROM USUARIO WHERE NOMBREUSUARIO = ? and PASSWORD = ?"
			)
			ps.setString(1, user)
			ps.setString(2, pass)

			rs = ps.executeQuery()

			if (rs.next()) {
				return rearmarUsuario(rs)
			} else {
				return null
			}

		} finally {
			if (ps != null)
				ps.close()

			if (c != null) {
				c.close()
				c = null
			}
		}
	}

	/**
	 * Se guarda el codigo de validacion en la base de datos.
	 */
	def guardarCodigoValidacion(String user, String cod) {
		try {
			c = this.conectar()
			ps = c.prepareStatement(
				"INSERT INTO USUARIO_CODIGO (NOMBREUSUARIO, CODIGO) VALUES (?,?)"
			)
			ps.setString(1, user)
			ps.setString(2, cod)
			ps.execute()

		} finally {
			if (ps != null)
				ps.close()

			if (c != null) {
				c.close()
				c = null
			}
		}
	}

	/**
	 * Se actualiza un usuario en la base de datos.
	 */
	def actualizar(Usuario u) {
		try {

			c = this.conectar()
			ps = c.
				prepareStatement(
					"UPDATE USUARIO SET NOMBRE = ?, APELLIDO = ?, NOMBREUSUARIO = ?, PASSWORD = ?, EMAIL = ?, FECHADENACIMIENTO = ?, VALIDADO = ? WHERE NOMBREUSUARIO = ?"
				)

			this.setUsuario(ps, u)

			ps.setString(8, u.nombreUsuario)

			ps.execute()

		} finally {

			if (ps != null)
				ps.close()

			if (c != null) {
				c.close()
				c = null
			}
		}
	}
}
