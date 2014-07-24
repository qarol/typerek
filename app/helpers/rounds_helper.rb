module RoundsHelper
  def paginate_rounds selected_round=nil
    capture_haml do
      haml_tag :div, :class => "text-center" do
        haml_tag :ul, :class => "pagination pagination-sm" do
          haml_tag :li, :class => "#{selected_round.nil? ? 'active' : ''}" do
            haml_tag :a, :href => matches_path do
              haml_concat "Wszystkie"
            end
          end
          Round.order(&:name).each do |round|
            haml_tag :li, :class => "#{selected_round == round ? 'active' : ''}" do
              haml_tag :a, :href => round_path(round) do
                haml_concat round.name + (selected_round == round ? " kolejka" : "")
              end
            end
          end
        end
      end
    end
  end
end
