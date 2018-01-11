project 'ilegra-marvel.xcodeproj'

platform :ios, '11'
inhibit_all_warnings!
use_frameworks!

def shared_pods
    # Network
    pod 'Alamofire', '~> 4.5'
    pod 'SDWebImage'

    #Mapper
    pod 'ObjectMapper'
    pod 'AlamofireObjectMapper'
    
    #Crypt 
    pod 'CryptoSwift'
    pod 'Dollar'
end

target 'ilegra-marvel' do
    
    use_frameworks!
    # Shared pods
    shared_pods
    #plugin 'cocoapods-keys', {
    #   :project => "ilegra-marvel",
    #   :keys => [
    #   "MarvelApiKey",
    #   "MarvelPrivateKey"
    #]}
end
