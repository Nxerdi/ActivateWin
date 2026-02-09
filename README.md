RU
# ActivateWin

⚠️ **Внимание:** данный проект предназначен **исключительно для ознакомительных и образовательных целей**.  
Автор не несёт ответственности за использование скрипта третьими лицами.

---

## 📌 Описание

`activate 2.0.bat` — это batch-скрипт для Windows, который:

- выполняет активацию Windows;
- автоматически применяет системные настройки Windows;
- отключает/настраивает ряд стандартных функций ОС;
- приводит систему в заранее подготовленное состояние без ручной рутины.

Скрипт создавался как **универсальный инструмент первичной настройки Windows после установки**.

---

## ⚙️ Что делает скрипт

В общих чертах скрипт:

- проверяет права администратора;
- активирует Windows;
- применяет оптимизационные настройки системы;
- изменяет параметры служб и системных компонентов;
- автоматизирует действия, которые обычно выполняются вручную через:
  - параметры Windows,
  - редактор реестра,
  - оснастки управления.

> Конкретный список настроек можно посмотреть непосредственно в коде `.bat`-файла.

---

## ▶️ Использование

1. Скопируйте файл `activate 2.0.bat` на компьютер с Windows  
2. Нажмите **ПКМ → Запуск от имени администратора**
3. Дождитесь завершения работы скрипта
4. При необходимости перезагрузите систему

---

## ❗ Требования

- Windows 10 / Windows 11  
- Права администратора  
- Отключённые ограничения на запуск batch-скриптов (если применимо)

---

## 📎 Примечания

- Антивирусы и Windows Defender **могут реагировать** на подобные скрипты — это ожидаемое поведение.
- Рекомендуется использовать:
  - на тестовых системах;
  - или на личных компьютерах, где вы понимаете последствия вносимых изменений.

---

## 📄 Лицензия

Проект распространяется **без гарантий**.  
Использование — на ваш страх и риск.
Весь код открыт, просмотреть можно "ПКМ по файлу, далее Изменить в блокноте"

---
ENG
# ActivateWin

⚠️ **Disclaimer:** This project is provided **for educational and informational purposes only**.  
The author takes no responsibility for how this script is used by third parties.

---

## 📌 Description

`activate 2.0.bat` is a Windows batch script that:

- activates Windows;
- automatically applies system configuration settings;
- disables or adjusts selected default Windows features;
- prepares the system into a predefined, ready-to-use state without manual setup.

The script was created as a **universal post-installation Windows setup tool**.

---

## ⚙️ What the script does

In general, the script:

- checks for administrator privileges;
- performs Windows activation;
- applies system optimization settings;
- modifies services and system components;
- automates tasks that are usually done manually via:
  - Windows Settings,
  - Registry Editor,
  - system management tools.

> A detailed list of actions can be reviewed directly in the `.bat` file.

---

## ▶️ Usage

1. Copy `activate 2.0.bat` to a Windows machine  
2. Right-click → **Run as administrator**
3. Wait for the script to complete
4. Reboot the system if required

---

## ❗ Requirements

- Windows 10 / Windows 11  
- Administrator privileges  
- Batch script execution must not be restricted

---

## 📎 Notes

- Antivirus software and Windows Defender **may flag this script** — this is expected behavior.
- Recommended usage:
  - on test environments;
  - or on personal systems where you understand the impact of the applied changes.

---

## 📄 License

This project is provided **as-is**, without any warranties.  
Use at your own risk.
