*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Variáveis de entrada:
${NOME_COMPLETO}      Ana Mary
${DATA_NASC}          27/01/2005
${PREF_NAV}           Modo escuro ativado, fonte grande, notificações desativadas
${FOTO_PERFIL}        C:\Desafio\SGID\test\gatoperfil.jfif

#ID's:
${ID_NOME}            id=nome
${ID_DATA_NASC}       id=dataNascimento
${ID_IMPRESSAO_DIG}   id=impressao-digital
${ID_PREF_NAV}        id=preferenciasNavegacao
${ID_FOTO_PERFIL}     id=fotoPerfil
${ID_IDIOMA}          id=idioma
${ID_NIVEL_PRIV}      id=privacidade
${ID_CONSETIMENTO}    id=consentimento

#Demais variáveis de identificação:
${URL}                https://desafio-equipe.vercel.app/
${TITULO_DA_PAGE}     Cadastrar Perfil de Usuário Inteligente
${BOTAO_FIM}          Finalizar Cadastro
${BOTAO_CANCELAR}     Cancelar
${IDIOMA}             pt
${NIVEL_PRIV}         medio

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser
    
Dado que o usuário está na tela "Cadastrar Perfil de Usuário Inteligente"
    Go To    url=${URL}
    Wait Until Page Contains    text=${TITULO_DA_PAGE}

Quando o usuário preenche o campo "Nome Completo" com @nome_completo
    Input Text    locator=${ID_NOME}    text=${NOME_COMPLETO}

E o usuário preenche o campo "Data de Nascimento" com @data_nascimento
    Input Text    locator=${ID_DATA_NASC}    text=${DATA_NASC}

E o usuário registra sua "Impressão Digital"
    Click Element    locator=${ID_IMPRESSAO_DIG}

E o usuário preencheu o campo "Preferências de Navegação" com @preferenciasNavegacao
    Input Text    locator=${ID_PREF_NAV}    text=${PREF_NAV}

E o usuário realiza o upload da "Foto de Perfil"
    Choose File    ${ID_FOTO_PERFIL}    ${FOTO_PERFIL}
E o usuário seleciona a "Preferência de Idioma" com @preferenciaIdioma
    Wait Until Element Is Visible    ${ID_IDIOMA}
    Select From List By Value        ${ID_IDIOMA}    ${IDIOMA}

E o usuário seleciona o "Nível de Privacidade" como @nivelPrivacidade
    Wait Until Element Is Visible    ${ID_NIVEL_PRIV}
    Select From List By Value        ${ID_NIVEL_PRIV}    ${NIVEL_PRIV}
    
E o usuário aciona a checkbox "Consetimento para Coleta de Dados"
    Wait Until Element Is Visible    ${ID_CONSETIMENTO}
    Select Checkbox   locator=${ID_CONSETIMENTO}

Então o usuário clica no botão "Finalizar Cadastro" e finaliza com sucesso
    Capture Page Screenshot    evidencias/antes_finalizar_cadastro_sucesso.png
    Click Button    locator=${BOTAO_FIM}
    Capture Page Screenshot    evidencias/cadastro_sucesso.png

Então o usuário clica no botão "Cancelar" e cancela o cadastro
    Click Button    locator=${BOTAO_CANCELAR}
    Capture Page Screenshot    evidencias/cadastro_cancelado.png
        
Então o usuário clica no botão "Finalizar Cadastro" sem preencher os campos
    Click Button    ${BOTAO_FIM}
    Capture Page Screenshot    evidencias/erro_campos_obrigatorios.png

Então o sistema exibe a mensagem "Preencha este campo" no campo "Nome Completo"
    Wait Until Element Is Visible    css=input:invalid
    Element Should Be Visible    css=input:invalid
    Capture Page Screenshot    evidencias/erro_nome_completo.png

E o perfil não é salvo
    #Faz permanecer na mesma página após o erro
    Wait Until Location Is    ${URL}    timeout=5s

Então o sistema exibe a mensagem "Preencha este campo" no campo "Data Nascimento"
    Wait Until Element Is Visible    css=input:invalid
    Element Should Be Visible    css=input:invalid
        Capture Page Screenshot    evidencias/erro_data_nasc.png

Então o usuário clica no botão "Finalizar Cadastro" 
    Click Button    ${BOTAO_FIM}

Então o sistema exibe a mensagem "Selecione um arquivo" no campo "Foto de Perfil"
    Wait Until Element Is Visible    css=input:invalid
    Element Should Be Visible    css=input:invalid
        Capture Page Screenshot    evidencias/erro_foto.png