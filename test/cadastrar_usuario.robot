*** Settings ***
Documentation    Essa suite testa o Cadastrar Perfil de Usuário Inteligente
Resource         ../resources/keywords.robot
Test Setup       Abrir o navegador

*** Test Cases ***
Caso de Teste 01 - Cadastro com todos os campos preenchidos
    [Documentation]    Esse teste verifica o cadastro com todos os campos preenchidos
    [Tags]            Todos campos preenchidos
    Dado que o usuário está na tela "Cadastrar Perfil de Usuário Inteligente"
    Quando o usuário preenche o campo "Nome Completo" com @nome_completo
    E o usuário preenche o campo "Data de Nascimento" com @data_nascimento
    E o usuário registra sua "Impressão Digital"
    E o usuário preencheu o campo "Preferências de Navegação" com @preferenciasNavegacao
    E o usuário realiza o upload da "Foto de Perfil"
    E o usuário seleciona a "Preferência de Idioma" com @preferenciaIdioma
    E o usuário seleciona o "Nível de Privacidade" como @nivelPrivacidade
    E o usuário aciona a checkbox "Consetimento para Coleta de Dados"
    Então o usuário clica no botão "Finalizar Cadastro" e finaliza com sucesso

Caso de Teste 02 - Cadastro cancelado
    [Documentation]    Esse teste verifica o cancelamento de cadastro
    [Tags]             Cancelar cadastro
    Dado que o usuário está na tela "Cadastrar Perfil de Usuário Inteligente"
    Quando o usuário preenche o campo "Nome Completo" com @nome_completo
    E o usuário preenche o campo "Data de Nascimento" com @data_nascimento
    E o usuário registra sua "Impressão Digital"
    E o usuário preencheu o campo "Preferências de Navegação" com @preferenciasNavegacao
    E o usuário realiza o upload da "Foto de Perfil"
    E o usuário seleciona a "Preferência de Idioma" com @preferenciaIdioma
    E o usuário seleciona o "Nível de Privacidade" como @nivelPrivacidade
    E o usuário aciona a checkbox "Consetimento para Coleta de Dados"
    Então o usuário clica no botão "Cancelar" e cancela o cadastro

Caso de Teste 03 - Cadastro com apenas os campos obrigatório preenchidos
    [Documentation]    Esse teste verifica o cadastro com apenas os campos obrigatórios preenchidos
    [Tags]             Campos obrigatórios preenchidos
    Dado que o usuário está na tela "Cadastrar Perfil de Usuário Inteligente"
    Quando o usuário preenche o campo "Nome Completo" com @nome_completo
    E o usuário preenche o campo "Data de Nascimento" com @data_nascimento
    E o usuário registra sua "Impressão Digital"
    E o usuário realiza o upload da "Foto de Perfil"
    E o usuário seleciona a "Preferência de Idioma" com @preferenciaIdioma
    E o usuário seleciona o "Nível de Privacidade" como @nivelPrivacidade
    E o usuário aciona a checkbox "Consetimento para Coleta de Dados"
    Então o usuário clica no botão "Cancelar" e cancela o cadastro

Caso de Teste 04 - Cadastro com todos os campos ausentes
    [Documentation]    Esse teste verifica a tentativa de cadastro com os campos ausentes.
    [Tags]             Todos campos ausentes
    Dado que o usuário está na tela "Cadastrar Perfil de Usuário Inteligente"
    Então o usuário clica no botão "Finalizar Cadastro" sem preencher os campos
    Então o sistema exibe a mensagem "Preencha este campo" no campo "Nome Completo"
    E o perfil não é salvo

Caso de Teste 05 - Cadastro com o campo "Nome Completo" ausente
    [Documentation]    Esse teste verifica a tentativa de cadastro com o campo "nome completo" ausente.
    [Tags]             Campo nome completo ausente
    Dado que o usuário está na tela "Cadastrar Perfil de Usuário Inteligente"
    E o usuário preenche o campo "Data de Nascimento" com @data_nascimento
    E o usuário registra sua "Impressão Digital"
    E o usuário preencheu o campo "Preferências de Navegação" com @preferenciasNavegacao
    E o usuário realiza o upload da "Foto de Perfil"
    E o usuário seleciona a "Preferência de Idioma" com @preferenciaIdioma
    E o usuário seleciona o "Nível de Privacidade" como @nivelPrivacidade
    E o usuário aciona a checkbox "Consetimento para Coleta de Dados"
    Então o usuário clica no botão "Finalizar Cadastro"
    Então o sistema exibe a mensagem "Preencha este campo" no campo "Nome Completo"
    E o perfil não é salvo

Casos de Teste 06 - Cadastro com o campo "Data Nascimento" ausente
    Dado que o usuário está na tela "Cadastrar Perfil de Usuário Inteligente"
    Quando o usuário preenche o campo "Nome Completo" com @nome_completo
    E o usuário registra sua "Impressão Digital"
    E o usuário preencheu o campo "Preferências de Navegação" com @preferenciasNavegacao
    E o usuário realiza o upload da "Foto de Perfil"
    E o usuário seleciona a "Preferência de Idioma" com @preferenciaIdioma
    E o usuário seleciona o "Nível de Privacidade" como @nivelPrivacidade
    Então o usuário clica no botão "Finalizar Cadastro"   
    Então o sistema exibe a mensagem "Preencha este campo" no campo "Data Nascimento"
    E o perfil não é salvo

Caso de Teste 07 - Cadastro com o campo "Foto de Perfil" ausente.
    Dado que o usuário está na tela "Cadastrar Perfil de Usuário Inteligente"
    Quando o usuário preenche o campo "Nome Completo" com @nome_completo
    E o usuário preenche o campo "Data de Nascimento" com @data_nascimento
    E o usuário registra sua "Impressão Digital"
    E o usuário preencheu o campo "Preferências de Navegação" com @preferenciasNavegacao
    E o usuário seleciona a "Preferência de Idioma" com @preferenciaIdioma
    E o usuário seleciona o "Nível de Privacidade" como @nivelPrivacidade
    Então o usuário clica no botão "Finalizar Cadastro"
    Então o sistema exibe a mensagem "Selecione um arquivo" no campo "Foto de Perfil"
    E o perfil não é salvo

