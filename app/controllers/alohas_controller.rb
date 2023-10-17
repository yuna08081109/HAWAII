class AlohasController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
      def new
        @aloha = Aloha.new
      end
    
      def create
        aloha = Aloha.new(aloha_params)
        aloha.user_id = current_user.id

        if aloha.save
          p params[:aloha][:images]
          params[:aloha][:images]&.each do |image|
              p image
              Image.create!(image: image, aloha_id: aloha.id)
          end

          if aloha.category == 'グルメ'
            redirect_url = '/alohas/food'
          elsif aloha.category == 'スポット'
            redirect_url = '/alohas/spot'
          elsif aloha.category =='お土産'
            redirect_url = '/alohas/omiyage'
          else
            redirect_url = '/alohas/leisure'
          end

        else
          redirect_url = '/alohas/new'

        end
        redirect_to redirect_url
 end
        

      def show
        @aloha = Aloha.find(params[:id])
        @comments = @aloha.comments
        @comment = Comment.new
        @rank = @aloha.comments.average(:star)
      end

      def edit
        @aloha = Aloha.find(params[:id])
      end

      def update
        aloha = Aloha.find(params[:id])
        if aloha.update(aloha_params)
          redirect_to :action => "show", :id => aloha.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        aloha = Aloha.find(params[:id])

        if aloha.category == 'グルメ'
          redirect_url = '/alohas/food'
        elsif aloha.category == 'スポット'
          redirect_url = '/alohas/spot'
        elsif aloha.category =='お土産'
          redirect_url = '/alohas/omiyage'
        else
          redirect_url = '/alohas/leisure'
        end
        
        aloha.destroy
        redirect_to redirect_url

end

      def food
        @alohas = Aloha.all
        
      end

      def spot
        @alohas = Aloha.all
       
      
end

      def leisure
        @alohas = Aloha.all
 
end

      def omiyage
        @alohas = Aloha.all
      
end

      private
      def aloha_params
        params.require(:aloha).permit(:name, :time, :category, :about, :price, :link, :parking, :point, :photo, :image, :lat, :lng, :address, :phonenumber)
      end
    end