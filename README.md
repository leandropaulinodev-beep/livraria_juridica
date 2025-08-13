# Módulo Livraria Jurídica (Laravel 11 + Bootstrap)

Este pacote adiciona ao seu **Laravel 11** o CRUD completo de **Livros**, **Autores** e **Assuntos**, com:
- Campo **valor (R$)** no livro
- Relacionamento **N:N** livro–autor e livro–assunto
- **Relatório** gerado a partir de uma **VIEW MySQL** agrupando por autor
- **Bootstrap 5** com tema sóbrio jurídico (azul/dourado)
- **Máscara de moeda** (R$) em inputs

> Este ZIP é um **módulo** para ser aplicado sobre um projeto Laravel 11 **já criado via Composer** (inclui controllers, models, migrations, views, rotas, assets e seeds).
> Não inclui a pasta `vendor/`.

## Instalação (Windows/XAMPP + MySQL)
1. Crie o projeto Laravel 11:
```bash
cd C:\xampp\htdocs\Projetos
composer create-project laravel/laravel livraria_juridica
cd livraria_juridica
composer require barryvdh/laravel-dompdf
```
2. Extraia este ZIP **por cima** do projeto (substitua `app/`, `database/`, `resources/`, `routes/`, `public/`).

3. Ajuste `.env` (exemplo):
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=livraria_juridica
DB_USERNAME=root
DB_PASSWORD=
```
Crie o banco `livraria_juridica` no phpMyAdmin.

4. Rode:
```bash
php artisan migrate --seed
php artisan serve
```
5. Acessos rápidos:
- Home: `/`
- Livros: `/livros`
- Autores: `/autores`
- Assuntos: `/assuntos`
- Relatório (VIEW + PDF): `/relatorios/livros-por-autor` e `/relatorios/livros-por-autor/pdf`

## Tabelas
- `autores` (id, nome)
- `assuntos` (id, nome)
- `livros` (id, titulo, ano_publicacao, valor, isbn, created_at, updated_at)
- `autor_livro` (pivot)
- `assunto_livro` (pivot)
- **VIEW**: `vw_livros_por_autor`

## Teste
- Verifique se o relatório agrupa por autor e lista os livros com valor formatado.
- Filtros simples por título/autor/assunto na listagem de livros.
