# the name of the project
workspace 'GreedCategory'

# let ExampleUnitTests use pods
#link_with 'Example', 'ExampleTests', 'ExampleUITests'

platform :ios, '6.0'

# the path of test project
project 'Example/Example'

def target_pods
# the path of .podspec
pod 'GreedCategory', :path => './'
end

target 'Example' do
    target_pods
end

target 'ExampleTests' do
    target_pods
end

target 'ExampleUITests' do
    target_pods
end
