unless Rails.env.development?
Dir[File.join(Rails.root, 'app', 'models', 'achievements', '**', '*.rb')].each { |model| require_dependency(model) }
end