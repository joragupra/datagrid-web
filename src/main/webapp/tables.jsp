<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<title>Editable grid example</title>
		<style type="text/css" title="currentStyle">
			@import "css/jquery.dataTables.css";
		</style>
		<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#editable').dataTable();
			} );
		</script>
	</head>
	<body>
		<h1>Registro de facturas</h1>
		<table id="editable">
		    <thead>
		        <tr>
		            <th>Cod. centro</th>
		            <th>Denominación centro</th>
		            <th>OG Vig.</th>
		            <th>CIF/DNI/NIF</th>
		            <th>Nº factura</th>
		            <th>Nº de FOG</th>
		            <th>F. exped.</th>
		            <th>F. de recepci&oacute;n</th>
		            <th>F. pago</th>
		            <th>Importe</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>5321</td>
		            <td>HOSPITAL REINA SOFIA</td>
		            <td>5321</td>
		            <td>B-23456718</td>
		            <td>2011/000001</td>
		            <td>2011/000001</td>
		            <td>14/01/2011</td>
		            <td>20/01/2011</td>
		            <td>11/06/2011</td>
		            <td>300,56</td>
		        </tr>
		        <tr>
		            <td>5321</td>
		            <td>HOSPITAL REINA SOFIA</td>
		            <td>5321</td>
		            <td>B-23456718</td>
		            <td>2011/000002</td>
		            <td>2011/000002</td>
		            <td>14/01/2011</td>
		            <td>20/01/2011</td>
		            <td>11/06/2011</td>
		            <td>176,32</td>
		        </tr>
		        <tr>
		        	<td>5321</td>
		            <td>HOSPITAL REINA SOFIA</td>
		            <td>5321</td>
		            <td>B-23456718</td>
		            <td>2012/000001</td>
		            <td>2012/000001</td>
		            <td>14/01/2011</td>
		            <td>20/01/2011</td>
		            <td>11/06/2011</td>
		            <td>410,99</td>
		        </tr>
		    </tbody>
		</table>
		
		<br/>
		<br/>
		<br/>
		
		<form id="pattern">
			<fieldset>
				<legend>Patr&oacute; de repetici&oacute;n</legend>
			
				<label for="n_factura">N&uacute;mero de factura</label>
				<input type="text" name="n_factura"/>
				
				<label for="cif_dni_nif">CIF/DNI/NIF</label>
				<input type="text" name="cif_dni_nif"/>
				
				<label for="cod_centro">C&oacute;digo del Centro</label>
				<input type="text" name="cod_centro"/>
			</fieldset>
		</form>
	</body>
</html>