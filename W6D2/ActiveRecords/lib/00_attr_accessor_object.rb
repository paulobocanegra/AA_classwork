class AttrAccessorObject
  def self.my_attr_accessor(*attribute_names) #name ,#:breed
      attribute_names.each do |attribute_name|
        heredoc = <<-stuff
          def #{attribute_name}
            @#{attribute_name}
          end
          def #{attribute_name}=( new_value)
            @#{attribute_name} = new_value
          end
        stuff
          self.class_eval heredoc 
      end 
  end
end

