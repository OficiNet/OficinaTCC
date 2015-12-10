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
//    //v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
//    //v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos


//   // var tmp = int + '';
//    v = v.replace(/([0-9]{2})$/g, ",$1");
//    if (v.length > 6)
//        v = v.replace(/([0-9]{3}),([0-9]{2}$)/g, ".$1,$2");

//   // return tmp;



   return v;
}
