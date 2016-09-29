class Task < ActiveRecord::Base

  def next
     Task.where("id > ?", id).order("id ASC").first || Task.first
   end

   def previous
     Task.where("id < ?", id).order("id DESC").first || Task.last
   end

end
