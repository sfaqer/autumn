Перем _ЖелудьНижнегоУровня;

&Пластилин("ЖелудьНижнегоУровня")
Перем ВнедряемыйЖелудьНижнегоУровня Экспорт;

Перем ВнедряемыйЖелудьНижнегоУровняЧерезСеттер;

Перем ВнедряемыйЖелудьНижнегоУровняЧерезСеттерСоСтраннымИменем;

Функция ЖелудьНижнегоУровня() Экспорт
	Возврат _ЖелудьНижнегоУровня;
КонецФункции

Функция	ВнедряемыйЖелудьНижнегоУровня() Экспорт
	Возврат ВнедряемыйЖелудьНижнегоУровня;
КонецФункции

Функция	ВнедряемыйЖелудьНижнегоУровняЧерезСеттер() Экспорт
	Возврат ВнедряемыйЖелудьНижнегоУровняЧерезСеттер;
КонецФункции

Функция	ВнедряемыйЖелудьНижнегоУровняЧерезСеттерСоСтраннымИменем() Экспорт
	Возврат ВнедряемыйЖелудьНижнегоУровняЧерезСеттерСоСтраннымИменем;
КонецФункции

&Пластилин
Процедура УстановитьЖелудьНижнегоУровня(Значение) Экспорт
	ВнедряемыйЖелудьНижнегоУровняЧерезСеттер = Значение;
КонецПроцедуры

&Пластилин("ЖелудьНижнегоУровня")
Процедура УстановитьЖелудьНижнегоУровняСоСтраннымИменемСеттера(Значение) Экспорт
	ВнедряемыйЖелудьНижнегоУровняЧерезСеттерСоСтраннымИменем = Значение;
КонецПроцедуры

&Желудь
Процедура ПриСозданииОбъекта(
	&Пластилин ЖелудьНижнегоУровня
)
	_ЖелудьНижнегоУровня = ЖелудьНижнегоУровня;
КонецПроцедуры