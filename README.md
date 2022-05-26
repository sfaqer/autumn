# Autumn/ОСень

> Что такое осень - это желудь!

Осень…. прекрасная пора. Ею вдохновлялся Пушкин, говорил, что осенью его особенно прёт. Именно это и произошло с авторами фреймворка "ОСень". Потому что осень - это прекрасно.
Когда приложение становится большим, вам потребуется дерево (желательно дуб) и немного пластилина. Ах, да, обязательно творческое осеннее настроение, чай и стабильная психика.

Фреймворк компонентных приложений для 1Script под названием "ОСень" поможет вам невероятным магическим образом компоновать ваше приложение из компонентов, которым не нужно заниматься собственным созданием или настройкой. И все это будет щедро обмазано пластилином и приятно пахнуть дубовыми вениками.

## Зачем мне это?

Вот есть у вас объект, у которого объявлен конструктор с параметрами. И есть много мест, где он создается. Параметры этого конструктора называются *зависимостями*. То есть, объект не может жить без передачи ему этих параметров, он от них *зависит.*
А где взять значения этих параметров, чтобы передать в объект? Очевидно что их тоже надо создать (через `Новый` или откуда-то получить). А у них тоже есть зависимости, и у зависимостей зависимостей есть зависимости.

*Зависимость*. Да, вот слово, которое приходит в голову, когда изучаешь API "ОСени". Зависимость у авторов явно есть. Но это неправда. Мы зависимы только от просмотра ~~зоопорно~~ красивого кода и вообще, не одобряем нехороших веществ, разве что пластилин (не тот) и желуди. Даа, желуди нам определенно нравятся, ведь они овальные и в смешных шапочках.

Но! шутки в сторону. В ваших руках не просто пластилин и желуди, в ваших руках - Dependency Injection Framework для любимого языка программирования. Теперь ваши объекты будут ~~опрятными и шелковистыми~~ создаваться сами, и не нужно будет думать как добыть параметры конструирования, сколько их, в каком порядке они идут. Достаточно сказать: "Хочу класс УгольныйКомбайн" - а марка колес, двигатель и прочие запчасти КАК-ТО создадутся и передадутся в конструктор.

Теперь приложение может состоять из сложных компонентов, которые намного проще менять и перенастраивать. Вот был у вас класс `ОбновляторВерсии1С`. В конструкторе получал логин/пароль пользователя. И все было хорошо, но понадобилось вам в этот класс добавить знание об уже установленных версиях 1С, чтобы не скачивать лишние с сайта. Можно прямо в этом классе написать проверку установленных версий, но это нарушение ПЕО (Принцип Единой Ответственности): проверятор версий не надо смешивать с обновлятором. Мало ли в каких еще местах пригодится проверятор версий, а мы его жестко внутрь другого класса зашьем… Повторное использование - наше все.
Чтобы всё было по красоте, нам надо передать в конструктор объект `ПроверяторВерсий`, который предоставит `Обновлятору1С` информацию о том, что за версии у нас уже установлены. И все бы ничего, но `Обновлятор1С` создается через `Новый` в тысяче мест. В эти места нужно залезть, и дополнительно там создать `ПроверяторВерсий` и передать его в конструктор... А если `Проверятор` тоже имеет зависимость (а кто ее не имеет в наше сложное время, а?), тогда придется протащить всё дерево зависимостей через все методы и компоненты чуть ли не от самого старта приложения. Так жить нельзя, такая жесткая связность будет мешать развитию приложения и усложнять его.
Осенью, когда вам хочется создать `Обновлятор1С`, вы просто говорите ~~"Лунная призма, дай мне силы!"~~ `Осень.ПолучитьЖелудь("Обновлятор1С")` - и все зависимости зависимостей создадутся сами. Сколько у них параметров в конструкторе, как они создаются, кто им передает параметры и где берет - это знает только "ОСень". К чему вдаваться в метафизику… "ОСень" возьмет ваши проблемы на себя, главное - показать ей, где лежит пластилин...

## Как с этим работать?

### Инициализация приложения

"ОСень" - это вам non penis canina est, а фреймворк. Любой порядочный фреймворк нужно немножечко сконфигурировать, чтобы дальше все заработало.

Для инициализации контекста "ОСени" служит класс `КонтекстПриложения`, который необходимо создать через `Новый` (один разочек можно и написать это вредное слово), а затем наполнить Желудями, Дубами и Напильниками. Нет, мы не упоролись, скоро расскажем, что тут к чему.

Инициализировать контекст можно двумя способами.

1) Через сканирование каталога:

   ```bsl
   // file: main.os
   
   #Использовать autumn
   
   КонтекстПриложения = Новый КонтекстПриложения();
   
   КонтекстПриложения.ПросканироватьКаталог(ТекущийКаталог());
   ```

   Сей нехитрый код заставит ОСень просканировать все `*.os` файлы в текущем каталоге (включая подкаталоги), понять, кто из них желудь, а кто дуб, и последовательно их зарегистрировать.

2) Через непосредственную регистрацию:

   ```bsl
   // file: main.os
   
   #Использовать autumn
   
   КонтекстПриложения = Новый КонтекстПриложения();
   
   КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ВерхнеуровневыйЖелудь"));
   КонтекстПриложения.ЗарегистрироватьЖелудь(Тип("ЖелудьНижнегоУровня"));
   
   КонтекстПриложения.ЗарегистрироватьДуб(Тип("ГлавныйДуб"));
   ```

   Не так красиво, как первый вариант, зато гибкости побольше, если вдруг она необходима.

### Объявление компонента

Как вы, наверное, догадались по словосочетанию "компонентное приложение", основой вашего приложения становится `Желудь`. Жёлудь - это всё, и всё есть жёлудь. `ОбновляторВерсии1С`? Жёлудь. `ПроверяторУстановленныхВерсий`? Тоже Жёлудь. И даже логин с паролем - это тоже в некотором роде жёлуди.

Основной способ обозначения класса как желудя - это навешивание аннотации `&Желудь` над конструктором объекта. Вроде такого:

```bsl
// file: Классы/ПроверяторВерсий.os

&Желудь
Процедура ПриСозданииОбъекта()

КонецПроцедуры

... прочая очень нужная, но абсолютно не интересная логика класса.
```

### Получение экземпляра компонента

Мы определили желудь, настало время его создать!

В инстанцировании компонентов нам поможет `КонтекстПриложения`. Зря что ли мы рассказывали ему, где взять желудей?

```bsl
// file: main.os

ПроверяторВерсий = КонтекстПриложения.ПолучитьЖелудь("ПроверяторВерсий");

ПроверяторВерсий.ЧтоНибудьПроверить();
```

В результате выполнения куска кода выше в переменную `ПроверяторВерсий` прилетит свеженький блестящий желудь, зарегистрированный ранее под именем "ПроверяторВерсий". Легко и просто, не правда ли?

### Связывание компонентов между собой

Что нужно двум многоуважаемым Желудям для связи друг с другом? Правильно, пластилин. Каждый ребенок знает, что хорошая поделка - это желуди, пластилин и г... Мы немного отвлеклись.

Для указания зависимостей желудя служит аннотация `&Пластилин`.

```bsl
// file: Классы/ОбновляторВерсий.os

Перем _ПроверяторВерсий;
Перем _Логин;
Перем _Пароль;

&Желудь
Процедура ПриСозданииОбъекта(
	&Пластилин ПроверяторВерсий,
	&Пластилин Логин,
	&Пластилин Пароль
)
	_ПроверяторВерсий = ПроверяторВерсий;
	_Логин = Логин;
	_Пароль = Пароль;
КонецПроцедуры
```

 Как же создать такой сложный желудь, сверху донизу обмазанный пластилином? Точно так же.

```bsl
// file: main.os

ОбновляторВерсий = КонтекстПриложения.ПолучитьЖелудь("ОбновляторВерсий");

ОбновляторВерсий.ОбновисьЧтоБыТамНеСтояло();
```

Заметьте, никаких зависимостей передавать не нужно. "ОСень" все взяла на себя - по именам параметров нашла зарегистрированные желуди и передала их в конструктор объекта.

Если в вас умер пуританин, и вы следите за чистотой имен параметров метода (или наоборот вселился СОТОНА, и параметры именуются случайными буквами греческого алфавита), вы можете подсказать "ОСени", что за зависимость нужна в данном конкретном случае. 

```bsl
&Желудь
Процедура ПриСозданииОбъекта(
	&Пластилин("ПроверяторВерсий") μ,
	&Пластилин(Значение = "Логин") ξ,
	&Пластилин("Пароль") ὦ
)
	_ПроверяторВерсий = μ;
	_Логин = ξ;
	_Пароль = ὦ;
КонецПроцедуры
```

> Имя нужного желудя передается в параметре "Значение" аннотации "&Пластилин". Если аннотация имеет один параметр или вы передаете только значение параметра "Значение", то имя параметра можно опустить. 

### Фабрика компонентов

Не все желуди обязаны являться полноценными классами с точки зрения системы типов 1Script. Согласитесь, странно заводить целый класс для хранения логина от ИТС, просто потому что кто-то пережарил желудей.

Философский вопрос в зал: откуда берутся желуди? Кто-нибудь? Может быть вы, в свитере цвета осенней листвы? Правильно, желуди растут на дубах!

