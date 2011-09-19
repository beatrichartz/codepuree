module Mixins
  module Routes
    module CodepureeBeforeFilters
      def codepuree_before_filters
        before :exclude => %r{js|css|favicon} do
          @works = Work.all
          request.route.match(/\A\/([^\/]*)/)
          @action = $1.length > 0 ? $1 : 'home'
        end
      end
    end
  end
end