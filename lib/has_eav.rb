module ActiveRecord
  module ActsAs
    module HasEav
      def self.included(base)
        base.extend ActiveRecord::ActsAs::HasEav::ClassMethods
      end
      
      module ClassMethods
        def has_eav opts={}
          attrs = opts.delete :attributes
          attrs = attrs.to_s if attrs.is_a? Symbol
          attrs = attrs.camelize

          raise(
            "Eav Class cannot be nil. Specify a class using " +
            "has_eav :through => :class"
          ) if klass.blank?
          
          @eav_attribute_name = []
          @eav_attributes = 
          
          send :include, ActiveRecord::ActsAs::HasEav::InstanceMethods
        end
      end
      
      module InstanceMethods
        
        def method_missing symbol, args*, &block
          super
          
        rescue NoMethodError => e
          method_name = symbol.to_s
          attribute_name = method_name.gsub(/\=?$/)
        end
        
        def cache_eav_attributes
          
        end
        
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::ActsAs::HasEav)