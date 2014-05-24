module YourfilesHelper
	def clear_url(str)
		str=str.to_s
		request.base_url.to_s+str[0,str.rindex("?")]
	end
end
