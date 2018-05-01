class CreateApprentices < ActiveRecord::Migration[5.1]
  # rake db:migrate RAILS_ENV=development
  # комбинации на управление миграцией
  # rake db:create
  # rake db:migrate
  # удаление старой таблицы и добавление новой
  # rake db:migrate:redo VERSION=20180419201432
  def change
    create_table :apprentices do |t|

      t.string :personal_number         # Персональный номер
      t.string :full_name               # Имя Фамилия Отчество
      t.date   :birth_date              # Дата рождения
      t.date   :receipt_date            # Дата поступления (зачисления)
      t.string :document                # номер документа паспорт и т.д (форма выбора)
      t.string :parents_1               # Родители: Мать или бабушка
      t.string :parents_2               # Родители: Отец или дедушка
      t.string :achievements            # Личные достижения учащегося
      t.string :phone                   # Телефон
      t.string :events                  # Мероприятия по годам (дублирует achievements)
      t.string :gender                  # Пол: М\Ж
      t.string :status                  # Статус ребенка в организации: 0 - нет статуса 1 - резидент
      t.string :home                    # Прикреплен за организацией: 0 - нет 1 - школа 2 - училище 3 - вуз 4-0 - ЕВРАЗ 4-1 Русал
      t.string :sociallin_1             # Ссылка на социальные сети ребенка
      t.string :sociallin_2             # Ссылка на социальные сети ребенка
      t.string :email                   # Ссылка на электроную почту
      t.string :valid                   # Разрешен доступ на размещение 0 - нет 1 - да
      t.string :who_added               # Кто добавил в базу ребенка (пользователь)
      t.string :who_update              # Кто последний обновил данные (пользователь)
      t.string :children_table_version  # Версия таблицы (nil)

      t.timestamps                      # Серверный метод обновления данных
    end
  end
end
