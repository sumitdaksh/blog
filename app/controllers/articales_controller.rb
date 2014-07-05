class ArticalesController < ApplicationController
  http_basic_authenticate_with name: "sumit", password: "daksh", except:[:index, :show]

  def index
    @articale =Articale.all
  end
  def new
    @articale = Articale.new

  end
  def create
    @articale = Articale.new(articale_params)

    #@articale.save
    respond_to do |format|
      if @articale.save
        format.html { redirect_to @articale, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @articale }
      else
        format.html { render action: 'new' }
        format.json { render json: @articale.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @articale = Articale.find(params[:id])
    if @articale.update(articale_params)
    redirect_to @articale
    else
      render 'edit'
    end
  end
  def edit
    @articale =Articale.find(params[:id])
  end

  def show
    @articale = Articale.find(params[:id])
  end

  def destroy
    @articale =Articale.find(params[:id])
    @articale.destroy
    redirect_to articales_path
  end

  private
  def articale_params
    params.require(:articale).permit(:title, :text)
  end


end
