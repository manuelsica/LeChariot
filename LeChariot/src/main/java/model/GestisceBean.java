package model;

import java.io.Serializable;

public class GestisceBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private String utente;
	private int corso;
	
	public GestisceBean() {}

	public String getUtente() {
		return utente;
	}

	public void setUtente(String utente) {
		this.utente = utente;
	}

	public int getCorso() {
		return corso;
	}

	public void setCorso(int corso) {
		this.corso = corso;
	}	
}
