class ProductsController < ApplicationController
  # GET /users/1/products
  # GET /users/1/products.xml
  def index
    @user = User.find(params[:user_id])
    @products = @user.products

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /users/1/products/1
  # GET /users/1/products/1.xml
  def show
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /users/1/products/new
  # GET /users/1/products/new.xml
  def new
    @user = User.find(params[:user_id])
    @product = @user.products.build # not new, but build is provided automagically by ActiveRecord

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /users/1/products/1/edit
  def edit
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
  end

  # POST /users/1/products
  # POST /users/1/products.xml
  def create
    @user = User.find(params[:user_id])
    @product = @user.products.build(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to([@user, @product], :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/products/1
  # PUT /users/1/products/1.xml
  def update
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to([@user, @product], :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/products/1
  # DELETE /users/1/products/1.xml
  def destroy
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(user_products_url) }
      format.xml  { head :ok }
    end
  end
end
