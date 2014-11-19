module Datastreams
  
  module TransWalker 

    def from_mods(mods)
      @mods = mods
      if(self.class.name =~ /Instance/) then
        self.to_instance(@mods)
      elsif(self.class.name =~ /Work/) then
        self.to_work(@mods)
      else
        fail "Neither Work nor Instance"
      end
    end

    def to_work(mods)
      p = mods.person.first
      p = p.chomp ? p : p.strip
      name={authorized_personal_name: { full: p, scheme: 'KB' }}
      mads=Authority::Person.create(name)
      tit = {value: mods.title.first,
          subtitle: mods.subTitle.first,
              type: 'KB',
              lang: 'da'}
      self.add_title(tit)
      self.add_author(mads)
    end

    def to_instance(mods)

    end

    
  end
end
