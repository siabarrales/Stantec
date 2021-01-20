$(document).ready(function () {   
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
        let des = variable.substring(7, variable.length);
        $('#tabla > thead > tr').append('<th class="th-valor">' + des + ' - ' + desMes + '</th>');
        $('#tabla > thead > tr').append('<th class="th-valor">' + des + ' - ' + desMesAnt +'</th>');
        $('#tabla > thead > tr').append('<th class="th-valor">Variación</th>');        
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
      
     
});

const formatterPeso = new Intl.NumberFormat('es-CO', {
    style: 'currency',
    currency: 'COP',
    minimumFractionDigits: 0
});

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
    var ficha =new Promise((resolve, reject) => {
    $.ajax({
        type: "POST",
        url: "getFichas",
        data: {
            estado: estado,
            mes: mes,
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
                html += '<tr id="'+id+'">' +
                        '<td>' + response.data[i].NumFicha+ '</td>' +
                        '<td>' + response.data[i].Nombre+ '</td>' +
                        '<td>' + response.data[i].RUT + '</td>' +
                        '<td>' + response.data[i].AFP + '</td>' +
                        '<td>' + response.data[i].PorcentajeAFP + '</td>' +
                        '<td>' + response.data[i].ISAPRE+ '</td>' +
                        '<td>' + response.data[i].PactadoIsapre  + '</td>';                                    
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
        //numerosFicha = "'1-273','001-288'";
        console.log(numerosFicha);
            

        //Funcion get valores
        function enviar(indice) {
            // Es importante notar que estamos utilizando jQuery
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
                            //console.log(ans);
                            if (ans == 0) {
                                $('#tabla > tbody >#' + response.data[i].NumFicha).append('<td class="td-valor">'+formatterPeso.format(0)+'</td>');
                                $('#tabla > tbody >#' + response.data[i].NumFicha).append('<td class="td-valor">' + formatterPeso.format(0) +'</td>');
                                $('#tabla > tbody >#' + response.data[i].NumFicha).append('<td class="td-valor">' + formatterPeso.format(0) +'</td>');
                            }
                            ans = 0;
                        }
                        for (i = 0; i < res.data.length; i++) {
                                
                            let variacion = res.data[i].valor - res.data[i].valorAnterior;
                            let num = res.data[i].NumFicha;
                            
                            
                            $('#tabla > tbody >#' + num).append('<td class="td-valor">' + formatterPeso.format(res.data[i].valor) + '</td>');
                            $('#tabla > tbody >#' + num).append('<td class="td-valor">' + formatterPeso.format(res.data[i].valorAnterior) + '</td>');
                            $('#tabla > tbody >#' + num).append('<td class="td-valor">' + formatterPeso.format(variacion) + '</td>');
                            /*else {
                                $('#tabla > tbody >#' + i).append('<td>0</td>');
                                $('#tabla > tbody >#' + i).append('<td>0</td>');
                                $('#tabla > tbody >#' + i).append('<td>0</td>');
                            }*/
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









