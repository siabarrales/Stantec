﻿
function agregarSeparadorMiles(numero, caracterSeparador, caracterDecimal) {
    caracterSeparador = caracterSeparador === undefined || caracterSeparador === null ? "," : caracterSeparador;

    numero = String(numero);
    var decimales = "";
    if (numero.indexOf(".") !== -1) {
        decimales = numero.substring(numero.indexOf("."));
    }

    numero = String(numero).replace(decimales, "");

    decimales = decimales.replace(".", caracterDecimal);

    numero = numero === '' ? numero : Number(numero).toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g, '$1.').split('').reverse().join('').replace(/^[\.]/, '');

    while (numero.indexOf(",") !== -1) {
        numero = numero.replace(",", caracterSeparador);
    }

    numero = numero + decimales;

    return numero;
}
$(document).ready(function () {
    try {
        $('#dataTable').DataTable({
            ordering: false,
            language: {
                "sProcessing": "Procesando...",
                "sLengthMenu": "Mostrar _MENU_ Registros",
                "sZeroRecords": "&nbsp;",
                "sEmptyTable": "&nbsp;",
                "sInfo": "Encontrados: _TOTAL_ Registros (Mostrando del _START_ al _END_)",
                "sInfoEmpty": "* No se han encontrado resultados en la búsqueda",
                "sInfoFiltered": "",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            },
            aoColumnDefs: [{ 'bSortable': false, 'aTargets': ['no-sortable'] }]
        });
        $($($('#dataTable')[0]).parent().find("input")[0]).attr("name", "txtBuscarDT");
    }
    catch (e) { }
    /*
    $("#iframe").fancybox({
        width: '85%',
        height: '60%',
        autoScale: false,
        transitionIn: 'elastic',
        transitionOut: 'elastic',
        type: 'iframe'
    });
    */

    $("#modalLayoutEmpresasAgregar").click(function () {
        var empresa = $("#ddlLayoutEmpresas").val();

        var urlSeleccionaEmpresa = $("#urlSeleccionaEmpresa").val();

        $.ajax({
            url: urlSeleccionaEmpresa,
            type: "POST",
            data: { _IdEmpresa: empresa },
            async: true,
            success: function (data) {
                var urlHome = $("#urlHome").val();
                window.location = urlHome;
            }
        });
    });
});


$(document).ready(function () {
    $("#aBaseModalCambioContrasena").click(function () {
        $("#btnBaseModalCambioContrasena").click();
    });

    $("#baseBtnCambiaContrasena").click(function () {
        console.log("sdlfhiosdbvnkld");
        $.ajax({
            url: "BaseCambiaContrasena",
            type: "POST",
            data: {
                contrasena: $("#baseTxtContrasena").val(),
            },
            async: true,
            success: function (data) {
                console.log(data);
                if (data.Verificador) {
                    $("#baseBtnCerrarModal").click();
                    abrirInformacion("Cambio Contraseña", data.Mensaje);
                    $("#baseTxtContrasena").val("");
                }
                else {
                    abrirError("Cambio Contraseña", data.Mensaje);
                }
            }
        });
    });
});

function abrirLoadingCompleto(texto) {
    /*
    if (texto === undefined || texto === null) {
        texto = "Cargando";
    }
    $("#loading-ajax-texto").html(texto);
    jQuery("#loading-ajax").show();
    */
}
function cerrarLoadingCompleto() {
    /*
    jQuery("#loading-ajax").hide();
    */
}


var tipoAlert = 2;

function abrirError(titulo, mensaje, callBackOK) {
    if (tipoAlert === 1) {
        $("#btnModalError").click();

        $("#modalErrorMensaje").html(mensaje);
        $("#modalErrorTitulo").html(titulo);
        $("#modalErrorAceptar").click(function () {
            if (callBackOK !== null && callBackOK !== undefined && (callBackOK instanceof Function)) {
                callBackOK();
            }

            $("#modalErrorCerrar").click();
        });
    }
    else {
        alert(mensaje);
    }
}

function abrirInformacion(titulo, mensaje, callBackOK) {
    if (tipoAlert === 1) {
        $("#btnModalInformacion").click();

        $("#modalInformacionMensaje").html(mensaje);
        $("#modalInformacionTitulo").html(titulo);
        $("#modalInformacionAceptar").click(function () {
            if (callBackOK !== null && callBackOK !== undefined && (callBackOK instanceof Function)) {
                callBackOK();
            }

            $("#modalInformacionCerrar").click();
        });
    }
    else {
        alert(mensaje);
    }
}

function abrirConfirmacion(titulo, mensaje, callBackOK, callBackCancel) {
    if (tipoAlert === 1) {
        $("#btnModalConfirmacion").click();

        $("#modalConfirmacionMensaje").html(mensaje);
        $("#modalConfirmacionTitulo").html(titulo);
        $("#modalConfirmacionAceptar").click(function () {
            if (callBackOK !== null && callBackOK !== undefined && (callBackOK instanceof Function)) {
                callBackOK();
            }

            $("#modalConfirmacionCerrar").click();
        });
        $("#modalConfirmacionCancelar").click(function () {
            if (callBackCancel !== null && callBackCancel !== undefined && (callBackCancel instanceof Function)) {
                callBackCancel();
            }

            $("#modalConfirmacionCerrar").click();
        });
    }
    else {
        var conf = confirm(mensaje);

        if (conf) {
            if (callBackOK !== null && callBackOK !== undefined && (callBackOK instanceof Function)) {
                callBackOK();
            }
        }
        else {
            if (callBackCancel !== null && callBackCancel !== undefined && (callBackCancel instanceof Function)) {
                callBackCancel();
            }
        }
    }
}

var spinnerButton = function () {
    return "<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span> ";
}


var ____botonesLoading = [];

var addBotonLoading = function (id) {
    if (____botonesLoading.find(m => m.id === id) === undefined) {
        ____botonesLoading.push({
            id: id,
            htmlOriginal: $("#" + id).html(),
            htmlLoading: (spinnerButton() + $("#" + id).html())
        });
    }
}

function activarLoadingBoton(id) {
    addBotonLoading(id);
    $("#" + id).html(____botonesLoading.find(m => m.id === id).htmlLoading);
    $("#" + id).attr("disabled", "disabled");
}

function desactivarLoadingBoton(id) {
    addBotonLoading(id);
    $("#" + id).html(____botonesLoading.find(m => m.id === id).htmlOriginal);
    $("#" + id).removeAttr("disabled");
}






function formatearNumero(numero, simboloAntes, valorDefecto) {
    simboloAntes = simboloAntes === undefined || simboloAntes === null ? "" : simboloAntes;
    valorDefecto = valorDefecto === undefined || valorDefecto === null ? numero : valorDefecto;

    var numeroTemp = "" + numero;
    if (!isNaN(numeroTemp)) {
        numeroTemp = numeroTemp.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g, '$1.');
        numeroTemp = numeroTemp.split('').reverse().join('').replace(/^[\.]/, '');
        return simboloAntes + numeroTemp;
    }
    else {
        return valorDefecto;
    }
}