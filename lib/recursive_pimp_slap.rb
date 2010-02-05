module RecursivePimpSlap
	module HashExtensions
		def symbolize_keys
			inject({}) do |options, (key, value)|
				options.merge((key.respond_to?(:to_sym) && key.to_sym || key) => value)
			end
		end
		def recursive_symbolize_keys
			inject({}) do |result, (key, value)|
				result.merge((key.respond_to?(:to_sym) && key.to_sym || key) => (value.respond_to?(:recursive_symbolize_keys) && value.recursive_symbolize_keys || value))
			end
		end
	end
end

module RecursivePimpSlap
	module ArrayExtensions
		def recursive_symbolize_keys
			inject([]) do |result, value|
				result << (value.respond_to?(:recursive_symbolize_keys) && value.recursive_symbolize_keys || value)
			end
		end 
	end
end

Array.send :include, RecursivePimpSlap::ArrayExtensions
Hash.send  :include, RecursivePimpSlap::HashExtensions