package model;

import java.io.Serializable;

public class RelativoA3Bean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int ordine; 
    private int consulenza;
    
	public RelativoA3Bean() {
	}

	public int getOrdine() {
		return ordine;
	}

	public void setOrdine(int ordine) {
		this.ordine = ordine;
	}

	public int getConsulenza() {
		return consulenza;
	}

	public void setConsulenza(int consulenza) {
		this.consulenza = consulenza;
	}
}
