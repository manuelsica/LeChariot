package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ProdottoFisicoBean;
import connection.DriverManagerConnectionPool;

public class ProdottoFisicoDAO implements GenericDAO<ProdottoFisicoBean>{
	private static final String TABLE_NAME="prodottofisico";
	
	
	public ProdottoFisicoBean doRetriveByKey(Object code) throws SQLException {
			Integer idpf= (Integer) code; 
			Connection con=null; 
			PreparedStatement ps=null; 
			String query= "select * from "+ProdottoFisicoDAO.TABLE_NAME+" where idpf=?";
			ProdottoFisicoBean b=new ProdottoFisicoBean(); 
			
			try {
				con= DriverManagerConnectionPool.getConnection(); 
				
				ps=con.prepareStatement(query); 
				ps.setInt(1, idpf);
				ResultSet rs= ps.executeQuery();
				
				while(rs.next()) {
					b.setDescrizione(rs.getString("descrizione"));
					b.setNome(rs.getString("nome"));
					b.setIdpf(rs.getInt("idpf"));
					b.setPrezzo(rs.getDouble("prezzo"));
					b.setTipo(rs.getString("tipo")); 
					b.setQuantitaInmagazzino(rs.getInt("quantitaInmagazzino"));
					b.setImage(rs.getString("image"));
					b.setImage2(rs.getString("image2"));
					b.setImage3(rs.getString("image3"));
					b.setImage4(rs.getString("image4"));
					b.setImage5(rs.getString("image5"));
					}
				
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(ps!=null) ps.close(); 
				}finally {
					DriverManagerConnectionPool.releaseConnection(con);
				}
					
			}
			return b;
	}

	public void doSave(ProdottoFisicoBean dao) throws SQLException {
		String query="Insert into "+ ProdottoFisicoDAO.TABLE_NAME+" values(?,?,?,?,?,?,?,?,?,?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1,dao.getIdpf());
		    ps.setString(2,dao.getNome()); 
			ps.setInt(3,dao.getQuantitaInmagazzino());
			ps.setString(4, dao.getTipo());
			ps.setString(5, dao.getDescrizione());
			ps.setDouble(6, dao.getPrezzo());
			ps.setString(7, dao.getImage());
			ps.setString(8, dao.getImage2());
			ps.setString(9, dao.getImage3());
			ps.setString(10, dao.getImage4());
			ps.setString(11, dao.getImage5());
			ps.executeUpdate();
			
			
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}

	}

	public int doUpdate(ProdottoFisicoBean dao) throws SQLException {
		String query="update "+ ProdottoFisicoDAO.TABLE_NAME+" set quantitaInmagazzino=?, nome=?, tipo=?, descrizione=?, prezzo=?, image=?, image2=?, image3=?, image4=?, image5=? where idpf=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getIdpf());
			ps.setString(2, dao.getNome());
			ps.setInt(3, dao.getQuantitaInmagazzino());
			ps.setString(4, dao.getTipo());
			ps.setString(5, dao.getDescrizione());
			ps.setDouble(6, dao.getPrezzo());
			ps.setString(7, dao.getImage());
			ps.setString(8, dao.getImage2());
			ps.setString(9, dao.getImage3());
			ps.setString(10, dao.getImage4());
			ps.setString(11, dao.getImage5());
			
			ps.executeUpdate();
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

	public ArrayList<ProdottoFisicoBean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<ProdottoFisicoBean> ab= new ArrayList<ProdottoFisicoBean>(); 
		String query= "select * from "+ProdottoFisicoDAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, order);
			ResultSet rs= ps.executeQuery();
			ProdottoFisicoBean b=new ProdottoFisicoBean(); 
			while(rs.next()) {
				b.setDescrizione(rs.getString("descrizione"));
				b.setNome(rs.getString("nome"));
				b.setIdpf(rs.getInt("idpf"));
				b.setTipo(rs.getString("tipo")); 
				b.setQuantitaInmagazzino(rs.getInt("quantitaInmagazzino"));
				b.setImage(rs.getString("image"));
				b.setImage2(rs.getString("image2"));
				b.setImage3(rs.getString("image3"));
				b.setImage4(rs.getString("image4"));
				b.setImage5(rs.getString("image5"));
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

	public boolean doDelete(Object code) throws SQLException {
		Integer idpf= (Integer) code; 
		String query="delete from "+ ProdottoFisicoDAO.TABLE_NAME+" where idpf=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		boolean ctrl=false; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 		
			ps=con.prepareStatement(query); 
			ps.setInt(1, idpf);	
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
	
	public ArrayList<ProdottoFisicoBean> getAllProducts(){
		ArrayList<ProdottoFisicoBean> prd = new ArrayList<ProdottoFisicoBean>();
		String query=null;
		PreparedStatement pst= null;
		ResultSet rs=null;
		Connection con= null;
		
		try {
			con=DriverManagerConnectionPool.getConnection(); 	
			query= "select * from prodottofisico";
			pst=con.prepareStatement(query);
			rs= pst.executeQuery();
			while(rs.next()) {
				ProdottoFisicoBean b= new ProdottoFisicoBean();
				b.setDescrizione(rs.getString("descrizione"));
				b.setNome(rs.getString("nome"));
				b.setIdpf(rs.getInt("idpf"));
				b.setPrezzo(rs.getDouble("prezzo"));
				b.setTipo(rs.getString("tipo")); 
				b.setQuantitaInmagazzino(rs.getInt("quantitaInmagazzino"));
				b.setImage(rs.getString("image"));
				b.setImage2(rs.getString("image2"));
				b.setImage3(rs.getString("image3"));
				b.setImage4(rs.getString("image4"));
				b.setImage5(rs.getString("image5"));
				
				prd.add(b);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return prd;
	}

	
	///////////////////////////////////////////////////////////////////////////////////////
	
	public void ModifyQuantitaInMagazzino(int idpf, int qim) throws SQLException{
		String query="update prodottofisico set quantitaInmagazzino=? where idpf=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(2, idpf);
			ps.setInt(1, qim);
			ps.execute();

		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}
	
	public void ModifyTipo(int idpf, String tipo) throws SQLException{
		String query="update prodottofisico set tipo=? where idpf=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(2, idpf);
			ps.setString(1, tipo);
			ps.execute();

		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}
	
	public void ModifyNome(int idpf, String nome) throws SQLException{
		String query="update prodottofisico set nome=? where idpf=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(2, idpf);
			ps.setString(1, nome);
			ps.executeUpdate();

		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}
	
	public void ModifyPrezzo(int idpf, double prezzo) throws SQLException{
		String query="update "+ ProdottoFisicoDAO.TABLE_NAME+" set prezzo=? where idpf=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(2, idpf);
			ps.setDouble(1, prezzo);
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
