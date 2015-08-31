package ar.edu.unq.epers.model

import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.DriverManager
import java.sql.ResultSet

class Home 
{

	Connection c
	PreparedStatement ps
	ResultSet rs
	
	def Connection conectar() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver")
		return DriverManager.getConnection("jdbc:mysql://localhost/RentaAutos?user=root&password=root")

	}

	def registrarUsuario(Usuario usuarionuevo) 
	{
		try 
		{
			c = this.conectar()
			ps = c.prepareStatement("INSERT INTO usuario (NOMBRE, APELLIDO, NOMBREUSUARIO, EMAIL, FECHADENACIMIENTO, VALIDADO) VALUES (?,?,?,?,?,?)")
			ps.setString(1, usuarionuevo.nombre)
			ps.setString(2, usuarionuevo.apellido)
			ps.setString(3, usuarionuevo.nombreUsuario)
			ps.setString(4, usuarionuevo.email)
			ps.setDate(5, usuarionuevo.fechaNacimiento)
			ps.setBoolean(6, false)
		} 
		
		finally 
		{
			if(ps != null)
				ps.close()
				
			if(c != null)
				c.close()
		}

	}

	def validarCuentaHome(String codigoValidacion) 
	{
		
	}

	def ingresarUsuarioHome(String userName, String password) 
	{
		
	}

	def cambiarPasswordHome(String user, String password, String newPassword) 
	{
		
	}
	
	def existeUsuarioHome(String n) 
	{
			try 
			{
			c = this.conectar()
			
			ps = c.prepareStatement("SELECT * FROM USUARIO WHERE NOMBREUSUARIO = ?")
			ps.setString(1,n)
			
			rs = ps.executeQuery()
			
			rs.next()
			
			}
			 
			finally 
			{
				if (ps != null)
					ps.close()
					
				if (c != null)
					c.close()
			}
		}
}