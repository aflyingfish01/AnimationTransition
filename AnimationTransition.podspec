 Pod::Spec.new do |s|
      s.name         = "AnimationTransition"                #名称
      s.version      = "0.0.1"                #版本号
      s.summary      = "这是一个动画库"        #简短介绍
      s.description  = <<-DESC
                          私有Pods测试
                          * Markdown 格式
                       DESC
    
      s.homepage     = "https://github.com/hulailin/AnimationTransition"
      # s.screenshots  = "www.example.com/screenshots_1.gif"
      s.license      = { :type => "MIT", :file => "LICENSE" }                #开源协议
      s.author       = { "hulailin" => "hulailin@touker.com" }
    
      s.source       = { :git => "https://github.com/hulailin/AnimationTransition.git" , :tag => "#{s.version}"}
      ## 这里不支持ssh的地址，只支持HTTP和HTTPS，最好使用HTTPS
      ## 正常情况下我们会使用稳定的tag版本来访问，如果是在开发测试的时候，不需要发布release版本，直接指向git地址使用
      ## 待测试通过完成后我们再发布指定release版本，使用如下方式
      #s.source       = { :git => "https://github.com/hulailin/AnimationTransition.git", :tag => version }
    
      s.platform     = :ios, "7.0"            #支持的平台及版本
      s.requires_arc = true                    #是否使用ARC
    
      s.source_files  = "codeAnimation/*.{h,m}"    #OC可以使用类似这样"Classes/**/*.{h,m}"
      s.public_header_files = "codeAnimation/*.h"
      #s.frameworks = 'UIKit', 'QuartzCore', 'Foundation'    #所需的framework,多个用逗号隔开
      #s.module_name = 'animation'                #模块名称英文
    
      # s.dependency "JSONKit", "~> 1.4"    #依赖关系，该项目所依赖的其他库，如果有多个可以写多个 s.dependency
    
    end