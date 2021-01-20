$(document).ready(function () {    
    //local storage -- revisar primera vez
    if (localStorage.getItem('mes') !== "undefined") {
        let mes = localStorage.getItem('mes');
        $('#selectMeses').val(mes);  
        $("#selectMeses option[value='"+mes+"']").attr("selected", true);        
    } else {
        let mes = new Date().getMonth() + 1;
        localStorage.setItem('mes', mes); 
        $("#selectMeses option[value='" + mes + "']").attr("selected", true);
    }
    $("#selectMeses").change(function () {
        let mes = $('#selectMeses').val();
        localStorage.setItem('mes', mes);
        $("#selectMeses option[value='" + mes + "']").attr("selected", true);
    });

    $('#textoReporteMes').html("Reporte de " + $('#selectMeses option:selected').text());

    $('#list-variables').on('click', 'li', function () {
        let variable = $(this).text();
        let codVariable = variable.substring(0, 4);
        let descripcion = variable.substring(7, variable.length);
        this.className = "list-group-item list-group-item-primary";
        $(this).appendTo('#list-reporte');
        $.ajax({
            type: "POST",
            url: "insertVariablesReporte",
            data: {
                codVariable: codVariable,
                descripcion: descripcion
            },
            async: true,
            dataType: "JSON",
            success: function (response) {
                alert("Ha agregado esta variable al reporte");
            },
            error: function (a, b, c) {
                alert('No se agregaron datos');
            }
        });
        this.className = "list-group-item list-group-item-primary";
        $(this).appendTo('#list-reporte');
    });

    $('#list-reporte').on('click', 'li', function () {
        let variable = $(this).text();
        let codVariable = variable.substring(0, 4);
        this.className = "list-group-item list-group-item-light";
        $(this).appendTo('#list-variables');
        $.ajax({
            type: "POST",
            url: "deleteVariablesReporte",
            data: {
                codVariable: codVariable
            },
            async: true,
            dataType: "JSON",
            success: function (response) {
                alert("Ha eliminado esta variable del reporte");
            },
            error: function (a, b, c) {
                alert('No se eliminaron datos');
            }
        });

    });

    var th = 0;
    //Solo para ponerlo dentro de un bloque
    if (th==0) {
        //MESES
        //MES ACTUAL        
        let mes = $('#selectMeses option:selected').text();
        let desMes = mes.substring(0, 3).toUpperCase();
        //MES ANTERIOR
        let numMesAnt = $('#selectMeses').val() - 1;
        let mesAnt = $("#selectMeses option[value='" + numMesAnt + "']").text();
        let desMesAnt = mesAnt.substring(0, 3).toUpperCase();
        //DES CODIGO VARIABLE
        let variable = $(this).text();
        var cod = $(this).text().substring(0, 4);
        let des = "";
        if (variable.length > 24) {
            des = variable.substring(7, 23);
        } else {
            des = variable.substring(7, variable.length);
        }
        if (th == 0) {
            $('#tabla > thead > tr').append('<th class="acciones th-valor" >AFP - <br /><strong id="strong-actual">' + desMes + '</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">AFP - <br /><strong id="strong-anterior">' + desMesAnt + '</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">%AFP - <br /><strong id="strong-actual">' + desMes + '</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">%AFP - <br /><strong id="strong-anterior">' + desMesAnt + '</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">Variación - <br /><strong id="strong-variacion">VAR - MES</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">ISAPRE - <br /><strong id="strong-actual">' + desMes + '</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">ISAPRE - <br /><strong id="strong-anterior">' + desMesAnt + '</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">PACTADO ISAPRE - <br /><strong id="strong-actual">' + desMes + '</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">PACTADO ISAPRE - <br /><strong id="strong-anterior">' + desMesAnt + '</strong></th>');
            $('#tabla > thead > tr').append('<th class="acciones th-valor">Variación - <br /><strong id="strong-variacion">VAR - MES</strong></th>');
            th = 1;
        }
    }

    $("#list-reporte li").each(function () {            
        //MESES
        //MES ACTUAL        
        let mes = $('#selectMeses option:selected').text();
        let desMes = mes.substring(0, 3).toUpperCase();
        //MES ANTERIOR
        let numMesAnt = $('#selectMeses').val() - 1; 
        let mesAnt = $("#selectMeses option[value='" + numMesAnt + "']").text();
        let desMesAnt = mesAnt.substring(0, 3).toUpperCase();
        //DES CODIGO VARIABLE
        let variable = $(this).text();
        var cod = $(this).text().substring(0, 4);
        let des = "";
        if (variable.length > 24) {
            des = variable.substring(7, 23);
        } else {
            des = variable.substring(7, variable.length);
        }
        //  des = variable.substring(7, variable.length);
        $('#tabla > thead > tr').append('<th class="th-valor" id="'+cod+'">' + des + ' - <br /><strong id="strong-actual">' + desMes + '</strong></th>');
        $('#tabla > thead > tr').append('<th class="th-valor" id="'+cod+'">' + des + ' - <br /><strong id="strong-anterior">' + desMesAnt +'</strong></th>');
        $('#tabla > thead > tr').append('<th class="th-valor" id="' + cod + '">Variación <br /><strong id="strong-variacion"> VAR - MES</strong></th>');
        $('#botones').append('<button id="export" onClick="exportPdf(\'' + cod + '\')" type="button" class="btn btn-danger">PDF - ' + des.toUpperCase() + '</button>');
    });

    let texto = $('#selectMeses option:selected').text();
    let estado = $('#selectMeses').val();
    let mes = 0;
    if (estado > 12) {
        mes = estado-12;
    } else {
        mes = estado;
    }
    let ano = texto.substring(texto.length - 4, texto.length);
    console.log(ano);

    GetFichas(estado, mes, ano);    

    $("#generate").click(function () {        
        excel = new ExcelGen({
            "src_id": "tabla",
            "show_header": true,
            "type": "normal",
            "author": "Stantec",
            "file_name": "Reporte-Comparativo-RRHH.xlsx"            
        });
        excel.generate();
    });    

     
});

const formatterPeso = new Intl.NumberFormat('es-CO', {
    style: 'currency',
    currency: 'COP',
    minimumFractionDigits: 0
});

function exportPdf(cod) {
    let s = '.acciones,#export';
    $("#list-reporte li").each(function () {        
        //DES CODIGO VARIABLE        
        var codigo = $(this).text().substring(0, 4);  
        if (codigo!=cod) {
            s += ',#'+codigo+''
        }
        
    });    
    console.log(s);
    $('#tabla').tableHTMLExport({
        type: "pdf",
        filename: "Reporte-Comparativo-RRHH.pdf",
        ignoreColumns: s
        //ignoreRows: '.nopdf'
    });
    s = "";
}

function Buscar(texto,lista) {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById(texto);
    filter = input.value.toUpperCase();
    ul = document.getElementById(lista);
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

function GetFichas(estado,mes,ano) {
    var cont = 0;
    var estadoAnterior = estado - 1;
    var mesAnterior = mes - 1;
    if (estadoAnterior == 0) {
        estadoAnterior = 1;
    }
    if (mesAnterior == 0) {
        mesAnterior = 1;
    }
    var ficha =new Promise((resolve, reject) => {
    $.ajax({
        type: "POST",
        url: "getFichas",
        data: {
            estado: estado,
            estadoAnterior: estadoAnterior,
            mes: mes,
            mesAnterior: mesAnterior,
            ano: ano            
        },
        async: false,
        dataType: "JSON",
        success: (response) => {
            var html;
            //var array = [];
            for (i = 0; i < response.data.length; i++) { 
                //var id = i;
                var id = response.data[i].NumFicha;
                cont++;
                html += '<tr id="' + id + '">' +
                        '<td class="acciones">NO</td>' +
                        '<td>' + response.data[i].NumFicha+ '</td>' +
                        '<td>' + response.data[i].Nombre+ '</td>' +
                        '<td>' + response.data[i].RUT + '</td>' +
                        '<td class="acciones td-valor">' + response.data[i].AFP + '</td>' +
                        '<td class="acciones td-valor">' + response.data[i].AFPAnterior + '</td>' +
                        '<td class="acciones td-valor">' + response.data[i].PorcentajeAFP + '</td>' +
                        '<td class="acciones td-valor">' + response.data[i].PorcentajeAFPAnterior + '</td>' +
                        '<td class="acciones td-valor">' + response.data[i].VariacionPorcentajeAFP + '</td>' +
                        '<td class="acciones td-valor">' + response.data[i].ISAPRE + '</td>' +
                        '<td class="acciones td-valor">' + response.data[i].ISAPREAnterior + '</td>' +
                        '<td class="acciones td-valor">' + response.data[i].PactadoIsapre + '</td>' +                             
                        '<td class="acciones td-valor">' + response.data[i].PactadoIsapreAnterior + '</td>' +                                  
                        '<td class="acciones td-valor">' + response.data[i].VariacionPactadoIsapre + '</td>';                                
                html += '</tr>';
                //array.push(response.data[i].NumFicha);
                
            }                
            $('#tabla > tbody').append(html);  
            /*
            for (i = 0; i < response.data.length; i++)
            */
            //console.log(response);
            //console.log(response);
            resolve(response);
        },
        error: (err) => {
            reject(err);
        }
        
    });
    });    
    
    
    ficha.then(function (response) {
        var array = [];
        $("#list-reporte li").each(function () {            
            var variable = $(this).text();
            var codVariable = variable.substring(0, 4);
            array.push(codVariable);
            //console.log(array);            
        });
        //console.log(array.length);

        var numerosFicha='';
        let mes = $('#selectMeses').val();
        let mesAnterior = mes - 1;
        //console.log(response);
            
        for (i = 0; i < response.data.length; i++) {
            //let num = response.data[i].NumFicha;
            if (i == response.data.length - 1) {                
                numerosFicha += "'" + response.data[i].NumFicha + "'";
                
            } else {
                numerosFicha += "'" + response.data[i].NumFicha + "',";
                               
            }
                            
        }
        //1.253 Arreglar caso particular;
        console.log(numerosFicha);
            

        //Funcion get valores
        function enviar(indice) {            
            if (indice < array.length /*response.data.length*/) {
                //console.log(response.data[indice].NumFicha);
                //console.log();
                let codVariable = array[indice];
                $.ajax({
                    type: "POST",
                    url: "getValores",
                    data: {
                        numFicha: numerosFicha,
                        codVariable: codVariable,
                        mes: mes,
                        mesAnterior: mesAnterior
                    },
                    async: false,
                    dataType: "JSON",
                    success: (res) => {
                        var ans=0;
                        for (i = 0; i < response.data.length; i++) {
                            for (j = 0; j < res.data.length; j++) {
                                if (response.data[i].NumFicha == res.data[j].NumFicha) {
                                    ans = 1;
                                }
                            }                            
                            if (ans == 0) {
                                $('#tabla > tbody >#' + response.data[i].NumFicha).append('<td class="td-valor" id="' + codVariable + '">' + 0 + '</td>');
                                $('#tabla > tbody >#' + response.data[i].NumFicha).append('<td class="td-valor" id="' + codVariable + '">' + 0 +'</td>');
                                $('#tabla > tbody >#' + response.data[i].NumFicha).append('<td class="td-valor" id="' + codVariable + '">' + 0 +'</td>');
                            }
                            ans = 0;
                        }
                        for (i = 0; i < res.data.length; i++) {

                            let variacion = res.data[i].valor - res.data[i].valorAnterior;
                            let num = res.data[i].NumFicha;
                            if (variacion != 0) {
                                $('#tabla > tbody >#' + num).find('td').eq('0').html('SI');
                            }
                            /*
                            if (variacion < 0) {                                
                                $('#tabla > tbody >#' + num).append('<td class="td-valor" id="' + codVariable + '">' + formatterPeso.format(res.data[i].valor) + '</td>');
                                $('#tabla > tbody >#' + num).append('<td class="td-valor" id="' + codVariable + '">' + formatterPeso.format(res.data[i].valorAnterior) + '</td>');
                                $('#tabla > tbody >#' + num).append('<td class="td-valor-neg" id="' + codVariable + '">' + formatterPeso.format(variacion) + '</td>');
                            }                            
                            else {                                
                                $('#tabla > tbody >#' + num).append('<td class="td-valor" id="' + codVariable + '">' + formatterPeso.format(res.data[i].valor) + '</td>');
                                $('#tabla > tbody >#' + num).append('<td class="td-valor" id="' + codVariable + '">' + formatterPeso.format(res.data[i].valorAnterior) + '</td>');
                                $('#tabla > tbody >#' + num).append('<td class="td-valor" id="' + codVariable + '">' + formatterPeso.format(variacion) + '</td>');
                            }}
                            */
                            $('#tabla > tbody >#' + num).append('<td class="td-valor" id="' + codVariable + '">' + res.data[i].valor + '</td>');
                            $('#tabla > tbody >#' + num).append('<td class="td-valor" id="' + codVariable + '">' + res.data[i].valorAnterior + '</td>');
                            $('#tabla > tbody >#' + num).append('<td class="td-valor" id="' + codVariable + '">' + variacion + '</td>');
                                                      
                        }                            
                    },
                    error: (err) => {
                        reject(err);
                    }
                }).done(function (data) {
                    enviar(indice + 1);
                });
            }
        }
        enviar(0);

    });        
    
    

    
}









