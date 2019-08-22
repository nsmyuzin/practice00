ActiveAdmin.register_page "Setting" do
  ##パンくず
  menu priority: 8
  breadcrumb do
    ['admin', 'Setting']
  end
  content do
    div class: 'basic' do
      div class: '' do
      end
      para "Hello World"
    end

    table do
      thead do
        tr do
          %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].each &method(:th)
        end
      end
      tbody do
        # ...
      end
    end
  end
  sidebar :side_menu do
    ul do
      li "Second List First Item"
      li "Second List Second Item"
    end
  end
end
