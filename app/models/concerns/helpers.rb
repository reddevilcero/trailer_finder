class Helpers 

  def self.params_empty?(params)
    if !params.empty? 
      params.any? do |k,v|
        v.empty?
      end
    else
      params.empty?
    end
  end

  def self.is_logged_in?(session)
    !!session[:id]
  end

  def self.current_user(session)
    Worker.find_by_id(session[:id])
  end 

end