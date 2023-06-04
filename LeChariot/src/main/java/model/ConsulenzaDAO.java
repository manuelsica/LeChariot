package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class ConsulenzaDAO implements GenericDAO<ConsulenzaBean>{
private static final String TABLE_NAME="consulenza"; 
	
	public ConsulenzaBean doRetriveByKey(Object code) throws SQLException {
		Integer cod= (Integer) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+ConsulenzaDAO.TABLE_NAME+" where id=?";
		ConsulenzaBean b=new ConsulenzaBean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, cod);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setId(rs.getInt("id"));
				b.setNome(rs.getString("nome")); 
				b.setDurata(rs.getInt("durata"));
				b.setPrezzo(rs.getDouble("prezzo"));
				b.setImg(rs.getString("image"));
				b.setDesc(rs.getString("descrizione"));
				}
			rs.close();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
				
		}
		return b;
	}

	public ArrayList<ConsulenzaBean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<ConsulenzaBean> ab= new ArrayList<ConsulenzaBean>(); 
		String query= "select * from "+ConsulenzaDAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			ConsulenzaBean b=new ConsulenzaBean(); 
			while(rs.next()) {
				b.setId(rs.getInt("id"));
				b.setNome(rs.getString("nome")); 
				b.setDurata(rs.getInt("durata"));
				b.setPrezzo(rs.getDouble("prezzo"));
				
				ab.add(b);
				}
			rs.close();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
				
		}
		return ab;
	}

	
	public void doSave(ConsulenzaBean dao) throws SQLException {
		String query="Insert into "+ ConsulenzaDAO.TABLE_NAME+" values(?,?,?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getId());
			ps.setInt(2, dao.getDurata()); 
			ps.setString(3, dao.getNome()); 
			ps.setDouble(4, dao.getPrezzo());
			
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	public int doUpdate(ConsulenzaBean dao) throws SQLException {
		String query="update "+ ConsulenzaDAO.TABLE_NAME+" set durata=? where id=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getDurata());
			ps.setInt(2, dao.getId());
			ps.execute();
			ctrl=1; 
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return ctrl;
	}


	public boolean doDelete(Object code) throws SQLException {
		Integer cod= (Integer) code;
		String query="delete from "+ ConsulenzaDAO.TABLE_NAME+" where id=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		boolean ctrl=false; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 		
			ps=con.prepareStatement(query); 
			ps.setInt(1, cod);	
			ps.execute();
			ctrl=true; 
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		return ctrl;
	}
	
	public ArrayList<ConsulenzaBean> getAllProducts(){
		ArrayList<ConsulenzaBean> prd = new ArrayList<ConsulenzaBean>();
		String query=null;
		PreparedStatement pst= null;
		ResultSet rs=null;
		Connection con= null;
		
		try {
			con=DriverManagerConnectionPool.getConnection(); 	
			query= "select * from consulenza";
			pst=con.prepareStatement(query);
			rs= pst.executeQuery();
			while(rs.next()) {
				ConsulenzaBean b= new ConsulenzaBean();
				b.setId(rs.getInt("id"));
				b.setNome(rs.getString("nome")); 
				b.setDesc(rs.getString("descrizione"));
				b.setDurata(rs.getInt("durata"));
				b.setPrezzo(rs.getDouble("prezzo"));
				b.setImg(rs.getString("image"));
				
				prd.add(b);					
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return prd;
	}
	///////////////////////////////////////////////////////////////////////
	public void ModifyNome(int id, String nome) throws SQLException {
		String query="update "+ ConsulenzaDAO.TABLE_NAME+" set nome=? where id=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, nome);
			ps.setInt(2, id);
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}
	
	public void ModifyDurata(int id, int durata) throws SQLException {
		String query="update "+ ConsulenzaDAO.TABLE_NAME+" set durata=? where id=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, durata);
			ps.setInt(2, id);
			ps.execute(); 
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}
	
	public void ModifyPrezzo(int id, double prezzo) throws SQLException {
		String query="update "+ ConsulenzaDAO.TABLE_NAME+" set prezzo=? where id=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setDouble(1, prezzo);
			ps.setInt(2, id);
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}
	
	public void ModifyDescrizione(int idcorso, String descrizione) throws SQLException {
		String query="update "+ ConsulenzaDAO.TABLE_NAME+" set descrizione=? where id=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, descrizione);
			ps.setInt(2, idcorso);
			
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
