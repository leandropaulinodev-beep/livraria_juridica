# Módulo Livraria Jurídica (Laravel 11 + Bootstrap)

Este teste utiliza **Laravel 11** com CRUD completo de **Livros**, **Autores** e **Assuntos**, com:
- Campo **valor (R$)** no livro
- Relacionamento **N:N** livro–autor e livro–assunto
- **Relatório** gerado a partir de uma **VIEW MySQL** agrupando por autor
- **Bootstrap 5** com tema sóbrio jurídico (azul/dourado)
- **Máscara de moeda** (R$) em inputs

## Instalação 
1. Crie o projeto Laravel 11:
```bash
cd C:\xampp\htdocs\Projetos
composer create-project laravel/laravel livraria_juridica
cd livraria_juridica
composer require barryvdh/laravel-dompdf
``

3. Ajuste `.env` (exemplo):
```
DB_CONNECTION=mysql
DB_HOST=
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
- Relatório (DOMPDF): `/relatorios/livros-por-autor` e `/relatorios/livros-por-autor/pdf`



