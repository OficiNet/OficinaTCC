function voltar() {
    document.getElementById('ContentPlaceHolder1_lblSenha_Editar').style.display = "none";
    document.getElementById('ContentPlaceHolder1_ConfirmarSenha').style.display = "none";
    document.getElementById('ContentPlaceHolder1_txt_Senha_Editar').style.display = "none";
    document.getElementById('ContentPlaceHolder1_txtConfirmarSenha').style.display = "none";
    document.getElementById('ContentPlaceHolder1_txt_Senha_Editar').value = ' ';
    document.getElementById('ContentPlaceHolder1_txtConfirmarSenha').value = ' ';
    return true;
}