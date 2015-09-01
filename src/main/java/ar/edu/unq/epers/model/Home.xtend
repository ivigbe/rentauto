package ar.edu.unq.epers.model

import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.DriverManager
import java.sql.ResultSet

class Home {

	Connection c
	PreparedStatement ps
	ResultSet rs

	def Connection conectar() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver")

		return DriverManager.getConnection("jdbc:mysql://localhost/RentaAutos?user=root&password=root")

	}

	def registrarUsuario(Usuario usuarionuevo) {
		try {
			c = this.conectar()
			ps = c.
				prepareStatement(
					"INSERT INTO USUARIO (NOMBRE, APELLIDO, NOMBREUSUARIO, PASSWORD, EMAIL, FECHADENACIMIENTO, VALIDADO) VALUES (?,?,?,?,?,?)"
				)
			ps.setString(1, usuarionuevo.nombre)
			ps.setString(2, usuarionuevo.apellido)
			ps.setString(3, usuarionuevo.nombreUsuario)
			ps.setString(4, usuarionuevo.password)
			ps.setObject(5, usuarionuevo.email)
			ps.setDate(6, usuarionuevo.fechaNacimiento)
			ps.setBoolean(7, false)

		} finally {
			if (ps != null)
				ps.close()

			if (c != null)
				c.close()
		}

	}

	def ingresarUsuarioHome(String userName, String password) {
	}

	def cambiarPasswordHome(String user, String password, String newPassword) {
	}

	def getUsuarioPorCodigo(String n) {
		try {
			c = this.conectar()

			ps = c.
				prepareStatement(
					"SELECT * FROM USUARIO JOIN USUARIO_CODIGO ON USUARIO.NOMBREUSUARIO = USUARIO_CODIGO.NOMBREUSUARIO WHERE CODIGO = ?"
				)
			ps.setString(1, n)

			rs = ps.executeQuery()

			if (rs.next()) {
				val u = new Usuario => [

					nombre = rs.getString("NOMBRE")
					apellido = rs.getString("APELLIDO")
					nombreUsuario = rs.getString("NOMBREUSUARIO")
					password = rs.getString("PASSWORD")
					email = rs.getString("EMAIL")
					fechaNacimiento = rs.getDate("FECHADENACIMIENTO")
					validado = rs.getBoolean("VALIDADO")
				]

				return u
			} else {
				return null
			}

		} finally {
			if (ps != null)
				ps.close()

			if (c != null)
				c.close()
		}
	}

	def actualizar(Usuario u) {
		try {

			c = this.conectar()
			ps = c.
				prepareStatement(
					"UPDATE USUARIO SET NOMBRE = ?, APELLIDO = ?, NOMBREUSUARIO = ?, PASSWORD = ?, EMAIL = ? FECHANACIMIENTO = ?, VALIDADO = ?"
				)

			ps.setString(1, u.nombre)
			ps.setString(2, u.apellido)
			ps.setString(3, u.nombreUsuario)
			ps.setString(4, u.password)
			ps.setString(5, u.email)
			ps.setDate(6, u.fechaNacimiento)
			ps.setBoolean(7, true)

			rs = ps.executeQuery()

		} finally {

			if (ps != null)
				ps.close()

			if (c != null)
				c.close()
		}
	}

}