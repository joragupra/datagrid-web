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
		<script type="text/javascript">
			var giCount = 1;
			
			function fnClickAddRow() {
				var cod_centro = $("#rep_pattern :input[name='cod_centro']").val();
				var cif_dni_nif = $("#rep_pattern :input[name='cif_dni_nif']").val();
				
				alert('cif_dni_nif: ' + cif_dni_nif);
				$('#editable').dataTable().fnAddData( [
				cod_centro,
				giCount+".2",
				giCount+".3",
				cif_dni_nif,
				giCount+".5",
				giCount+".6",
				giCount+".7",
				giCount+".8",
				giCount+".9",
				giCount+".10" ] );
			
				giCount++;
			}
			
			$(document).ready(function() {
			  
			    
			    /* Init DataTables */
			    var oTable = $('#editable').dataTable();
			    
			    /* Apply the jEditable handlers to the table */
			    $('td', oTable.fnGetNodes()).editable( function(value, settings) { 
			        //alert(value);
			        
			        return(value);
			     } , {
			    	 "callback": function( sValue, y ) {
			             var aPos = oTable.fnGetPosition( this );
			             oTable.fnUpdate( sValue, aPos[0], aPos[1] );
			          },
			          "submitdata": function ( value, settings ) {
			             return {
			                "row_id": this.parentNode.getAttribute('id'),
			                "column": oTable.fnGetPosition( this )[2]
			             };
			          },
			          "height": "14px",
			        submit  : '',
			        onblur  : 'submit',
			    });

			    
			    
			    
			    $('#editable td.editbox').bind('keydown', 'input,select,textarea', function(event) {
			    //$('#editable tbody td').on('keydown', 'input,select,textarea', function(e) {
			    	if(event.keyCode==9) {
			    		$(this).find("input").submit();
			    		if ($(this).is(".lasteditbox")) {
			    		$("td.editbox:first").click();
			    		} else {
			    		   $(this).next("td.editbox").click();
			    		}
			    		return false;
			    		      }
			    		   });
			
			    
			    
			    
			} );
			
			
			
			
				
			


		</script>
	</head>
	<body>
		<h1>Registro de facturas</h1>
		
		<a class="btn btn-primary btn-small" onclick="fnClickAddRow();">Nueva factura</a>
		
		<br/>
		<br/>
		<br/>
		
		<table id="editable">
		    <thead>
		        <tr>
		            <th>Cod. centro</th>
		            <th>Denominación centro</th>
		            <th>OG Vig.</th>
		            <th>CIF/DNI/NIF</th>
		            <th>N&ordm; factura</th>
		            <th>N&ordm; de FOG</th>
		            <th>F. exped.</th>
		            <th>F. de recepci&oacute;n</th>
		            <th>F. pago</th>
		            <th>Importe</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td class="editbox">5321</td>
		            <td class="editbox">HOSPITAL REINA SOFIA</td>
		            <td class="editbox">5321</td>
		            <td class="editbox">B-23456718</td>
		            <td class="editbox">2011/000001</td>
		            <td class="editbox">2011/000001</td>
		            <td class="editbox">14/01/2011</td>
		            <td class="editbox">20/01/2011</td>
		            <td class="editbox">11/06/2011</td>
		            <td class="editbox">300,56</td>
		        </tr>
		        <tr>
		            <td class="editbox">5321</td>
		            <td class="editbox">HOSPITAL REINA SOFIA</td>
		            <td class="editbox">5321</td>
		            <td class="editbox">B-23456718</td>
		            <td class="editbox">2011/000002</td>
		            <td class="editbox">2011/000002</td>
		            <td class="editbox">14/01/2011</td>
		            <td class="editbox">20/01/2011</td>
		            <td class="editbox">11/06/2011</td>
		            <td class="editbox">176,32</td>
		        </tr>
		        <tr>
		        	<td class="editbox">5321</td>
		            <td class="editbox">HOSPITAL REINA SOFIA</td>
		            <td class="editbox">5321</td>
		            <td class="editbox">B-23456718</td>
		            <td class="editbox">2012/000001</td>
		            <td class="editbox">2012/000001</td>
		            <td class="editbox">14/01/2011</td>
		            <td class="editbox">20/01/2011</td>
		            <td class="editbox">11/06/2011</td>
		            <td class="editbox">410,99</td>
		        </tr>
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
	</body>
</html>