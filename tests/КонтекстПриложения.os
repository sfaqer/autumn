
#Использовать ".."
#Использовать asserts
#Использовать "."
#Использовать "./ОдноименныеЖелуди"

&Тест
Процедура ИмяЖелудяАвтоматическиОпределяетсяИзТипа() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	
	// Когда
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ВерхнеУровневыйЖелудь"));

	// Тогда
	ОпределениеЖелудя = КонтекстПриложения.ПолучитьОпределениеЖелудя("ВерхнеУровневыйЖелудь");
	
	Ожидаем.Что(ОпределениеЖелудя.ТипЖелудя()).Равно(Тип("ВерхнеУровневыйЖелудь"));
	Ожидаем.Что(ОпределениеЖелудя.Имя()).Равно("ВерхнеУровневыйЖелудь");

КонецПроцедуры

&Тест
Процедура СоздаетсяПростойЖелудь() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ЖелудьНижнегоУровня"));
	
	// Когда
	Желудь = КонтекстПриложения.ПолучитьЖелудь("ЖелудьНижнегоУровня");

	// Тогда
	Ожидаем.Что(Желудь).Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура СоздаетсяЖелудьСЗависимостью() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ВерхнеУровневыйЖелудь"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ЖелудьНижнегоУровня"));
	
	// Когда
	Желудь = КонтекстПриложения.ПолучитьЖелудь("ВерхнеУровневыйЖелудь");

	// Тогда
	Ожидаем.Что(Желудь).Не_().Равно(Неопределено);

	Ожидаем.Что(Желудь.ЖелудьНижнегоУровня()).Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура ЖелудиИнициализируютсяКакСинглтоны() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ВерхнеУровневыйЖелудь"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ЖелудьНижнегоУровня"));
	
	// Когда
	ВерхнеУровневыйЖелудь = КонтекстПриложения.ПолучитьЖелудь("ВерхнеУровневыйЖелудь");
	ЖелудьНижнегоУровня = КонтекстПриложения.ПолучитьЖелудь("ЖелудьНижнегоУровня");

	// Тогда
	Ожидаем.Что(ВерхнеУровневыйЖелудь.ЖелудьНижнегоУровня()).Равно(ЖелудьНижнегоУровня);
КонецПроцедуры

&Тест
Процедура ДубСоздаетПростойЖелудь() Экспорт

	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьДуб(Тип("ГлавныйДуб"));

	// Когда
	Структура = КонтекстПриложения.ПолучитьЖелудь("Структура");

	// Тогда
	Ожидаем.Что(Структура).Не_().Равно(Неопределено);
	Ожидаем.Что(Структура.Ключ).Равно(0);

КонецПроцедуры

&Тест
Процедура ДубСоздаетСложныйЖелудь() Экспорт

	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьДуб(Тип("ГлавныйДуб"));

	// Когда
	Массив = КонтекстПриложения.ПолучитьЖелудь("Массив");

	// Тогда
	Ожидаем.Что(Массив).Не_().Равно(Неопределено);
	Ожидаем.Что(Массив[0].Ключ).Равно(0);

	// Когда
	Структура = КонтекстПриложения.ПолучитьЖелудь("Структура");
	Структура.Ключ = 1;

	// Тогда
	Ожидаем.Что(Массив[0].Ключ).Равно(1);

КонецПроцедуры

&Тест
Процедура ПластилинВнедряетсяВПоляЖелудя() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ВерхнеУровневыйЖелудь"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ЖелудьНижнегоУровня"));
	
	// Когда
	ВерхнеУровневыйЖелудь = КонтекстПриложения.ПолучитьЖелудь("ВерхнеУровневыйЖелудь");

	// Тогда
	Ожидаем.Что(
		ВерхнеУровневыйЖелудь.ВнедряемыйЖелудьНижнегоУровня(),
		"Желудь внедрился в поле"
	).Не_().Равно(Неопределено);

	Ожидаем.Что(
		ВерхнеУровневыйЖелудь.ВнедряемыйЖелудьНижнегоУровняЧерезСеттер(),
		"Желудь внедрился через сеттер"
	).Не_().Равно(Неопределено);

	Ожидаем.Что(
		ВерхнеУровневыйЖелудь.ВнедряемыйЖелудьНижнегоУровняЧерезСеттерСоСтраннымИменем(),
		"Желудь внедрился через сеттер со странным именем"
	).Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура ПостКонстрактОтрабатывает() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ВерхнеУровневыйЖелудь"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ЖелудьНижнегоУровня"));
	
	// Когда
	ВерхнеУровневыйЖелудь = КонтекстПриложения.ПолучитьЖелудь("ВерхнеУровневыйЖелудь");

	// Тогда
	Ожидаем.Что(ВерхнеУровневыйЖелудь.ПеременнаяВИнит(), "Переменная в инит проинициализировалась").Равно(1);
КонецПроцедуры

&Тест
Процедура СканированиеКаталогаРегистрируетНужныеЖелуди() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();

	// Когда
	Каталог = ОбъединитьПути(ТекущийКаталог(), "tests", "Классы");
	КонтекстПриложения.ПросканироватьКаталог(Каталог);

	Желудь = КонтекстПриложения.ПолучитьЖелудь("ВерхнеУровневыйЖелудь");

	// Тогда
	Ожидаем.Что(Желудь).Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура КомпанейскиеЖелудиРеИнициализируются() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("КомпанейскийЖелудь"));
	
	// Когда
	Желудь1 = КонтекстПриложения.ПолучитьЖелудь("КомпанейскийЖелудь");
	Желудь2 = КонтекстПриложения.ПолучитьЖелудь("КомпанейскийЖелудь");

	// Тогда
	Ожидаем.Что(Желудь1, "Разные инстансы желудей").Не_().Равно(Желудь2);
КонецПроцедуры

&Тест
Процедура ЖелудьРегистрируетсяПодИменемИзАннотации() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь1"));

	// Когда
	Желудь = КонтекстПриложения.ПолучитьЖелудь("ТестовыйЖелудь");
	
	// Тогда
	Ожидаем.Что(Желудь, "Не удалось получить желудь по имени из аннотации").Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура ДваЖелудяСОднимИменемКонфликтуют() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь1"));

	// Когда-Тогда
	ПараметрыМетода = Новый Массив();
	ПараметрыМетода.Добавить(Тип("Желудь2"));
	Ожидаем
		.Что(КонтекстПриложения)
		.Метод("ЗарегистрироватьЖелудь", ПараметрыМетода)
		.ВыбрасываетИсключение("Определение желудя с именем ""ТестовыйЖелудь"" уже существует")
	;
	
КонецПроцедуры

&Тест
Процедура ЖелудьМожноПолучитьПоПрозвищу() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь1"));

	// Когда
	Желудь = КонтекстПриложения.ПолучитьЖелудь("Кругляш");
	
	// Тогда
	Ожидаем.Что(Желудь, "Не удалось получить желудь по прозвищу").Не_().Равно(Неопределено);
	
КонецПроцедуры

&Тест
Процедура МассивЖелудейМожноВнедритьЧерезПластилин() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ВерхнеУровневыйЖелудь"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ЖелудьНижнегоУровня"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь1"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь3"));

	// Когда
	Желудь = КонтекстПриложения.ПолучитьЖелудь("ВерхнеУровневыйЖелудь");
	Желуди = Желудь.ВнедряемыеЖелудиПоПрозвищу;

	// Тогда
	Ожидаем
		.Что(Желуди, "Не удалось внедрить желуди по прозвищу")
		.ИмеетТип("ФиксированныйМассив")
		.ИмеетДлину(2);
	
	Ожидаем
		.Что(Желуди.Найти(КонтекстПриложения.ПолучитьЖелудь("ТестовыйЖелудь")), "Не удалось найти тестовый желудь")
		.Не_().Равно(Неопределено);
	Ожидаем
		.Что(Желуди.Найти(КонтекстПриложения.ПолучитьЖелудь("Желудь3")), "Не удалось найти Желудь3")
		.Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура ДваЖелудяСОднимПрозвищемНельзяПолучитьКакОдинЖелудь() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь1"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь3"));

	// Когда-Тогда
	ПараметрыМетода = Новый Массив();
	ПараметрыМетода.Добавить("Кругляш");
	Ожидаем
		.Что(КонтекстПриложения)
		.Метод("ПолучитьЖелудь", ПараметрыМетода)
		.ВыбрасываетИсключение("Найдено несколько желудей с именем/прозвищем ""Кругляш""")
	;
	
КонецПроцедуры

&Тест
Процедура ДваЖелудяСОднимПрозвищемМожноПолучитьКакМассив() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь1"));
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("Желудь3"));

	// Когда
	Желуди = КонтекстПриложения.ПолучитьЖелуди("Кругляш");

	// Тогда
	Ожидаем
		.Что(Желуди, "Не удалось получить список желудей по прозвищу")
		.ИмеетДлину(2)
	;

	Ожидаем
		.Что(Желуди.Найти(КонтекстПриложения.ПолучитьЖелудь("ТестовыйЖелудь")), "Не удалось найти тестовый желудь")
		.Не_().Равно(Неопределено);
	Ожидаем
		.Что(Желуди.Найти(КонтекстПриложения.ПолучитьЖелудь("Желудь3")), "Не удалось найти Желудь3")
		.Не_().Равно(Неопределено);
	
КонецПроцедуры

&Тест
Процедура ЖелудьНаполняетсяНастройками() Экспорт
	// Дано
	КонтекстПриложения = Новый КонтекстПриложения();
	КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ЖелудьСНастройками"));

	// Когда
	Желудь = КонтекстПриложения.ПолучитьЖелудь("ЖелудьСНастройками");
	
	// Тогда
	Ожидаем.Что(Желудь.ПростаяНастройка, "Простая настройка не прочиталась").Равно("Значение простой настройки");
	Ожидаем.Что(Желудь.ХитраяНастройка, "Хитрая настройка не прочиталась").Равно("Значение очень хитрой настройки");
	Ожидаем.Что(Желудь.ЧисловаяНастройка, "В настройку не подставилось значение по умолчанию").Равно(123);
	
КонецПроцедуры

ЖелудьНаполняетсяНастройками();