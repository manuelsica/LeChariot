package model;

import java.io.Serializable;

public class EffettuaBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int ordine; 
	private String utente;
	
	public EffettuaBean() {}

	public int getOrdine() {
		return ordine;
	}

	public void setOrdine(int ordine) {
		this.ordine = ordine;
	}

	public String getUtente() {
		return utente;
	}

	public void setUtente(String utente) {
		this.utente = utente;
	} 	
}
