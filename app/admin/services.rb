ActiveAdmin.register Service, {:sort_order => 'name DESC'} do
  action_item :except => [:index, :destroy] do
    link_to 'New Message', new_admin_service_message_path(service)
  end
  
  action_item :except => [:index, :destroy] do
    link_to 'History', admin_service_message_path(service)
  end
  
  index do
    selectable_column
    column :name, :sortable => :name do |s|
      link_to s.name, admin_service_path(s)
    end
    column :url, :sortable => :url do |s|
      link_to s.url, s.url
    end
    column :status, :sortable => :status do |s|
      case s.status
      when 'up'
        content_tag(:span, 'Up', :class => 'status_tag green')
      when 'down'
        content_tag(:span, 'Down', :class => 'status_tag red')
      else
        content_tag(:span, s.status.titlecase, :class => 'status_tag orange')
      end
    end
    column '' do |resource|
      links = ''.html_safe
      links << link_to('History', admin_service_messages_path(resource), :class => "member_link history_link")
      if controller.action_methods.include?('show')
        links << link_to(I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link")
      end
      if controller.action_methods.include?('edit')
        links << link_to(I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link")
      end
      if controller.action_methods.include?('destroy')
        links << link_to(I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :data => {:confirm => I18n.t('active_admin.delete_confirmation')}, :class => "member_link delete_link")
      end
      links
    end
  end
  
  form do |f|
    f.inputs "Service Details" do
      f.input :name
      f.input :url
      f.input :status, :as => :radio, :collection => STATUS_OPTIONS
    end
    f.buttons
  end
  
  show do |service|
    attributes_table do
      row :status do
        case service.status
        when 'up'
          content_tag(:span, 'Up', :class => 'status_tag green')
        when 'down'
          content_tag(:span, 'Down', :class => 'status_tag red')
        else
          content_tag(:span, service.status.titlecase, :class => 'status_tag orange')
        end
      end
      row :url do
        link_to service.url, service.url, :target => '_blank'
      end
    end
    
    active_admin_comments
  end
end
