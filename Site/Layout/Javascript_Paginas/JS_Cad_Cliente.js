/* -----  INICIO VALIDA TELEFONE ----- */
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
    document.getElementById('ContentPlaceHolder1_txt_Nome').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Telefone').value = '(22)23234-3435';
    document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '85.419.246/0001-55';
    document.getElementById('ContentPlaceHolder1_txt_Complemento').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Numero').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Bairro').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Cidade').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Estado').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_logradouro').value = 'a';
    document.getElementById('ContentPlaceHolder1_txtValidarCpfCnpj').value = '85.419.246/0001-55';
    document.getElementById('ContentPlaceHolder1_lblValida_cpf_cnpj').innerHTML = '';
    r = document.getElementById('ContentPlaceHolder1_lblValida_cpf_cnpj').innerHTML;
    document.getElementById('painelcadastro').style.display = 'none';
    document.getElementById('painelcpfcnpj').style.display = 'none';
    document.getElementById('painelgrid').style.display = 'block';
    return true;

}

function newcliente() {
    document.getElementById('painelcpfcnpj').style.display = 'block';
    document.getElementById('ContentPlaceHolder1_txt_Nome').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Telefone').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Complemento').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Numero').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Bairro').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Cidade').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Estado').value = '';
    document.getElementById('ContentPlaceHolder1_txt_logradouro').value = '';
    document.getElementById('ContentPlaceHolder1_radioSexo').value = 'F';
    document.getElementById('ContentPlaceHolder1_txtValidarCpfCnpj').value = '';
    document.getElementById('painelcadastro').style.display = 'none';
    document.getElementById('painelgrid').style.display = 'none';
}

function validacpfcnpj() {
    document.getElementById('ContentPlaceHolder1_txt_Nome').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Telefone').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Complemento').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Numero').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Bairro').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Cidade').value = '';
    document.getElementById('ContentPlaceHolder1_txt_Estado').value = '';
    document.getElementById('ContentPlaceHolder1_txt_logradouro').value = '';
    document.getElementById('ContentPlaceHolder1_radioSexo').value = 'F';
    document.getElementById('painelcadastro').style.display = 'block';
    document.getElementById('painelgrid').style.display = 'none';
    document.getElementById('paineleditar').style.display = 'none';
}

function exibirpainelcadastro() {
    document.getElementById('painelgrid').style.display = 'none';
    document.getElementById('painelcadastro').style.display = 'block';
}

function carregarform() {
    document.getElementById('ContentPlaceHolder1_txt_Nome').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Telefone').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Complemento').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Numero').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Bairro').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Cidade').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_Estado').value = 'a';
    document.getElementById('ContentPlaceHolder1_txt_logradouro').value = 'a';
    document.getElementById('ContentPlaceHolder1_txtValidarCpfCnpj').value = '85.419.246/0001-55';
    return true;
}

function carregarformpesq() {
    document.getElementById('ContentPlaceHolder1_txt_Nome').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Nome').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Telefone').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Complemento').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Numero').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Bairro').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Cidade').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Estado').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_logradouro').value = ' ';
    document.getElementById('ContentPlaceHolder1_txtValidarCpfCnpj').value = '85.419.246/0001-55';
    document.getElementById('painelgrid').style.display = 'block';
    document.getElementById('painelcadastro').style.display = 'none';
    document.getElementById('painelcpfcnpj').style.display = 'none';
    return true;
}

function carregarformv() {
    document.getElementById('ContentPlaceHolder1_txt_Nome').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Telefone').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Complemento').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Numero').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Bairro').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Cidade').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Estado').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_logradouro').value = ' ';
    document.getElementById('ContentPlaceHolder1_lblValida_cpf_cnpj').innerHTML = '';
    return true;
}

function excluir() {
    carregarform();
    document.getElementById('ContentPlaceHolder1_lblResp').innerHTML = ''
    var r = confirm('Deseja realmente excluir ?');
    if (r == true) {
        return true;
    } else {
        return false;
    }
}

function validacadastro() {
    var msg = "";
    var flag = 'true';
    document.getElementById('ContentPlaceHolder1_txtValidarCpfCnpj').value = ' ';

    var cpf = document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value;
    cpf = cpf.replace('.', '').replace('.', '').replace('-', '').replace('/', '');
    if (cpf.length == 11) {
        document.getElementById('ContentPlaceHolder1_radioCpf_Cnpj_0').value = 'cpf';
    }
    else if (cpf.length == 14) {
        document.getElementById('ContentPlaceHolder1_radioCpf_Cnpj_0').value = 'cnpj';
    }

    // VALIDA CAMPO NOME
    var nome = document.getElementById('ContentPlaceHolder1_txt_Nome').value;
    nome = nome.replace(/^\s+/, "");
    nome = nome.replace(/\s+$/, "");
    //  alert(nome.length);
    if (nome.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Nome').value = '';
        alert('Campo Inválido!');
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
        document.getElementById('ContentPlaceHolder1_txt_Nome').focus();
        alert(msg);
        nome.value = nome;
        return false;

    }

    // VALIDA CAMPO ENDEREÇO
    var logradouro = document.getElementById('ContentPlaceHolder1_txt_logradouro').value;
    logradouro = logradouro.replace(/^\s+/, "");
    logradouro = logradouro.replace(/\s+$/, "");

    if (logradouro.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_logradouro').value = '';
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
        document.getElementById('ContentPlaceHolder1_txt_logradouro').focus();
        alert(msg);
        logradouro.value = logradouro;
        return false;
    }

    // VALIDA CAMPO COMPLEMENTO
    var complemento = document.getElementById('ContentPlaceHolder1_txt_Complemento').value;
    complemento = complemento.replace(/^\s+/, "");
    complemento = complemento.replace(/\s+$/, "");
    if (complemento.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Complemento').value = '';
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
        document.getElementById('ContentPlaceHolder1_txt_Complemento').focus();
        alert(msg);
        complemento.value = complemento;
        return false;
    }

    // VALIDA CAMPO NÚMERO
    var numero = document.getElementById('ContentPlaceHolder1_txt_Numero').value;
    numero = numero.replace(/^\s+/, "");
    numero = numero.replace(/\s+$/, "");
    if (numero.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Numero').value = '';
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
        document.getElementById('ContentPlaceHolder1_txt_Numero').focus();
        alert(msg);
        numero.value = numero;
        return false;
    }

    // VALIDA CAMPO BAIRRO
    var bairro = document.getElementById('ContentPlaceHolder1_txt_Bairro').value;
    bairro = bairro.replace(/^\s+/, "");
    bairro = bairro.replace(/\s+$/, "");
    if (bairro.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Bairro').value = '';
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
        document.getElementById('ContentPlaceHolder1_txt_Bairro').focus();
        alert(msg);
        bairro.value = bairro;
        return false;
    }

    // VALIDA CAMPO CIDADE
    var cidade = document.getElementById('ContentPlaceHolder1_txt_Cidade').value;
    cidade = cidade.replace(/^\s+/, "");
    cidade = cidade.replace(/\s+$/, "");
    if (cidade.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Cidade').value = '';
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
        document.getElementById('ContentPlaceHolder1_txt_Cidade').focus();
        alert(msg);
        cidade.value = cidade;
        return false;
    }

    // VALIDA CAMPO ESTADO
    var estado = document.getElementById('ContentPlaceHolder1_txt_Estado').value;
    estado = estado.replace(/^\s+/, "");
    estado = estado.replace(/\s+$/, "");
    if (estado.length == 0) {
        document.getElementById('ContentPlaceHolder1_txt_Estado').value = '';
        flag = 'false';
        return true;
    }
    if (estado.search(/^\s+/) != -1) {//verifica espaço lado esquerdo
        // msg += "Não é permitido espaços em branco no início da frase\n";
        estado = estado.replace(/^\s+/, "");
        estado = estado.replace(/\s+$/, "");
        if (estado.length == 0) {
            document.getElementById('ContentPlaceHolder1_txt_Estado').value = '';
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
        document.getElementById('ContentPlaceHolder1_txt_Estado').focus();
        alert(msg);
        estado.value = estado;
        return false;
    }

    // VALIDA CAMPO TELEFONE
    var telefone = document.getElementById('ContentPlaceHolder1_txt_Telefone').value;
    telefone = telefone.replace(/[^a-zA-Z0-9\\s]/gi, "");
    if (telefone.length == 0) {
        alert('Campo Telefone Invalido!');
        document.getElementById('ContentPlaceHolder1_txt_Telefone').focus();
        flag = 'false';
        return false;
    }
    else {
        if (telefone.length == 10 || telefone.length == 11) {
        } else {
            msg += "Campo telefone possui minimo 10 digitos maximo 11 digitos\n";
        }
        if (msg) {
            document.getElementById('ContentPlaceHolder1_txt_Telefone').focus();
            alert(msg);
            telefone.value = telefone;
            return false;
        }
    }
    if (flag == 'true') {
        alert('Cliente ' + nome + ' Cadstrado Com Sucesso.');
    }
    return true;
}

function validarcnpjcpf() {
    var validar = document.getElementById('ContentPlaceHolder1_lblValida_cpf_cnpj').textContent;
    if (validar == 'true') {

        alert('CPF || CNPJ já Existe!');
    }
    else if (validar == 'false') {
        carregarformv();
        exibirpainelcadastro();
        var c = document.getElementById('ContentPlaceHolder1_txtValidarCpfCnpj').value;
        var t = cpfCnpj(c);
        document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = t;
    }
    else if (validar == 'invalido') {
        newcliente();
        document.getElementById('ContentPlaceHolder1_txtValidarCpfCnpj').focus();
        alert('CPF ou CNPJ Inválido!');
    }
}

window.setTimeout('validarcnpjcpf()', 1);