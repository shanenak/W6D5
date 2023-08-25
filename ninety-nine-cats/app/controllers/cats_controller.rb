class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end
    
    def create
        @c = Cat.new(cat_params)
        if c.save
            redirect_to cat_url(@c)
        else
            render json: c.errors.full_messages, status: 422
            # render :new
        end
    end

    def new
        render :new
    end

    def edit
        @c = Cat.find_by(id: params[:id])
        render :edit
    end

    def show
        @c = Cat.find_by(id: params[:id])
        render :show
    end

    def update
        @c = Cat.find_by(id: params[:id])
        if @c.update(cat_params)
            redirect_to cat_url(@c)
        else
            render json: @c.errors.full_messages, status: 422
            # render :edit
        end
        # render :new
    end

    private
    def cat_params
        params.require(:cat).permit(:date, :color, :name, :sex, :description)
    end
end