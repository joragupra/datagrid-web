<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<title>Editable grid example</title>
		<style type="text/css" title="currentStyle">
			@import "css/jquery.dataTables.css";
		</style>
		<link href="css/bootstrap.css" rel="stylesheet">
		<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery.jeditable.js"></script>
		<script type="text/javascript" language="javascript" src="js/mousetrap.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery.editAndTabDataTables.js"></script>
		<script type="text/javascript">
		
			function extractHeaderIds(table) {
				var headerIds = new Array();
				$( table + " thead > tr > th" ).each(function(){
					headerIds.push($(this).attr('id'));
				});
				return headerIds;
			}
		
			function sendTable(table) {
				var ids = extractHeaderIds(table);
				var data  = $(table).dataTable().fnGetNodes();
				var json = '[';
				
				$(data).each(function(){
					var row = '{';
					var i = 0;
					
					if(json!='['){
						json += ',';
					}
					
			        $('> td', this).each(function(){
			        	if(row!='{'){
			        		row += ',';
			        	}
			        	
			        	var val = "''";
			        	if($(this).text()!='') {
			        		val = $(this).text();
			        	}
			        	row += "'" + ids[i] + "':'" + val + "'";
			        	i++;
			        });
			        row += '}';
			        json += row;
			    });
				
				json += ']';
				
				
				//alert('json ' + json);
				var request = $.ajax({
					  url: "/intweb/send.do",
					  type: "POST",
					  data: {'data' : json},
					  dataType: "json"
					});
				
				request.done(function(msg) {
					alert('exito');
				});

				request.fail(function(jqXHR, textStatus) {
				  alert( "Request failed: " + textStatus );
				});
			}
			
			$(document).ready(function() {
				
				editAndTabDataTable('#editable');
			    
			} );

		</script>
	</head>
	<body>
		<h1>Registro de facturas</h1>
		
		<p>
			<a class="btn btn-small" onclick="fnClickAddRow( $('#editable').dataTable() );">Nueva factura ('ALT' + 'N')</a>
		
			<a class="btn btn-danger btn-small" onclick="$('#editable').dataTable().fnClearTable();">Limpiar tabla ('ALT' + 'L')</a>
		</p>
		
		<br/>
		<br/>
		<br/>
		
		<table id="editable">
		    <thead>
		        <tr>
		            <th id="cod_centro">Cod. centro</th>
		            <th id="nombre_centro">Denominación centro</th>
		            <th id="og">OG Vig.</th>
		            <th id="cif_dni_nif">CIF/DNI/NIF</th>
		            <th id="n_factura">N&ordm; factura</th>
		            <th id="n_fog">N&ordm; de FOG</th>
		            <th id="n_exp">F. exped.</th>
		            <th id="f_recep">F. de recepci&oacute;n</th>
		            <th id="f_pago">F. pago</th>
		            <th id="importe">Importe</th>
		        </tr>
		    </thead>
		    <tbody>
		    </tbody>
		</table>
		
		<br/>
		<br/>
		<br/>
		
		<form id="rep_pattern" class="form-inline">
			<fieldset>
				<legend>Patr&oacute;n de repetici&oacute;n</legend>
			
				<label for="n_factura">N&uacute;mero de factura</label>
				<input type="text" name="n_factura"/>
				
				<label for="cif_dni_nif">CIF/DNI/NIF</label>
				<input type="text" name="cif_dni_nif" id="cif_dni_nif"/>
				
				<label for="cod_centro">C&oacute;digo del Centro</label>
				<input type="text" name="cod_centro"/>
			</fieldset>
		</form>
		
		<a class="btn btn-primary" onclick="sendTable('#editable');">Enviar datos</a>
	</body>
</html>