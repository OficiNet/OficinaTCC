﻿/* -----  INICIO VALIDA TELEFONE ----- */
function mascara(o, f) {
    v_obj = o
    v_fun = f
    setTimeout("execmascara()", 1)
}

function execmascara() {
    v_obj.value = v_fun(v_obj.value)
}

function mtel(v) {
    v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito
    v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
    return v;
}
/* -----  FIM VALIDA TELEFONE ----- */

/* -----  INICIO VALIDA CPF CNPJ ----- */
function mascaraMutuario(o, f) {
    v_obj = o
    v_fun = f
    setTimeout('execmascara()', 1)
}

function execmascara() {
    v_obj.value = v_fun(v_obj.value)
}

function cpfCnpj(v) {
    //Remove tudo o que não é dígito
    v = v.replace(/\D/g, "")

    if (v.length <= 13) { //CPF

        //Coloca um ponto entre o terceiro e o quarto dígitos
        v = v.replace(/(\d{3})(\d)/, "$1.$2")

        //Coloca um ponto entre o terceiro e o quarto dígitos
        //de novo (para o segundo bloco de números)
        v = v.replace(/(\d{3})(\d)/, "$1.$2")

        //Coloca um hífen entre o terceiro e o quarto dígitos
        v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2")

    } else { //CNPJ
        //Coloca ponto entre o segundo e o terceiro dígitos
        v = v.replace(/^(\d{2})(\d)/, "$1.$2")

        //Coloca ponto entre o quinto e o sexto dígitos
        v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")

        //Coloca uma barra entre o oitavo e o nono dígitos
        v = v.replace(/\.(\d{3})(\d)/, ".$1/$2")

        //Coloca um hífen depois do bloco de quatro dígitos
        v = v.replace(/(\d{4})(\d)/, "$1-$2")
    }
    return v
}
/* -----  FIM VALIDA CPF CNPJ ----- */

function voltar() {
    document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Logradouro_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Sexo_Editar').value = ' ';
    return true;
}



function alerta() {
    var nome = document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value;
    var sexo = document.getElementById('ContentPlaceHolder1_txt_Sexo_Editar').value;
    var telefone = document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').value;
    var logradouro = document.getElementById('ContentPlaceHolder1_txt_Logradouro_Editar').value;
    var complemento = document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').value;
    var numero = document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').value;
    var bairro = document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').value;
    var cidade = document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').value;
    var estado = document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value;
    // nome.style = "font-weight:bold";
    if (nome == '' || sexo == '' || telefone == '' || logradouro == '' || complemento == '' || numero == '' || bairro == '' || cidade == '' || estado == '') {
        return true;
    }
    else {
        toastr['info']('Cliente ' + nome + ' Atualizado Com Sucesso.', 'OficiNet');
        return true;
    }
}



function validacadastro() {
    var msg = "";
    var flag = 'true';


    // VALIDA CAMPO NOME
    var nome = document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value;
    nome = nome.replace(/^\s+/, "");
    nome = nome.replace(/\s+$/, "");
    // alert(nome.length);
    if (nome.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value = '';
        toastr['info']('Campo inválido', 'OficiNet');
        flag = 'false';
        return true;
    }
    if (nome.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        //msg += "Não é permitido espaços em branco no início da frase\n";
        nome = nome.replace(/^\s+/, "");
        nome = nome.replace(/\s+$/, "");
    }
    else if (nome.search(/\s+$/) != -1) {//verifica espaço lado direito
        // msg += "Não é permitido espaços em branco no final da frase\n";
        nome = nome.replace(/^\s+/, "");
        nome = nome.replace(/\s+$/, "");
    }
    if (nome.search(/[^a-zA-Z0-9\s]/i) != -1) {
        msg += 'Não é permitido caracteres especiais\n';
        nome = nome.replace(/[^a-zA-Z0-9\\s]/gi, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').focus();
        toastr['info'](msg, 'OficiNet');
        nome.value = nome;
        return false;

    }

    // VALIDA CAMPO ENDEREÇO
    var logradouro = document.getElementById('ContentPlaceHolder1_txt_Logradouro_Editar').value;
    logradouro = logradouro.replace(/^\s+/, "");
    logradouro = logradouro.replace(/\s+$/, "");

    if (logradouro.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Logradouro_Editar').value = '';
        flag = 'false';
        return true;
    }
    if (logradouro.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        //msg += "Não é permitido espaços em branco no início da frase\n";
        logradouro = logradouro.replace(/^\s+/, "");
        logradouro = logradouro.replace(/\s+$/, "");
    }
    else if (logradouro.search(/\s+$/) != -1) {//verifica espaço lado direito
        //msg += "Não é permitido espaços em branco no final da frase\n";
        logradouro = logradouro.replace(/^\s+/, "");
        logradouro = logradouro.replace(/\s+$/, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Logradouro_Editar').focus();
        toastr['info'](msg, 'OficiNet');
        logradouro.value = logradouro;
        return false;
    }

    // VALIDA CAMPO COMPLEMENTO
    var complemento = document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').value;
    complemento = complemento.replace(/^\s+/, "");
    complemento = complemento.replace(/\s+$/, "");
    if (complemento.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').value = '';
        flag = 'false';
        return true;
    }
    if (complemento.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        //msg += "Não é permitido espaços em branco no início da frase\n";
        complemento = complemento.replace(/^\s+/, "");
        complemento = complemento.replace(/\s+$/, "");
    }
    else if (complemento.search(/\s+$/) != -1) {//verifica espaço lado direito
        //msg += "Não é permitido espaços em branco no final da frase\n";
        complemento = complemento.replace(/^\s+/, "");
        complemento = complemento.replace(/\s+$/, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').focus();
        toastr['info'](msg, 'OficiNet');
        complemento.value = complemento;
        return false;
    }

    // VALIDA CAMPO NÚMERO
    var numero = document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').value;
    numero = numero.replace(/^\s+/, "");
    numero = numero.replace(/\s+$/, "");
    if (numero.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').value = '';
        flag = 'false';
        return true;
    }
    if (numero.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        // msg += "Não é permitido espaços em branco no início da frase\n";
        //alert(msg);
        numero = numero.replace(/^\s+/, "");
        numero = numero.replace(/\s+$/, "");
    }
    else if (numero.search(/\s+$/) != -1) {//verifica espaço lado direito
        // msg += "Não é permitido espaços em branco no final da frase\n";
        numero = numero.replace(/^\s+/, "");
        numero = numero.replace(/\s+$/, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').focus();
        toastr['info'](msg, 'OficiNet');
        numero.value = numero;
        return false;
    }

    // VALIDA CAMPO BAIRRO
    var bairro = document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').value;
    bairro = bairro.replace(/^\s+/, "");
    bairro = bairro.replace(/\s+$/, "");
    if (bairro.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').value = '';
        flag = 'false';
        return true;
    }
    if (bairro.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        // msg += "Não é permitido espaços em branco no início da frase\n";
        bairro = bairro.replace(/^\s+/, "");
        bairro = bairro.replace(/\s+$/, "");
    }
    else if (bairro.search(/\s+$/) != -1) {//verifica espaço lado direito
        // msg += "Não é permitido espaços em branco no final da frase\n";
        bairro = bairro.replace(/^\s+/, "");
        bairro = bairro.replace(/\s+$/, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').focus();
        toastr['info'](msg, 'OficiNet');
        bairro.value = bairro;
        return false;
    }

    // VALIDA CAMPO CIDADE
    var cidade = document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').value;
    cidade = cidade.replace(/^\s+/, "");
    cidade = cidade.replace(/\s+$/, "");
    if (cidade.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').value = '';
        flag = 'false';
        return true;
    }
    if (cidade.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        // msg += "Não é permitido espaços em branco no início da frase\n";
        cidade = cidade.replace(/^\s+/, "");
        cidade = cidade.replace(/\s+$/, "");
    }
    else if (cidade.search(/\s+$/) != -1) {//verifica espaço lado direito
        // msg += "Não é permitido espaços em branco no final da frase\n";
        cidade = cidade.replace(/^\s+/, "");
        cidade = cidade.replace(/\s+$/, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').focus();
        toastr['info'](msg, 'OficiNet');
        cidade.value = cidade;
        return false;
    }

    // VALIDA CAMPO ESTADO
    var estado = document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value;
    estado = estado.replace(/^\s+/, "");
    estado = estado.replace(/\s+$/, "");
    if (estado.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value = '';
        flag = 'false';
        return true;
    }
    if (estado.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        // msg += "Não é permitido espaços em branco no início da frase\n";
        estado = estado.replace(/^\s+/, "");
        estado = estado.replace(/\s+$/, "");
        if (estado.length == 0) {
            document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value = '';
            flag = 'false';
            return true;
        }
    }
    else if (estado.search(/\s+$/) != -1) {//verifica espaço lado direito
        // msg += "Não é permitido espaços em branco no final da frase\n";
        estado = estado.replace(/^\s+/, "");
        estado = estado.replace(/\s+$/, "");
    }
    if (msg) {
        document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').focus();
        toastr['info'](msg, 'OficiNet');
        estado.value = estado;
        return false;
    }

    // VALIDA CAMPO TELEFONE
    var telefone = document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').value;
    telefone = telefone.replace(/[^a-zA-Z0-9\\s]/gi, "");
    if (telefone.length == 0) {
        toastr['info']('Campo Telefone inválido', 'OficiNet');
        document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').focus();
        flag = 'false';
        return false;
    }
    else {
        if (telefone.length == 10 || telefone.length == 11) {
        } else {
            msg += "Campo telefone possui minimo 10 digitos maximo 11 digitos\n";
        }
        if (msg) {
            document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').focus();
            toastr['info'](msg, 'OficiNet');
            telefone.value = telefone;
            return false;
        }
    }
    if (flag == 'true') {
        toastr['info']('Cliente ' + nome + ' Atualizado Com Sucesso.', 'OficiNet');
    }
    return true;
}