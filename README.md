# Módulo Livraria Jurídica (Laravel 11 + Bootstrap)


## Instalação
1. Crie o projeto Laravel:
```bash
cd C:\xampp\htdocs\Projetos
composer create-project laravel/laravel livraria_juridica
cd livraria_juridica
composer require barryvdh/laravel-dompdf
```
2. Clone o projeto localmente em:

3. Ajuste a conexão do BD no arquivo `.env`:
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=livraria_juridica
DB_USERNAME=root
DB_PASSWORD=
```
Crie o banco `livraria_juridica`.

4. Rodar os comandos:
```bash
php artisan migrate --seed (migrations)
php artisan serve
```
5. Acessos rápidos:
- Home: `/`
- Livros: `/livros`
- Autores: `/autores`
- Assuntos: `/assuntos`
- Relatório (PDF): `/relatorios/livros-por-autor` e `/relatorios/livros-por-autor/pdf`


