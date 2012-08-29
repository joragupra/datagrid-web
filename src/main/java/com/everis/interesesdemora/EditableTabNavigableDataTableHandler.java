package com.everis.interesesdemora;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * <p>
 * Handles data sent by editable and tab navigable DataTables.
 * </p>
 * 
 * @author jagudopr
 * @version 1.0.0
 * 
 */
public class EditableTabNavigableDataTableHandler extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		res.setContentType("text/plain");
		System.out.println(req.getParameterMap());
		PrintWriter out = res.getWriter();
		System.out.println("Contenido de DataTable");
		String aux = req.getParameter("data");
		Enumeration e = req.getParameterNames();
		while(e.hasMoreElements()){
			String name = (String) e.nextElement();
			System.out.println("Name: " + name);
		}
		System.out.println(aux);
		
//		String d = aux.substring(aux.indexOf(':')+1, aux.length()-1);
//		String json = d.replaceAll("\"", "");
//		System.out.println(d.replaceAll("\"", ""));
		
		Gson gson = new Gson();
		
		
		Type collectionType = new TypeToken<Collection<Factura>>(){}.getType();
		Collection<Factura> facturas = gson.fromJson(aux, collectionType);
		//Factura f = gson.fromJson(aux, Factura.class);

		out.println("success");
	}
	
	public static void main(String[] args){
		Factura factura = new Factura();
		factura.setCentro("22");
		Gson gson = new Gson();
		System.out.println(">>>" + gson.toJson(factura));
	}

}
