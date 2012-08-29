package com.everis.interesesdemora;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.reflect.TypeToken;

public class FacturasDataHandler extends EditableTabNavigableDataTableHandler<Factura> {
	
	private static final Logger LOG = LoggerFactory
			.getLogger(FacturasDataHandler.class);
	
	@Override
	protected TypeToken<Collection<Factura>> getCollectionType(){
		return new TypeToken<Collection<Factura>>() {
		};
	}
	
	@Override
	protected void processData(Collection<Factura> facturas) {
		// do stuff here
		for (Factura f : facturas) {
			LOG.debug("Procesando factura: " + f);
		}
	}
}
