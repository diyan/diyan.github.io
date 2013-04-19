title: O себе

<b>Официальная версия</b>

- Старший .NET/Python разработчик в компании <a href="http://www.dev-pro.net/">Dev-Pro.net</a>
- Увлеченный программист, автоматизатор, вечно занятый поиском удобных инструментов и серебряной пули
- Промышляю архитектурами приложений и сопровождением высоконагруженных систем

<b>Неофициальная версия</b>

- ZX Basic -> C -> Assembler -> C++ -> C# -> Python / JavaScript
- Надоел .NET / Microsoft
- Никогда не любил JavaScript, но похоже что придется
- Фанатею от Python. Python спасет мир! =)
- Немного dba, qa, team lead, devs mentor, sysadmin

---
title: План доклада

- По-быстрому сделать обзор БД миграторов в .NET стеке
- <strike>&nbsp;Ненавязчиво&nbsp;</strike> продать RoundhousE аудитории
- Ответить на вопросы
- Попить чайку c печеньками на coffee break
- Послушать второй доклад

---
title: Ну очень краткий обзор миграторов

- <a href="https://github.com/HeadspringLabs/Tarantino">Tarantino</a>, MIT license, 2012-12, SQL-based
- <a href="https://github.com/jpoehls/dotnetmigrations/">DotNetMigrations</a>, BSD, 2011-08, SQL
- <a href="http://dbdeploy.com/">DBDeploy.NET</a>, LGPL, 2007-09, SQL
- <a href="http://www.tewari.info/dbupdater/">DbUpdater</a>, GPL, 2009-01, SQL
- <a href="https://code.google.com/p/migratordotnet/">Migrator.NET</a>, MPL, 2009-02, .NET DSL
- <a href="https://code.google.com/p/ecm7migrator/">ECM7.Migrator</a>, MIT, 2012-10, .NET DSL (Migrator.NET fork)
- <a href="http://dbrefactor.csharpus.com/">DbRefactor</a>, MPL, 2009-07, .NET DSL (Migrator.NET fork)
- <a href="https://github.com/schambers/fluentmigrator/">FluentMigrator</a>, Apache, .NET DSL
- <a href="http://guides.rubyonrails.org/migrations.html">Active Record Migrations</a>, MIT, 2013-03, Ruby DSL (часть RoR)
- <a href="https://code.google.com/p/octalforty-wizardby/">octalforty Wizardby</a>, MIT, 2011-04, text-based DSL
- <a href="http://www.liquibase.org/">LiquiBase</a>, Apache, 2012-05, <s>&nbsp;enterprised&nbsp;</s> XML-based DSL
- <a href="http://www.red-gate.com/products/sql-development/sql-source-control/">RedGate SQL Source Control</a>, Commercial, SQL diff tool на стероидах (часть SQL Developer Bundle)


---
title: RoundhousE 
subtitle: Инструмент для версионирования схемы базы данных

- <b>Name</b>: RoundhousE
- <b>Email</b>: <a href="mailto:chucknorrisframework@googlegroups.com">chucknorrisframework@googlegroups.com</a>
- <b>Location</b>: Чак Норрис, он везде
- <b>Project</b>: <a href="https://github.com/chucknorris/roundhouse">https://github.com/chucknorris/roundhouse</a>
- <b>Docs</b>: <a href="https://github.com/chucknorris/roundhouse/wiki">https://github.com/chucknorris/roundhouse/wiki</a>
- <b>Mailing list</b>: <a href="http://groups.google.com/group/chucknorrisframework">http://groups.google.com/group/chucknorrisframework</a>

---
title: Основные возможности RoundhousE

- Поддерживает Microsoft SQL Server 2000/2005/2008, Oracle 9i/10g/11g, MS Access, SQLite
- Поддержку MySQL внес я 2 года назад
- Поддержку PostgreSQL внес Siim Viikman 1 год назад
- Используется старый добрый SQL
- Может работать на legacy базах данных
- Рализована на .NET, использует NHibernate (могу портировать на другую СУБД/ОС за шоколадку)
- Open source, лицензирована под Apache 2.0
- Not a one-person-project

---
title: Уникальные возможности RoundhousE

- <b>Освобождает от оформления патчей/миграций для stateless скриптов</b>
- Все скрипты разделяет на OneTime, AnyTime, Everytime
- Поддерживает скрипты, которые зависят от окружения
- Крайне рекомендована проектам с большим количеством процедур, функций и представлений
- Нет одного каталога со свалкой миграций. Все разложено по полочкам — baseline, up, functions, procedures, functions...
- Подробное логирование процесса миграции БД
- Подробная регистрация успешных и неудачных миграций
- Более дружественна к DBA чем другие SQL-based миграторы

---
title: Недостатки RoundhousE

- Forward-only миграции. Есть "up" миграции, но нет "down"
- Не умеет мигрировать до указанной версии (только до победного конца)
- Нет графического интерфейса (только консоль, только хардкор)
- Поддержка нескольких СУБД в проекте делается "вручную"
- Работает только под Windows (из-за .NET реализации)

---
title: Процесс миграции схемы БД в RoundhousE
subtitle: Информационная стадия

Во время запуска RoundhousE проходит через несколько стадий. Давайте разберемся что происходит во время этих стадий глядя на log-файл.

<pre data-lang="log">
Running RoundhousE v0.8.0.5 against <b>(local)</b> - <b>TestRoundhousE</b>.
Looking in C:\code\roundhouse\code_drop\sample\deployment\..&crarr;
..\db\SQLServer\TestRoundhousE for scripts to run.
Please press enter when ready to kick...
</pre>

NOTE: Совсем не обязательно чтобы база данных TestRoundhousE существовала на MS SQL Server на (local) хосте. Roundhouse создаст ее автоматически.

---
title: Создание схемы БД для миграций

<pre data-lang="log">
==================================================
Setup, Backup, Create/Restore/Drop
==================================================
Creating TestRoundhousE database on (local) server &crarr;
if it doesn't exist.
==================================================
RoundhousE Structure
==================================================
 Running database type specific tasks.
 Creating RoundhousE schema if it doesn't exist.
 Creating <b>[Version]</b> table if it doesn't exist.
 Creating <b>[ScriptsRun]</b> table if it doesn't exist.
 Creating <b>[ScriptsRunErrors]</b> table if it doesn't exist.
</pre>

---
title: Структура таблиц RoundhousE

<h3>RoundhousE Version table:</h3>

- repository_path (ssh://git@github.com/diyan/pywinrm)
- version (0.8.0.5)
- entry_date, modified_date (of file)
- entered_by (devpro\alexey.diyan)

<h3>RoundhousE ScriptsRun / ScriptsRunErrors tables:</h3>

- version_id (FK to version.id)
- script_name (file name), text_of_script, text_hash
- one_time_script (boolean)
- erroneous_part_of_script
- error_messge

---
title: Начало версионирования схемы БД

<pre data-lang="log">
==================================================
Versioning
==================================================
 Attempting to resolve version from C:\code\roundhouse\code_drop&crarr;
 \sample\deployment\<b>_BuildInfo.xml</b> using <b>//buildInfo/version</b>.
 Found version 0.8.0.305 from C:\code\roundhouse\code_drop\sample&crarr;
 \deployment\_BuildInfo.xml.
 Migrating TestRoundhousE <b>from version 0 to 0.8.0.305</b>.
 Versioning TestRoundhousE database with version 0.8.0.305 based on&crarr;
 http://roundhouse.googlecode.com/svn.
</pre>

Номер версии можно хранить так же и в сборке самого приложения

<pre data-lang="log">
 Attempting to resolve <b>assembly file version</b> from C:\code&crarr;
 \roundhouse\code_drop\RoundhousE\lib\<b>roundhouse.dll</b>. 
</pre>

---
title: Выполнение необратимых "up" скриптов

<pre data-lang="log">
Looking for Update scripts in "...\TestRoundhousE\up".
These should be <b>one time only scripts.</b>
    Running 0001_CreateTables.sql on (local) - TestRoundhousE.
    Running 0002_ChangeTable.sql on (local) - TestRoundhousE.
</pre>

- Все "up" скрипты выполняются один и только один раз, поскольку их изменения необратимы
- Обратимые скрипты выполняются когда в них произошли изменения с момента последней миграции
- RoundhousE присматривает за разработчиками, которые любят менять содержимое необратимых скриптов

---
title: Выполнение обратимых скриптов...

<pre data-lang="log">
Looking for <b>Run First After Update scripts</b> in "...&crarr;
\TestRoundhousE\runFirstAfterUp".
--------------------------------------------------
Looking for <b>Function scripts</b> in "...\TestRoundhousE\functions".
 	Running ufn_GetDate.sql on (local) - TestRoundhousE.
--------------------------------------------------
Looking for <b>View scripts</b> in "...\TestRoundhousE\views".
 	Running vw_Dude.sql on (local) - TestRoundhousE.
--------------------------------------------------
Looking for <b>Stored Procedure scripts</b> in "...\TestRoundhousE\sprocs".
 	Running usp_GetDate.sql on (local) - TestRoundhousE.
 	Running usp_SelectTimmy.sql on (local) - TestRoundhousE.
</pre>

Каталог runFirstAfterUp\ содержит скрипты со структурами, от которых зависят functions/views/sprocs.

---
title: ...выполнение обратимых скриптов

<pre data-lang="log">
Looking for <b>Permission scripts</b> in "...\TestRoundhousE\permissions".&crarr;
These scripts <b>will run every time</b>.
	Running 0001_AppRoles.sql on (local) - TestRoundhousE.
	Running 0002_AppPermissions.sql on (local) - TestRoundhousE.
	LOCAL.GrantRobReadWritePermissions.ENV.sql is an environment file.
<b>We are in the LOCAL environment. This will run based on &crarr;
this check.</b>
	Running LOCAL.GrantRobReadWritePermissions.ENV.sql on (local) - &crarr;
TestRoundhousE.
	TEST.GrantRobReadWritePermissions.ENV.sql is an environment file.
<b>We are in the LOCAL environment. This will NOT run based on &crarr;
this check.</b>
	Skipped TEST.GrantJohnReadWritePermissions.ENV.sql - &crarr;
	<b>No changes were found to run.</b>
</pre>

---
title: Отчет после выполнения миграции

<pre data-lang="log">
RoundhousE v0.8.0.305 has kicked your database (TestRoundhousE)! &crarr;
You are now at version 0.8.0.305.&crarr;
<b>All changes and backups can be found</b> at &crarr;
"...\TestRoundhousE\(local)\20110607_215437_2015".
</pre>