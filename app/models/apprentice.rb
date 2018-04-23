class Apprentice < ApplicationRecord
  # Проверка на правильность заполнения
  validates :full_name, presence: true, length: { minimum: 5 }
end
