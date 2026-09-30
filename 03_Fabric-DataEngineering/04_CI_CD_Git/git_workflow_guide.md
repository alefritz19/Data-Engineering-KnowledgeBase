# Руководство по Git и CI/CD в Microsoft Fabric

## 1. Концепция Git Integration
Microsoft Fabric синхронизирует элементы рабочего пространства (Workspaces) напрямую с ветками в **GitHub** или **Azure DevOps**:
* Ноутбуки сериализуются в `.py` / `.ipynb`.
* Пайплайны сериализуются в `pipeline-content.json`.
* Семантические модели — в `model.bim` / PBIR.
* Озера и склады — в описания метаданных.

## 2. Стандартная схема сред (Environments)
```
[ Feature Branch ] ──► Pull Request ──► [ Main / Dev Workspace ]
                                                 │
                                                 ▼ (Deployment Pipeline)
                                        [ Test / Staging Workspace ]
                                                 │
                                                 ▼ (Approval & Gate)
                                        [ Production Workspace ]
```

## 3. Базовые команды Git для локального репозитория
```bash
# Инициализация репозитория
git init

# Добавление всех файлов
git add .

# Фиксация изменений
git commit -m "feat: initial commit of data engineering repository"

# Привязка к удаленному репозиторию на GitHub
git remote add origin https://github.com/alexfritzler/Data-Engineering-KnowledgeBase.git
git branch -M main
git push -u origin main
```
