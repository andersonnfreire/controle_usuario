# Controle de Usuários - v1.0

User control was implemented in object pascal (delphi) and in this system the following features were requested:

 - CRUD of a user in the database.
 - It must be possible to allow the user to access or not each system interface. Each interface must be allowed to assign search, change, inclusion and exclusion access.
 - When entering the system, the application must allow entering the user's name and password, the system must store the name of the last user.
 - Perform a user log control with changes, inclusion and exclusion by interface.
 - For each user it should be possible to choose the color of the interface, the color of the Disabled Edits, the Color of the EditBeleza Background, the Color of the Main Bar, the background color of the main screen.
 
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

