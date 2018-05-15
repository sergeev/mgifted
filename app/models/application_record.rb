class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # Подключение поиска по базе данных PostgreSQL
end
