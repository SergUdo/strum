## gem strum

Устанавливаем PostgreSQL и PostGIS.

Устанавливаем гем `gem install strum`

Генерируем каркас проекта `strum new DemoStrum --sequel`

`cd demo_strum`

`bundle`

Готовим шаблоны для работы с Item: `strum g scaffold Item --rest`

Удаляем существующую и создаем новую схему БД: `rake sequel:reset` 

Запускаем сервер: `rackup` 

REST API дотупен на: `lvh.me:9292/items`