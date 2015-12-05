function excluir() {
    document.getElementById('ContentPlaceHolder1_lblResp').innerHTML = '';
    var r = confirm('Deseja realmente excluir esse veículo ?');
    if (r == true) {
        return true;
    } else {
        return false;
    }
}
function carregarform() {
    document.getElementById('ContentPlaceHolder1_txt_Placa').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Modelo').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Marca').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Ano').value = ' ';
    return true;
}

function mascara(o, f) {
    v_obj = o
    v_fun = f
    setTimeout("execmascara()", 1)
}

function execmascara() {
    v_obj.value = v_fun(v_obj.value)
}

function mtel(v) {
    v = v.replace(/\D/g, "");
    //Remove tudo o que não é dígito
    //v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    return v;
}

function validar() {

    var msg = "";
    // VALIDA CAMPO PLACA
    var placa = document.getElementById('ContentPlaceHolder1_txt_Placa').value;
    if (placa.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Placa').value = '';
        return true;
    }
    if (placa.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        //msg += "Não é permitido espaços em branco no início da frase\n";
        placa = placa.replace(/^\s+/, "");
        placa = placa.replace(/\s+$/, "");
        if (placa.length == 0) {
            document.getElementById('ContentPlaceHolder1_txt_Placa').value = '';
            return true;
        }
    }
    else if (placa.search(/\s+$/) != -1) {//verifica espaço lado direito
        // msg += "Não é permitido espaços em branco no final da frase\n";
        placa = placa.replace(/^\s+/, "");
        placa = placa.replace(/\s+$/, "");
    }
    if (placa.search(/[^a-zA-Z0-9\s]/i) != -1) {
        msg += 'Não é permitido caracteres especiais\n';
        placa = placa.replace(/[^a-zA-Z0-9\\s]/gi, "");
        document.getElementById('ContentPlaceHolder1_txt_Placa').value = '';
    }
    if (placa.search(/[a-z]{3}-?\d{4}/gim) != -1) { }
    else {
        toastr['info']('Placa inválida.', 'OficiNet');
        document.getElementById('ContentPlaceHolder1_txt_Placa').focus();
        return false;
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Placa').focus();
        toastr['info'](msg, 'OficiNet');
        placa.value = placa;
        return false;
    }

    // VALIDA CAMPO MODELO
    var modelo = document.getElementById('ContentPlaceHolder1_txt_Modelo').value;
    if (modelo.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        //msg += "Não é permitido espaços em branco no início da frase\n";
        modelo = modelo.replace(/^\s+/, "");
        modelo = modelo.replace(/\s+$/, "");
        if (modelo.length == 0) {
            document.getElementById('ContentPlaceHolder1_txt_Modelo').value = '';
            return true;
        }
    }
    else if (modelo.search(/\s+$/) != -1) {//verifica espaço lado direito
        //msg += "Não é permitido espaços em branco no final da frase\n";
        modelo = modelo.replace(/^\s+/, "");
        modelo = modelo.replace(/\s+$/, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Modelo').focus();
        toastr['info'](msg, 'OficiNet');
        modelo.value = modelo;
        return false;
    }

    // VALIDA CAMPO MARCA
    var marca = document.getElementById('ContentPlaceHolder1_txt_Marca').value;
    if (marca.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        //msg += "Não é permitido espaços em branco no início da frase\n";
        marca = marca.replace(/^\s+/, "");
        marca = marca.replace(/\s+$/, "");
        if (marca.length == 0) {
            document.getElementById('ContentPlaceHolder1_txt_Marca').value = '';
            return true;
        }
    }
    else if (marca.search(/\s+$/) != -1) {//verifica espaço lado direito
        //msg += "Não é permitido espaços em branco no final da frase\n";
        marca = marca.replace(/^\s+/, "");
        marca = marca.replace(/\s+$/, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Marca').focus();
        toastr['info'](msg, 'OficiNet');
        marca.value = marca;
        return false;
    }

    // VALIDA CAMPO ANO
    var ano = document.getElementById('ContentPlaceHolder1_txt_Ano').value;
    if (ano.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Ano').value = '';
        document.getElementById('ContentPlaceHolder1_txt_Ano').focus();
        return true;
    }
    else if (ano.length == 1 || ano.length == 2 || ano.length == 3) {
        toastr['info']('Campo Ano inválido', 'OficiNet');
        document.getElementById('ContentPlaceHolder1_txt_Ano').focus();
        return false;
    }

    var ddlclientes = document.getElementById('ContentPlaceHolder1_ddlClientes').value;
    if (ddlclientes == '- Selecione -') {
        toastr['info']('Por favor, selecione um Cliente', 'OficiNet');
        return false;
    }
    return true;
}