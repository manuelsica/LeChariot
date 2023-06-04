package model;

import java.io.Serializable;

public class RelativoA2Bean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int ordine;  
    private int corso;
    
	public RelativoA2Bean() {
	}
	
	
	public int getOrdine() {
		return ordine;
	}
	public void setOrdine(int ordine) {
		this.ordine = ordine;
	}
	public int getCorso() {
		return corso;
	}
	public void setCorso(int corso) {
		this.corso = corso;
	}
}
