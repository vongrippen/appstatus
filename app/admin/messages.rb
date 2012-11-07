ActiveAdmin.register Message do
  belongs_to :service
  form do |f|
    f.input :service_id, :as => :hidden
    f.inputs "Message Details" do
      f.input :short_message
      f.input :full_message
    end
    f.buttons
  end
end
