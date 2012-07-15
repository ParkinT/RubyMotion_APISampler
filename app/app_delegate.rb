# This was adapted to RubyMotion from http://www.chupamobile.com/tutorial/details/65
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @mainViewController = MainViewController.alloc.init
    @navigationController = NavigationController.alloc.initWithRootViewController(@mainViewController)
    window.makeKeyAndVisible
    true
  end
  
  def window
    @window ||= begin
      w = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
      w.rootViewController = @navigationController
      w
    end
  end
  
end
