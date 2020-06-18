ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :image, category_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :image
      f.input :categories, as: :check_boxes, collection: Category.order("title asc")
    end

    f.actions
  end

end
