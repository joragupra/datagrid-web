			function fnRetrieveFirstCellInLastRow( tableId ){
	 			var selector = '#' + tableId + ' tr:last td:first';
	 			var cell = $(selector);
	 			return cell;
 			}
 
			function fnClickAddRow(oTable) {
				var cod_centro = $("#rep_pattern :input[name='cod_centro']").val();
				var cif_dni_nif = $("#rep_pattern :input[name='cif_dni_nif']").val();
				
				var nueva = [[cod_centro,'','',cif_dni_nif,'','','','','','']];
				
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
			
			function editAndTabDataTable( table ) {
				
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
			}