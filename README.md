# GuessTheNumber

# Задача
Разработать и протестировать приложение для iPhone с
использованием среды разработки Xcode.

# Описание
Приложение для iPhone, представляющее из себя мини игру.
Пользователь загадывает любое целочисленное число (от 1 до 100).
Отгадывающий(компьютер) должен отгадать число, ориентируясь на
подсказки загадывающего.
Загадывающий может отвечать только «больше», «меньше» или
«равно».
Раунд заканчивается когда число было угадано, в процессе ведётся
подсчёт попыток.
После отгадывания игроки меняются местами, и пользователь должен
отгадать загаданное компьютером число.
Побеждает игрок, отгадавший число соперника за наименьше кол-во
ходов.

Приложение должно состоять из нескольких экранов:

• Экран старта игры

• Экран загадывания числа

• Экран отгадывания числа компьютером

• Экран отгадывания числа игроком

• Экран с результатом игры.

<img width="900" alt="example" src="https://raw.githubusercontent.com/semjonG/GuessTheNumber/main/0.png"><br>

Технические требования:

Для реализации интерфейса пользователя необходимо
использовать стандартные элементы UIKit.
Приложение должно поддерживать как горизонтальную так и
вертикальную ориентацию экрана. При автоповороте UI
должен обновляться.

Необходимо использование одного из архитектурных
подходов: MVC, MVP, MVVM, VIPER c обоснование выбора.
Обоснование прикрепить в Readme проекта.

Критерии оценки результатов
тестового задания:

• Отсутствие блокирующих багов

• Завершенность и корректное отображение интерфейса на
всех видах девайса

• Общая архитектура приложения (логическое разделение
приложения на части, модульность, использование
архитектурных подходов)

• Обработка некорректного поведения
пользователя(например, ввод некорректных значений)

• Качество и чистота кода

# Выполнено
- No storyboard (programmatically)
- UIKit
- MVC

<table>
  <tr>
    <td>Start</td>
    <td>Entering number</td>
    <td>Number entered</td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/semjonG/GuessTheNumber/main/1.png"></td>
    <td><img src="https://raw.githubusercontent.com/semjonG/GuessTheNumber/main/2.png"></td>
    <td><img src="https://raw.githubusercontent.com/semjonG/GuessTheNumber/main/2.1.png"></td>
  </tr>
  <tr>
    <td>Computer is guessing</td>
    <td>Human is guessing</td>
    <td>Results</td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/semjonG/GuessTheNumber/main/3.png"></td>
    <td><img src="https://raw.githubusercontent.com/semjonG/GuessTheNumber/main/4.png"></td>
    <td><img src="https://raw.githubusercontent.com/semjonG/GuessTheNumber/main/5.png"></td>
  </tr>
 </table>
