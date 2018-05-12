class ApprenticesController < ApplicationController
    # Devise авторизация
    # в версии 5.1 before_filter был изменен на before_action
    # если нам нужно определить именно для отдельных методов, то используем
    # before_action :authenticate_user!, except => [:show, :index]
    before_action :authenticate_user!

    # Вывод всех учащихся
    # app/views/apprentice/index.html.erb
    def index
      @apprentices = Apprentice.all
    end
    # app/views/apprentice/show.html.erb
    def show
      @apprentice = Apprentice.find(params[:id])
    end
    # создадим экшен new
    def new
      @apprentice = Apprentice.new
    end
    # Редактирование ученика отправка запроса в def update
    # app/views/apprentice/edit.html.erb
    def edit
      @apprentice = Apprentice.find(params[:id])
    end
    # создадим экшен create
    # app/views/apprentice/new.html.erb
    def create
      # Имена классов с заглавной! Apprentice
      # =>                        выводим в отдельный метод
      @apprentice = Apprentice.new(apprentice_params)

      # передает и сохраняем значения в базу
      if @apprentice.save
        redirect_to @apprentice
      elsif
        render 'new'
      end
    end
    #  Получение обновленных данных из def edit
    #  Не обязательно передавать все атрибуты в update. К примеру, если был вызван
    #  @apprentice.update(personal_number: '25'),
    #  Rails обновит только атрибут personal_number, оставив все другие атрибуты нетронутыми.
    def update
      @apprentice = Apprentice.find(params[:id])

      # Так как метод apprentice_params уже вынесен отдельно, обращаемся к ниму :)
      if @apprentice.update(apprentice_params)
        redirect_to @apprentice
      elsif
        render 'edit'
      end
    end
    # Метод уничтожения записи DELETE
    def destroy
      @apprentice = Apprentice.find(params[:id])
      @apprentice.destroy

      redirect_to apprentices_path
    end

    private
      # ВАЖНО!
      # Передаем только те параметры, что разрешены
      def apprentice_params
        params.require(:apprentice).permit(:personal_number,
                                           :full_name,
                                           :birth_date,
                                           :receipt_date,
                                           :document,
                                           :parents_1,
                                           :parents_2,
                                           :achievements,
                                           :phone,
                                           :events,
                                           :gender,
                                           :status,
                                           :home,
                                           :sociallin_1,
                                           :sociallin_2,
                                           :email,
                                           :valid,
                                           :who_added,
                                           :who_update,
                                           :children_table_version 
                                         )
      end
    # Тест на возврат значений (отклик) nil
    # def create
    #   render plain: params[:apprentice].inspect
    # end

    # devise auth system
    # собственные перенаправления как после входа, так и после выхода
    def after_sign_in_path_for(resource)
      current_user_path
    end
    # После входа пользователь будет перенаправлен на страницу, описанную в хэлпером
    def after_sign_out_path_for(resource_or_scope)
      request.referrer
    end
end
