# Controle de Usuários - v1.0

O controle de usuários foi implementado em object pascal (delphi) e nesse sistema foram requisitada as seguintes funcionalidades:

 - CRUD de um usuário no banco de dados.
 - Deve ser possível permitir o usuário acessar ou não cada interface do sistema. Em cada interface deve ser permitido atribuir acesso de pesquisa, alteração, inclusão e exclusão.
 - Ao entrar no sistema o aplicativo deve permitir entrar com o nome e senha do usuário, o sistema deve guardar o nome do ultimo usuário.
 - Efetuar um controle de log do usuário com alterações, inclusão e exclusão por interface.
 - Para cada usuário deve ser possível escolher a cor da interface, cor dos Edits Desabilitados, Cor do EditBeleza Fundo, Cor da Barra Principal, Cor do fundo da tela principal.
 
 # Parametros
 
 - The main interface must be dynamically assembled according to the user's level of access to the interfaces.
 - The user registration interface must allow configuring the interfaces that the user will access, the access level and the viewing settings.
 - Access level information for each system user must be stored in the database.
 - The log must be stored according to the user in a single table in the database.
 
# Prerequisites
- You only need to have one database (used SQL Server).

# Built With
 - Delphi 7 - Object Pascal
 - SQL Server - Microsoft

# Authors
Anderson N. Freire - @andersonnfreire

# License
This project is licensed under the MIT License - see the LICENSE.md file for details.

