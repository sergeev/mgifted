class Apprentice < ApplicationRecord
  # Проверка на правильность заполнения
  validates :full_name, presence: true, length: { minimum: 5 }

  # Подключение поиска по базе данных PostgreSQL
  include PgSearch
  pg_search_scope :search_everywhere, against: [:personal_number, :full_name, :home]
end
