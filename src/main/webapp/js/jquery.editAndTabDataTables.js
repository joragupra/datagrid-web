			function fnRetrieveFirstCellInLastRow( tableId ){
	 			var selector = '#' + tableId + ' tr:last td:first';
	 			var cell = $(selector);
	 			return cell;
 			}
 
			function fnClickAddRow(oTable) {
				var cod_centro = $("#rep_pattern :input[name='cod_centro']").val();
				var cif_dni_nif = $("#rep_pattern :input[name='cif_dni_nif']").val();
				var n_factura = $("#rep_pattern :input[name='n_factura']").val();
				
				var nueva = [[cod_centro,'','',cif_dni_nif,n_factura,'','','','','']];
				
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
			        placeholder : '',
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
			
			function editAndTabDataTable( table, url ) {
				
				var numCols = $(table).find('tr')[0].cells.length;
				  
			    /* Init DataTables */
			    var oTable = $(table).dataTable({
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
			    	fnClickAddRow( $(table).dataTable() );
				    return false;
				});
			    
			    // Associate alt+l shortcut to clear table
			    Mousetrap.bind(['alt+l'], function(e) {
			    	$(table).dataTable().fnClearTable();
				    return false;
				});
			    
			    // Associate alt+l shortcut to clear table
			    Mousetrap.bind(['alt+s'], function(e) {
			    	sendTable(table, url);
				    return false;
				});
			}
			
			function extractHeaderIds(table) {
				var headerIds = new Array();
				$( table + " thead > tr > th" ).each(function(){
					headerIds.push($(this).attr('id'));
				});
				return headerIds;
			}
			
			function createJsonFromTable(table) {
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
			        	
			        	var val = "";
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
				
				return json;
			}
		
			function sendTable(table, processingUrl) {
				
				var json = createJsonFromTable(table);
				
				//alert('json ' + json);
				var request = $.ajax({
					  url: processingUrl,
					  type: "POST",
					  data: {'data' : json},
					  dataType: "json"
					});
				
				request.done(function(response) {
					if(response.code==0){
						alert('Success!');
						alert(response.message);
					}
					else{
						alert('There was some error :(');
						alert(response.message);
					}
				});

				request.fail(function(jqXHR, textStatus) {
				  alert( "Request failed: " + textStatus );
				});
			}