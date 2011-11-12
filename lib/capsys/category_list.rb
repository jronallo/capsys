module Capsys
  class CategoryList
    def self.map
      <<-MAP
      function(){
        this.categories.forEach(function(category){          
          emit(category, 1);
        });
      }
      MAP
    end
  
    def self.reduce 
      <<-REDUCE
      function(key, values) {       
        var count = 0;
        
        values.forEach(function(value) {
          count += value;
        }); 
        return count;
      }
      REDUCE
    end
  
    def self.build(opts)      
      Profile.collection.map_reduce(map, reduce, opts)
    end
    
    def self.category_list(opts={})
      hash = opts.merge({
       :out    => {:replace => 'categories'},       
       :query => {:categories => {:$exists => true}}
      })
      self.build(hash).find()
    end
    
  end
end