# HelloWorld

[![codecov](https://codecov.io/gh/svgreve/phoenix_boilerplate/branch/main/graph/badge.svg?token=R0RNKX31D3)](https://codecov.io/gh/svgreve/phoenix_boilerplate)

[README em Português do Brasil](/README_PT_BR.md)

##  Demo

[Deployed on Gigalixir](https://witty-advanced-amphibian.gigalixirapp.com/)

## New version

- TailwindCss support

- Dark mode (media controlled)

- Spanish interface


## Motivation

Consolidate the knowledge obtained from the [Rocketseat](https://rocketseat.com.br/) Ignite Elixir study trail and from reading the books Elixir in Action and Programming Phoenix >= 1.4.

The boilerplate includes the basic functionality for any web application to be developed with Elixir / Phoenix. To know:

- CI / CD using Github Actions and deployment using Gigalixir.
- User account management according to good security practices. Accounts not confirmed within two hours will be automatically deleted through a process running at the beginning of each hour.
- Internationalization, with initial support for English and Brazilian Portuguese and the possibility of easy addition of other languages.
- Supports sending CSS formatted emails through the Mailgun service, with the possibility of switching to another email sending provider.
- Data persistence using PostgreSQL, with the possibility of switching to use MySQL or MS SQL.

> This boilerplate was inspired by the [elixir_boilerplate developed by Mirego]((https://github.com/mirego/elixir-boilerplate)).

## How to use

1. Clone the project (git clone https://github.com/svgreve/phoenix_boilerplate)
2. Delete internal Git repository ( rm -rf .git )
3. Run boilerplate setup script ( ./boilerplate-setup.sh YourProjectName)
4. Create a new Git repository ( git init )
5. Create the first commit ( git commit -a -m "Initial commit" )


## Internationalization
Whenever you add a new string to the web application, use English and the gettext function. Example: 

```msg = gettext("This is a new message")```

Before making a commit, execute the command in the terminal, to prepare the files for the new translations:

 ```mix gettext.extract --merge```

Include translations in newly updated files in ```priv/getext``` folder

To add a new language (eg French), run the command:

```mix gettext.merge priv/gettext --locale fr```

<a href="https://iconscout.com/icons/brazil" target="_blank">Brazil Icon</a> by <a href="https://iconscout.com/contributors/iconscout" target="_blank">Iconscout Store</a>

<a href="https://iconscout.com/icons/spain" target="_blank">Spain Icon</a> by <a href="https://iconscout.com/contributors/iconscout" target="_blank">Iconscout Store</a>

<a href="https://iconscout.com/icons/united" target="_blank">United Kingdom Icon</a> by <a href="https://iconscout.com/contributors/iconscout">Iconscout Store</a>