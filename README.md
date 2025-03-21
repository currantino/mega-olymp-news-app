# Приложение для просмотра новостей для МегаОлимпиады ИТМО
## Инструкция по запуску
1. Установить XCode и симулятор, поддерживающий iOS 18
2. Открыть проект (MegaNews.csproj)
3. Отключить все брейкпоинты кнопкой в нижнем тулбаре
4. Нажать Command+R, чтобы запустить приложение в симуляторе

## Реализованный функционал
1. Экран, отображающий список новостей, который можно скроллить
2. Обновление списка новостей свайпом вниз
3. Экран, отображающий полную информацию о новости. Чтобы открыть экран конкретной новости, нужно тапнуть на нее в списке новостей
4. Загрузка новостей из API https://newsapi.org (API key - hardcoded, чтобы проверяющие могли быстро запустить, не вставляя собственный ключ)

Приложение построено по архитектуре MVVM
