SimpleCov.start do
	add_filter 'spec'
	add_group "English" do |file|
		file.filename =~ %r{/en/}
	end
	add_group "Needing tests" do |file|
		file.covered_percent < 90
	end
end
