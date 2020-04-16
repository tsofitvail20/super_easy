require 'cloudinary'
require '././config/cloudinary_config'
require 'json'

class ArchivesController < ApplicationController
  def index
    @archives=Archive.all.order('name ASC')
      #render plain: @archives.inspect
  end

  def create
    @items=Item.all.order('name ASC')
    err=write_params
    if err>0
      render 'error'
    else
      redirect_to purchase_archives_path
    end

  end

  def write_params
    i=0
    error=0
    @items.each do |item|
      if params[:price][i]!=''
        @archive=Archive.new
        @archive[:name]=item.name
        @archive[:price]=params[:price][i]
        @archive[:brand]=params[:brand][i]
        @archive[:purchase_date]=params[:purchase_date]
        @archive[:place]=params[:place]
        if(params[:image].blank? || params[:image][item.name].blank?)
          image_url='https://res.cloudinary.com/tsofit/image/upload/v1587029587/samples/new/no-image_czq7kx.jpg'
          @archive[:image]=image_url
        else
          image_url=upload_image(params[:image][item.name])
          @archive[:image]=image_url
        end
        if @archive.save
          item.destroy
        else
          error=1
        end
      end
      i+=1
    end
    return error
  end

  def upload_image(image_data)
    File.open(Rails.root.join('public', 'uploads', image_data.original_filename), 'wb') do |file|
      file.write(image_data.read)
    end
    path="public/uploads/#{image_data.original_filename}"
    image_name=File.basename(path, File.extname(path))
    response_body=Cloudinary::Uploader.upload(path,:folder =>"samples/new", :public_id => image_name)
    return response_body["url"]
  end

  def purchase
    @items=Item.all.order('name ASC')

  end

  def destroy
    @archive=Archive.find(params[:id])
    @archive.destroy
    redirect_to archives_path
  end
end
