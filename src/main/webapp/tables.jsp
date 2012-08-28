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
		<script type="text/javascript">
			
		
		
			var giCount = 1;
 
 			function fnRetrieveFirstCellInLastRow( tableId ){
	 			var selector = '#' + tableId + ' tr:last td:first';
	 			var cell = $(selector);
	 			return cell;
 			}
 
			function fnClickAddRow(oTable) {
				var cod_centro = $("#rep_pattern :input[name='cod_centro']").val();
				var cif_dni_nif = $("#rep_pattern :input[name='cif_dni_nif']").val();
				
				var nueva = [[cod_centro,giCount,'',cif_dni_nif,'','','','','','']];
				
				oTable.fnAddData( nueva );
				
				fnMakeEditable( oTable );
				
				fnMakeTabulable ( oTable );
				
				fnRetrieveFirstCellInLastRow('editable').click();
			}
			
			function fnMakeEditable(oTable) {
				/* Apply the jEditable handlers to the table */
			    $('td', oTable.fnGetNodes()).editable( function(value, settings) {
			        return(value);
			     } , {
			        height  : '14px',
			        tooltip : 'Pulse para modificar dato',
			        placeholder : 'Inserte dato',
			        submit  : '',
			        onblur  : 'submit',
			    });
			}
			
			function fnMakeTabulable(oTable){
				var identif = '#' + $(oTable).attr('id') + ' td.editbox';
				$(identif).bind('keydown', 'input,select,textarea', function(event) {
			    	if(event.keyCode==9) {
			    		$(this).find("input").submit();
			    		if ($(this).is(".lasteditbox")) {
			    			var currentRow = oTable.fnGetPosition( this )[0];
			    			var lastRow = oTable.fnGetData().length - 1;
			    			if( currentRow == lastRow ){
			    				fnClickAddRow( oTable );
			    			}
			    			identif = '#' + $(oTable).attr('id') + ' td:first-child';
			    			var cell = $(identif)[currentRow + 1];
				    		cell.click();
			    		} else {
			    			$(this).next("td.editbox").click();
			    		}
			    		return false;
			    	}
			    });
			}
			
			$(document).ready(function() {
				
				var numCols = $("#editable").find('tr')[0].cells.length;
			  
			    /* Init DataTables */
			    var oTable = $('#editable').dataTable({
			    	'bPaginate' : false,
			    	'bSort' : false,
			    	'bFilter' : false,
			    	"aoColumnDefs": [
						{ "sClass": "lasteditbox", "aTargets": [ numCols - 1 ] }
					],
					"aoColumns": [
						{ "sClass": "editbox" },
						{ "sClass": "editbox" },
						{ "sClass": "editbox" },
						{ "sClass": "editbox" },
						{ "sClass": "editbox" },
						{ "sClass": "editbox" },
						{ "sClass": "editbox" },
						{ "sClass": "editbox" },
						{ "sClass": "editbox" },
						{ "sClass": "editbox lasteditbox" }
					]
			    });
			    
			    fnMakeEditable( oTable );
			    
			    fnMakeTabulable( oTable );
			    
			    // Associate alt+n shortcut to add new row
			    Mousetrap.bind(['alt+n'], function(e) {
			    	fnClickAddRow( $('#editable').dataTable() );
				    return false;
				});
			    
			    // Associate alt+l shortcut to clear table
			    Mousetrap.bind(['alt+l'], function(e) {
			    	$('#editable').dataTable().fnClearTable();
				    return false;
				});
			    
			} );

		</script>
	</head>
	<body>
		<h1>Registro de facturas</h1>
		
		<a class="btn btn-primary btn-small" onclick="fnClickAddRow( $('#editable').dataTable() );">Nueva factura ('ALT' + 'N')</a>
		
		<a class="btn btn-primary btn-small" onclick="fnCleanTable( $('#editable').dataTable() );">Limpiar tabla ('ALT' + 'L')</a>
		
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
		    	<!--
		    	<tr>
		            <td></td>
		            <td></td>
		            <td></td>
		            <td></td>
		            <td></td>
		            <td></td>
		            <td></td>
		            <td></td>
		            <td></td>
		            <td></td>
		        </tr>
		        -->
		        <!--
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
		            <td class="editbox lasteditbox">300,56</td>
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
		            <td class="editbox lasteditbox">176,32</td>
		        </tr>
		        <tr>
		        	<td class="editbox">5322</td>
		            <td class="editbox">HOSPITAL VIRGEN MACARENA</td>
		            <td class="editbox">5321</td>
		            <td class="editbox">B-23456718</td>
		            <td class="editbox">2012/000001</td>
		            <td class="editbox">2012/000001</td>
		            <td class="editbox">14/01/2011</td>
		            <td class="editbox">20/01/2011</td>
		            <td class="editbox">11/06/2011</td>
		            <td class="editbox lasteditbox">410,99</td>
		        </tr>
		        -->
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