package ar.edu.unq.epers.homes

import com.datastax.driver.core.Cluster
import com.datastax.driver.core.Session
import scala.util.parsing.ast.Mappable.Mapper

class ManagerCassandra {
	Cluster cluster
	Session session
	Mapper<T> mapper
	
}