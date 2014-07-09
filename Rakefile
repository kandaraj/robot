
namespace :spec do
	
  Rspec::Core::RakeTask(:unit) do |t|
  	t.pattern = Dir['spec/*/**/*_spec.rb'].reject{ |f| f['/integration'] }
  end

end