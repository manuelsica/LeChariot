package model;

import java.io.Serializable;
import java.util.Date;

public class OrdineBean implements Serializable, Comparable<OrdineBean>{
	private static final long serialVersionUID = 1L;
	private int numero;
	private String uid;
	private double totale;
    private Date date; 
    private String prodotti;
    private String stato;
    private int quantita;
    
    public OrdineBean() {}
    
    public int getQuantita() {
    	return quantita;
    }
    
    public void setQuantita(int s) {
    	quantita=s;
    }
    
    public String getStato() {
    	return stato;
    }
    
    public void setStato(String s) {
    	stato=s;
    }
    
    public String getProdotti() {
    	return prodotti;
    }
    
    public void setProdotti(String s) {
    	prodotti=s;
    }
    
    public String getUid() {
    	return uid;
    }
    
    public void setUid(String d) {
    	uid=d;
    }

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public double getTotale() {
		return totale;
	}

	public void setTotale(double totale) {
		this.totale = totale;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public boolean equals(Object o) {
		if(o==null) return false;
		if(getClass()!=o.getClass()) return false;
		
		OrdineBean m = (OrdineBean) o;
		return numero==m.getNumero();
	}

	public int compareTo(OrdineBean o) {
		if(numero==o.getNumero()) return 1;
		return 0;
	}
   
}
