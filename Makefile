# para o make executar comandos no terminal bash
SHELL := bash

#Avisar quando uma variável indefinida for referenciada
MAKEFLAGS += --warn-undefined-variables

# definindo uma variavel
REQUIREMENTS?=requirements

requirements-base: # Compile base requirements
	poetry run pip-compile \
	--output-file=requirements/base.txt \
	-v \
	pyproject.toml

requirements-dev:requirements-base  # Compila os requisitos de desenvolvimento após instalar as dependências
	poetry run pip-compile \
		--extra=dev \
		--output-file=requirements/dev.txt \
		-v \
		pyproject.toml

install-dev:  # Instala as dependências de desenvolvimento
	python -m pip install \
	-r $(REQUIREMENTS)/dev.txt
