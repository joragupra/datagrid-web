package com.everis.datagrid;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mockito.Mockito;

import com.everis.interesesdemora.Factura;
import com.google.gson.reflect.TypeToken;

import junit.framework.TestCase;
import static org.mockito.Mockito.*;

public class DatagridHandlerTest extends TestCase {

	public void testService() {
		try {
			DatagridHandler handler = mock(DatagridHandler.class,
					CALLS_REAL_METHODS);
			HttpServletRequest request = mock(HttpServletRequest.class);
			Collection<SimpleTestDataTransferObject> dtos = new ArrayList<SimpleTestDataTransferObject>();
			SimpleTestDataTransferObject simpleDto1 = new SimpleTestDataTransferObject();
			SimpleTestDataTransferObject simpleDto2 = new SimpleTestDataTransferObject(
					"anotherA", "anotherB");
			dtos.add(simpleDto1);
			dtos.add(simpleDto2);
			// when(handler.processData(anyCollection()));
			doReturn(new TypeToken<Collection<SimpleTestDataTransferObject>>() {
			}).when(handler).getCollectionType();
			doReturn(new DatagridHandlerResponse()).when(handler).processData(
					anyCollection());
			doReturn(JsonUtil.toJson(dtos)).when(request).getParameter(
					DatagridHandler.DATA_PARAM_NAME);
			HttpServletResponse response = mock(HttpServletResponse.class);
			PrintWriter stubbedWriter = mock(PrintWriter.class);
			doReturn(stubbedWriter).when(response).getWriter();

			handler.service(request, response);

			verify(handler, times(1)).processData(anyCollection());
		} catch (ServletException e) {
			fail("Servlet Exception launched");
		} catch (IOException e) {
			fail("IOException launched");
		}
	}
}
