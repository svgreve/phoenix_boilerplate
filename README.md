# HelloWorld

[![codecov](https://codecov.io/gh/svgreve/phoenix_boilerplate/branch/main/graph/badge.svg?token=R0RNKX31D3)](https://codecov.io/gh/svgreve/phoenix_boilerplate)

# Motivação

Consolidar os conhecimentos obtidos com a trilha estudos Rocketseat Ignite Elixir e os decorrentes da leitura dos livros Elixir in Action e Programming Phoenix >= 1.6.

O boilerplate inclui as funcionalidades básicas para qualquer aplicação web a ser desenvolvida com Elixir / Phoenix. A saber:

- CI / CD utilizando Github Actions e deployment usando Gigalixir.
- Gestão de contas de usuário segundo boas práticas de segurança.
- Internacionalização, com suporte inicial a inglês e português do Brasil e possibilidade de fácil adição de outros idiomas.
- Suporte a envio de e-mails formatados através de CSS, através do serviço Mailgun, com fácil troca para outro provedor de envio de emails.
- Persistência de dados usando PostgreSQL, com possibilidade de troca para uso de MySQL ou MS SQL.

O boilerplate foi inspirado no [elixir_boilerplate desenvolvido pela Mirego](https://github.com/mirego/elixir-boilerplate).

# Como usar

1. Clonar o projeto (git clone https://github.com/svgreve/phoenix_boilerplate)
2. Deletar o repositório Git interno ( rm -rf .git )
3. Executar o script de setup do boilerplate ( ./boilerplate-setup.sh YourProjectName)
4. Criar um novo repositório Git ( git init )
5. Criar o primeiro commit ( git commit -a -m "Initial commit" )

# Internacionalização

1. Sempre que adicionar uma nova string na aplicação, usar inglês e a função gettext. Exemplo:
			```msg = gettext("This is a new message")```
			
2. Antes de fazer um commit executar o comando no terminal, para preparar os arquivos para as novas traduções:

		mix gettext.extract --merge
		
3. Incluir as traduções nos arquivos recém-atualizados na pasta ``priv/getext``
4. Para adicionar um novo idioma (p.ex. espanhol), rodar o comando:

	```mix gettext.merge priv/gettext --locale es```

