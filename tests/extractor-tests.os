﻿#Использовать "../src/core"
#Использовать "../src/cmd"

Перем Лог;                       //    - логгер

// Процедура выполняется после запуска теста
//
Процедура ПередЗапускомТеста() Экспорт
	
	Лог = ПараметрыСистемы.Лог();

КонецПроцедуры // ПередЗапускомТеста()

// Процедура выполняется после запуска теста
//
Процедура ПослеЗапускаТеста() Экспорт

КонецПроцедуры // ПослеЗапускаТеста()

&Тест
Процедура ТестДолжен_ИзвлечьДанныеИзСтрокиJSON() Экспорт

	СтрокаJSON = "[{""Имя"":""Вася"",""Пол"":""Мужской"",""Возраст"":29},{""Имя"":""Люба"",""Пол"":""Женский"",""Возраст"":30}]";

	Результат = ИзвлечениеДанныхJSON.Выбрать(СтрокаJSON, "$..[?(@.Возраст >= 30)].Имя");

	ТестовоеЗначение = "Люба";

	Утверждения.ПроверитьРавенство(Результат, ТестовоеЗначение, "Ошибка выборки данных из JSON"); 

КонецПроцедуры // ТестДолжен_ИзвлечьДанныеИзСтрокиJSON()

&Тест
Процедура ТестДолжен_ИзвлечьДанныеИзФайлаJSON() Экспорт

	ПутьКФайлу = ОбъединитьПути(ТекущийСценарий().Каталог, "fixtures", "data.json");

	Результат = ИзвлечениеДанныхJSON.Выбрать(ПутьКФайлу, "$..[?(@.command == 'database create')].description");

	ТестовоеЗначение = "Создание БД";

	Утверждения.ПроверитьРавенство(Результат, ТестовоеЗначение, "Ошибка выборки данных из JSON"); 

КонецПроцедуры // ТестДолжен_ИзвлечьДанныеИзФайлаJSON()

&Тест
Процедура ТестДолжен_ИзвлечьСтроковоеЗначениеИзJSON() Экспорт

	СтрокаJSON = "[{""Имя"":""Вася"",""Пол"":""Мужской"",""Возраст"":29},{""Имя"":""Люба"",""Пол"":""Женский"",""Возраст"":30}]";

	Результат = ИзвлечениеДанныхJSON.Выбрать(СтрокаJSON, "$..[?(@.Возраст >= 30)].Имя");

	ТестовоеЗначение = "Люба";

	Утверждения.ПроверитьРавенство(Результат, ТестовоеЗначение, "Ошибка выборки данных из JSON"); 

КонецПроцедуры // ТестДолжен_ИзвлечьСтроковоеЗначениеИзJSON()

&Тест
Процедура ТестДолжен_ИзвлечьЦелоеЧислоИзJSON() Экспорт

	СтрокаJSON = "[{""Имя"":""Вася"",""Пол"":""Мужской"",""Возраст"":29.5},{""Имя"":""Люба"",""Пол"":""Женский"",""Возраст"":30}]";

	Результат = ИзвлечениеДанныхJSON.Выбрать(СтрокаJSON, "$..[?(@.Имя == 'Люба')].Возраст");

	ТестовоеЗначение = 30;

	Утверждения.ПроверитьРавенство(Результат, ТестовоеЗначение, "Ошибка выборки данных из JSON"); 

КонецПроцедуры // ТестДолжен_ИзвлечьЦелоеЧислоИзJSON()

&Тест
Процедура ТестДолжен_ИзвлечьПлавающееЧислоИзJSON() Экспорт

	СтрокаJSON = "[{""Имя"":""Вася"",""Пол"":""Мужской"",""Возраст"":29.5},{""Имя"":""Люба"",""Пол"":""Женский"",""Возраст"":30}]";

	Результат = ИзвлечениеДанныхJSON.Выбрать(СтрокаJSON, "$..[?(@.Имя == 'Вася')].Возраст");

	ТестовоеЗначение = 29.5;

	Утверждения.ПроверитьРавенство(Результат, ТестовоеЗначение, "Ошибка выборки данных из JSON"); 

КонецПроцедуры // ТестДолжен_ИзвлечьПлавающееЧислоИзJSON()

&Тест
Процедура ТестДолжен_ИзвлечьJSONИзJSON() Экспорт

	ПутьКФайлу = ОбъединитьПути(ТекущийСценарий().Каталог, "fixtures", "data.json");

	Результат = ИзвлечениеДанныхJSON.Выбрать(ПутьКФайлу, "$..description");

	ТестовоеЗначение = "[
	                   |  ""Создание БД"",
	                   |  ""Восстановление из копии"",
	                   |  ""Сжатие базы"",
	                   |  ""Удаление базы""
	                   |]";

	Результат = СтрЗаменить(Результат, Символы.ВК, "");
	ТестовоеЗначение = СтрЗаменить(ТестовоеЗначение, Символы.ВК, "");

	Утверждения.ПроверитьРавенство(СокрЛП(Результат), ТестовоеЗначение, "Ошибка выборки данных из JSON"); 

КонецПроцедуры // ТестДолжен_ИзвлечьJSONИзJSON()
