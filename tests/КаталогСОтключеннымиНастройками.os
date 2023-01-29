#Использовать ".."
#Использовать asserts
#Использовать "."

&Тест
Процедура НеЗапускатьРогатки() Экспорт

	// Дано
	УстановитьТекущийКаталог(ОбъединитьПути(ТекущийКаталог(), "tests/КаталогНастроекСОтключеннымиРогатками"));
	МокАппендера = Новый МокАппендера();
	Лог = Логирование.ПолучитьЛог("oscript.lib.autumn.ЗапускательПриложения");
	Лог.ДобавитьСпособВывода(МокАппендера, УровниЛога.Информация);

	Поделка = Новый Поделка;
	Поделка
		.ДобавитьДуб(Тип("ГлавныйДуб"))
		.ДобавитьРогатку(Тип("РогаткаПриоритет1"));

	// Когда
	Поделка.ЗапуститьПриложение();
	Сообщения = МокАппендера.Сообщения;
	Массив = Поделка.НайтиЖелудь("Массив");
	
	// Тогда
	Ожидаем.Что(Сообщения.Количество(), "Количество сообщений").Равно(1);
	Ожидаем.Что(Массив.Количество(), "Массив не изменен").Равно(1);
	Ожидаем.Что(Сообщения[0], "Сообщение об ошибке").Содержит("ИНФОРМАЦИЯ - Запуск рогаток отключен.");
	
КонецПроцедуры