
# Necessidade a ser resolvida
Desafio:

Crud para gerenciamento de tarefas.



# Especificação técnica

1 - Agendamento de atividades 

Foi desenvolvido uma solução para agendamento com base em calendário,
com as seguintes informações:
 - status
 - titulo
 - descrição
 - responsável
 - data
 - prioridade

Utilizado o plugin [fullCalendar](https://fullcalendar.io/)  

O crud foi todo feito com requisições ajax, para evitar recarregamento de paginas.

2 - Template utilizado:

[QuixLab](https://themewagon.com/themes/free-bootstrap-4-html5-admin-dashboard-template-quixlab/)

Template selecionado por motivos de atualizações das bibliotecas e plugins.

3 - Autenticação: 

Utilizado a gem [Devise](https://github.com/plataformatec/devise) para autenticação e registro de usuários.
Utilizado a gem [OmniAuthGoogleOauth2](https://github.com/zquestz/omniauth-google-oauth2)

Foi optado por incluir a autenticação Google oauth2 para dar mais conforto e flexibilidade aos usuários no momento da autenticação.
Os usuários do sistema poderam tanto criar uma nova conta como se logar utilizando sua conta Google.

3 - Hospedagem

[Heroku](https://task-manager-jhony.herokuapp.com/)

Hospedado aplicação no Heroku por já fornecer grande suporte a aplicações com o framework Rails, facil manutenção e configuração.


## Configuraçes do ambiente

* Ruby version: 2.6.0

* Rails version: 5.2.3

* Banco de dados: PostgreSql


## Ambiente de Desenvolvimento
* Clone este repositorio
* Crie e configure o arquivo .env na raíz do projeto com as variaveis de ambiente utilizadas no arquivo database.yml
* Rode os comandos para configuração do ambiente Rails.

 `bundle install`


`rails db:setup`

Suba o servidor rails rodando o comando:
  
  `rails s`

Testes unitários:
 
   `rspec`

O Projeto estara disponivel em
 
  `http://localhost:3000`






