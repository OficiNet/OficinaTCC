function voltar() {
    document.getElementById('ContentPlaceHolder1_txtValor').value = ' ';
    document.getElementById('ContentPlaceHolder1_txt_Obs').value = ' ';
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
    v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito




   return v;
}
