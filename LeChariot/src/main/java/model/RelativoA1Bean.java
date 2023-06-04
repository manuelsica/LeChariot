package model;

import java.io.Serializable;

public class RelativoA1Bean implements Serializable{
	public int getOrdine() {
		return ordine;
	}

	public void setOrdine(int ordine) {
		this.ordine = ordine;
	}

	public int getProdottofisico() {
		return prodottofisico;
	}

	public void setProdottofisico(int prodottofisico) {
		this.prodottofisico = prodottofisico;
	}

	private static final long serialVersionUID = 1L;
	private int ordine;
	private int prodottofisico; 
	
	public RelativoA1Bean() {
	}		
}
