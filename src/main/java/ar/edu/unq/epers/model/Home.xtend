package ar.edu.unq.epers.model

import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.DriverManager
import java.sql.ResultSet

class Home {

	Connection c
	PreparedStatement ps
	ResultSet rs

	def Connection conectar() throws Exception{
		Class.forName("com.mysql.jdbc.Driver")

		return DriverManager.getConnection("jdbc:mysql://localhost/Epers_DB?user=root&password=root")//A ver si anda
	}

	def rearmarUsuario(ResultSet rs2){
		val user = new Usuario => [nombre = rs2.getString("NOMBRE")
								apellido = rs2.getString("APELLIDO")
								nombreUsuario = rs2.getString("NOMBREUSUARIO")
								password = rs2.getString("PASSWORD")
								email = rs2.getString("EMAIL")
								fechaNacimiento = rs2.getDate("FECHADENACIMIENTO")
								validado = rs2.getBoolean("VALIDADO")
								]

		return user	
	}

	def ingresarNuevoUsuario(Usuario usuarionuevo) {
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
			
			ps.executeQuery()

		} finally {
			if (ps != null)
				ps.close()

			if (c != null)
				c.close()
		}
	}
	
	def guardarCodigoValidacion(String user, String cod){
		try {
			c = this.conectar()
			ps = c.
				prepareStatement(
					"INSERT INTO USUARIO_CODIGO (NOMBREUSUARIO, CODIGO) VALUES (?,?)"
				)
			ps.setString(1, user)
			ps.setString(2, cod)
			ps.executeQuery()
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
	
	def getUsuarioPor( String parametro){ //este ignorenlo que estoy viendo solamente como hcer "factor comun" de los otros 3 getters
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

			if (c != null)
				c.close()
		}
		
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
				return rearmarUsuario(rs)
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
	
	def getUsuarioPorNombreUsuario(String nombreUser) {
		try {
			c = this.conectar()

			ps = c.
				prepareStatement(
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

			if (c != null)
				c.close()
		}		
	}
	
	def getUsuarioPorLogin(String user, String pass) {
		try {
			c = this.conectar()

			ps = c.
				prepareStatement(
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

			if (c != null)
				c.close()
		}
	}
	
}

/*PARA DESPUES import java.util.Calendar;
import java.util.Date;
 
 
public class ObtenerFechaHora {
 
 public static void main ( String args[] ) {
   
  Date fecha1 = new Date ();
   
  System.out.println(fecha1.toString()); */