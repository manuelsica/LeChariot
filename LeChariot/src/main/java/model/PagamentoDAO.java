package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.DriverManagerConnectionPool;

public class PagamentoDAO {

	

	public void doSave(PagamentoBean dao) throws SQLException {
		String query="Insert into pagamento values(?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getOrdine());
			ps.setLong(2, dao.getCarta());
			
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}
}
