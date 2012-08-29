package com.everis.interesesdemora;

/**
 * DTO
 * 
 * @author jagudopr
 * @version 1.0
 *
 */
public class Factura {

	private String cod_centro;

	private String nombre_centro;

	private String og;

	private String cif_dni_nif;

	private String n_factura;

	private String n_fog;

	private String n_exp;

	private String f_recep;

	private String f_pago;

	private String importe;
	
	public Factura(){
		this(null, null, null, null, null, null, null, null);
	}

	public Factura(String codigoCentro, String nombreCentro, String og,
			String identificadorProveedor, String numeroFog,
			String fechaRecepcion, String fechaPago, String importe) {
		this.cod_centro = codigoCentro;
		this.nombre_centro = nombreCentro;
		this.og = og;
		this.cif_dni_nif = identificadorProveedor;
		this.n_fog = numeroFog;
		this.f_recep = fechaRecepcion;
		this.f_pago = fechaPago;
		this.importe = importe;
	}

	public String getCod_centro() {
		return cod_centro;
	}

	public void setCod_centro(String cod_centro) {
		this.cod_centro = cod_centro;
	}

	public String getNombre_centro() {
		return nombre_centro;
	}

	public void setNombre_centro(String nombre_centro) {
		this.nombre_centro = nombre_centro;
	}

	public String getOg() {
		return og;
	}

	public void setOg(String og) {
		this.og = og;
	}

	public String getCif_dni_nif() {
		return cif_dni_nif;
	}

	public void setCif_dni_nif(String cif_dni_nif) {
		this.cif_dni_nif = cif_dni_nif;
	}

	public String getN_factura() {
		return n_factura;
	}

	public void setN_factura(String n_factura) {
		this.n_factura = n_factura;
	}

	public String getN_fog() {
		return n_fog;
	}

	public void setN_fog(String n_fog) {
		this.n_fog = n_fog;
	}

	public String getN_exp() {
		return n_exp;
	}

	public void setN_exp(String n_exp) {
		this.n_exp = n_exp;
	}

	public String getF_recep() {
		return f_recep;
	}

	public void setF_recep(String f_recep) {
		this.f_recep = f_recep;
	}

	public String getF_pago() {
		return f_pago;
	}

	public void setF_pago(String f_pago) {
		this.f_pago = f_pago;
	}

	public String getImporte() {
		return importe;
	}

	public void setImporte(String importe) {
		this.importe = importe;
	}

	@Override
	public String toString() {
		return "Factura [cod_centro=" + cod_centro + ", nombre_centro="
				+ nombre_centro + ", og=" + og + ", cif_dni_nif=" + cif_dni_nif
				+ ", n_factura=" + n_factura + ", n_fog=" + n_fog + ", n_exp="
				+ n_exp + ", f_recep=" + f_recep + ", f_pago=" + f_pago
				+ ", importe=" + importe + "]";
	}	
}