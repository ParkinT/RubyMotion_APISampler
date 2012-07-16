#  The code in this file was adapted from "Accessing Built-In Applications" (http://www.chupamobile.com/tutorial/details/65) to RubyMotion
#  by Thom Parkin.  Please fork and pull this in order to improve it as a useful resource for the RubyMotion Community
class MainViewController < UIViewController

	CONTROLS_BUTTON_COLOR_BACKGROUND = UIColor.whiteColor
	CONTROLS_BUTTON_COLOR_TITLE = UIColor.darkTextColor

	BUTTON_COLUMNS = 2
	BUTTON_SPACING_Y = 12
	BUTTON_SPACING_X = 5
	BUTTON_WIDTH = 130
	BUTTON_HEIGHT = 25
	BUTTON_TOP = 15

	def viewDidLoad
		self.title = "iPhone Built-in Applicatons"
		self.view.backgroundColor = UIColor.whiteColor

		# Dynamically built a grid of buttons - if I did this correctly, you can simply modify the CONSTANTS (above) and it will auto-magically arrange the buttons
		xpos = (UIScreen.mainScreen.bounds.size.width - ((BUTTON_WIDTH * BUTTON_COLUMNS) + (BUTTON_SPACING_X * (BUTTON_COLUMNS-1)))) /2
		ypos = BUTTON_TOP

		email_btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    	email_btn.backgroundColor = CONTROLS_BUTTON_COLOR_BACKGROUND
    	email_btn.setTitle("E-Mail", forState:UIControlStateNormal)
    	email_btn.setTitleColor(CONTROLS_BUTTON_COLOR_TITLE, forState:UIControlStateNormal)
    	email_btn.layer.setBorderColor(UIColor.blackColor.CGColor)
   		email_btn.frame = [[xpos, ypos], [BUTTON_WIDTH, BUTTON_HEIGHT] ]
		self.view.addSubview(email_btn)

		sms_btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
		sms_btn.backgroundColor = CONTROLS_BUTTON_COLOR_BACKGROUND
		sms_btn.setTitle("SMS", forState:UIControlStateNormal)
		sms_btn.setTitleColor(CONTROLS_BUTTON_COLOR_TITLE, forState:UIControlStateNormal)
		sms_btn.layer.setBorderColor(UIColor.blackColor.CGColor)
		sms_btn.frame = [[xpos, ypos += (BUTTON_HEIGHT + BUTTON_SPACING_Y)], [BUTTON_WIDTH, BUTTON_HEIGHT]]
		self.view.addSubview(sms_btn)

		browser_btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
		browser_btn.backgroundColor = CONTROLS_BUTTON_COLOR_BACKGROUND
		browser_btn.setTitle("Browser", forState:UIControlStateNormal)
		browser_btn.setTitleColor(CONTROLS_BUTTON_COLOR_TITLE, forState:UIControlStateNormal)
		browser_btn.layer.setBorderColor(UIColor.blackColor.CGColor)
		browser_btn.frame = [[xpos, ypos += (BUTTON_HEIGHT + BUTTON_SPACING_Y)], [BUTTON_WIDTH, BUTTON_HEIGHT]]
		self.view.addSubview(browser_btn)

		phone_btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
		phone_btn.backgroundColor = CONTROLS_BUTTON_COLOR_BACKGROUND
		phone_btn.setTitle("Phone", forState:UIControlStateNormal)
		phone_btn.setTitleColor(CONTROLS_BUTTON_COLOR_TITLE, forState:UIControlStateNormal)
		phone_btn.layer.setBorderColor(UIColor.blackColor.CGColor)
		phone_btn.frame = [[xpos, ypos += (BUTTON_HEIGHT + BUTTON_SPACING_Y)], [BUTTON_WIDTH, BUTTON_HEIGHT]]
		self.view.addSubview(phone_btn)

		xpos += (BUTTON_WIDTH + BUTTON_SPACING_X)
		ypos = BUTTON_TOP

		camera_btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
		camera_btn.backgroundColor = CONTROLS_BUTTON_COLOR_BACKGROUND
		camera_btn.setTitle("Camera", forState:UIControlStateNormal)
		camera_btn.setTitleColor(CONTROLS_BUTTON_COLOR_TITLE, forState:UIControlStateNormal)
		camera_btn.layer.setBorderColor(UIColor.blackColor.CGColor)
		camera_btn.frame = [[xpos, ypos], [BUTTON_WIDTH, BUTTON_HEIGHT]]
		self.view.addSubview(camera_btn)

		library_btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
		library_btn.backgroundColor = CONTROLS_BUTTON_COLOR_BACKGROUND
		library_btn.setTitle("Library", forState:UIControlStateNormal)
		library_btn.setTitleColor(CONTROLS_BUTTON_COLOR_TITLE, forState:UIControlStateNormal)
		library_btn.layer.setBorderColor(UIColor.blackColor.CGColor)
		library_btn.frame = [[xpos, ypos += (BUTTON_HEIGHT + BUTTON_SPACING_Y)], [BUTTON_WIDTH, BUTTON_HEIGHT]]
		self.view.addSubview(library_btn)

		contacts_btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
		contacts_btn.backgroundColor = CONTROLS_BUTTON_COLOR_BACKGROUND
		contacts_btn.setTitle("Contacts", forState:UIControlStateNormal)
		contacts_btn.setTitleColor(CONTROLS_BUTTON_COLOR_TITLE, forState:UIControlStateNormal)
		contacts_btn.layer.setBorderColor(UIColor.blackColor.CGColor)
		contacts_btn.frame = [[xpos, ypos += (BUTTON_HEIGHT + BUTTON_SPACING_Y)], [BUTTON_WIDTH, BUTTON_HEIGHT]]
		self.view.addSubview(contacts_btn)

		add_contact_btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
		add_contact_btn.backgroundColor = CONTROLS_BUTTON_COLOR_BACKGROUND
		add_contact_btn.setTitle("Add A Contact", forState:UIControlStateNormal)
		add_contact_btn.setTitleColor(CONTROLS_BUTTON_COLOR_TITLE, forState:UIControlStateNormal)
		add_contact_btn.layer.setBorderColor(UIColor.blackColor.CGColor)
		add_contact_btn.frame = [[xpos, ypos += (BUTTON_HEIGHT + BUTTON_SPACING_Y)], [BUTTON_WIDTH, BUTTON_HEIGHT]]
		self.view.addSubview(add_contact_btn)

		# In an effort to be DRY we are reusing a single callback method for TouchUpInside
		email_btn.addTarget(self, action:'buttonTouch', forControlEvents:UIControlEventTouchUpInside)
		sms_btn.addTarget(self, action:'buttonTouch', forControlEvents:UIControlEventTouchUpInside)
		browser_btn.addTarget(self, action:'buttonTouch', forControlEvents:UIControlEventTouchUpInside)
		phone_btn.addTarget(self, action:'buttonTouch', forControlEvents:UIControlEventTouchUpInside)
		camera_btn.addTarget(self, action:'buttonTouch', forControlEvents:UIControlEventTouchUpInside)
		library_btn.addTarget(self, action:'buttonTouch', forControlEvents:UIControlEventTouchUpInside)
		contacts_btn.addTarget(self, action:'buttonTouch', forControlEvents:UIControlEventTouchUpInside)
		add_contact_btn.addTarget(self, action:'add_contact', forControlEvents:UIControlEventTouchUpInside)
	end

	def buttonTouch(*sender)
		case sender.titleForState(UIControlStateNormal).downcase
		when "e-mail"
			email
		when "sms"
			invoke_sms
		when "browser"
			invoke_browser
		when "phone"
			invoke_phone
		when "camera"
			invoke_camera
		when "library"
			photo_library
		when "contacts"
			contacts
		end
	end

	#  For simplicity - this is, after all a demo - I have used THIS (self) as the
	# delegate in all cases.  It would be more appropriate, in your application, to
	# build another class to handle callbacks.


  	# ==========  MFMailComposeView ===============================================
  	## The MFMailComposeViewController class provides a standard interface that manages
  	## the editing and sending of an email message. You can use this view controller to
  	## display a standard email view inside your application and populate the fields of
  	## that view with initial values, such as the subject, email recipients, body text,
  	## and attachments. The user can edit the initial contents you specify and choose
  	## to send the email or cancel the operation.
	def email
		MFMailComposeViewController.alloc.init.tap do |mail|
			mail.mailComposeDelegate = self
  			mail.toRecipients = ["the.world@gmail.com"]
  			mail.subject = "Email Subject"
			mail.ccRecipients = ["senate@whitehouse.gov", "friends@whitehouse.com"]
			mail.bccRecipients = ["congress@whitehouse.gov", "noname@aol.com"]
  			mail.setMessageBody("Email Body", isHTML:false)
  		
      		self.presentModalViewController(mail, animated:true)
    	end if MFMailComposeViewController.canSendMail
	end

	def mailComposeController(controller, didFinishWithResult:result, error:error)
		controller.dismissModalViewControllerAnimated(true)
	end
	# ==============================================================================

  	# ==========  MFMessageComposeView =============================================
  	## The MFMessageComposeViewController class provides a standard system user
  	## interface for composing SMS (Short Message Service) text messages. Use this
  	## class to configure the initial recipients and body of the message, as desired,
  	## and to configure a delegate object to respond to the final result of the user’s
  	## action—whether they chose to cancel or send the message. After configuring initial
 	## values, present the view controller modally using the presentModalViewController:animated:
  	## method. When done, dismiss it using the dismissModalViewControllerAnimated: method.
	def invoke_sms
		MFMessageComposeViewController.alloc.init.tap do |sms|
  			sms.messageComposeDelegate = self
			sms.recipients = ["2024561111", "012-4325-234"]
  			sms.body = "It's bad luck to be superstitious."
  			self.presentModalViewController(sms, animated:true)
    	end if MFMessageComposeViewController.canSendText
    	# will return an error on simulator (Application tried to push a nil view controller on target <MFMessageComposeViewController:) 
    	#if you have Messages beta on OS X Lion. installed
	end

	def messageComposeViewController(controller, didFinishWithResult:result)
		NSLog("SMS Result: #{result}")
		controller.dismissModalViewControllerAnimated(true)
	end
	# ==============================================================================

  # ==========  Local Web Browser ================================================
  ## This one is especially simple.  If you want to invoke the Safari web browser
  ## on the iPhone, you can also make use of a URL string and then use the openURL:
  ## method of the application instance
	def invoke_browser
		url = NSURL.alloc.initWithString("http://www.TheDailyWTF.com")
		if UIApplication.sharedApplication.canOpenURL(url)
			UIApplication.sharedApplication.openURL(url)
		end
	end
	# ==============================================================================

  # ==========  iPhone ===========================================================
  ## To make a phone call using the iPhone’s phone dialer, feed the openURL: method
  ## a phone number, prefixed by 'tel:'
	def invoke_phone
		url = NSURL.alloc.initWithString("tel:2024561111")
		if UIApplication.sharedApplication.canOpenURL(url)
			UIApplication.sharedApplication.openURL(url)
		end
	end
	# ==============================================================================

  # ==========  Photo Library ====================================================
  ## The UIImagePickerController class manages customizable, system-supplied user
  ## interfaces for taking pictures and movies on supported devices.  It also aids 
  ## choosing saved images and movies for use in your app.
  ## An image picker controller manages user interactions and delivers the results
  ## of those interactions to a delegate object.
	def photo_library
		pickController = UIImagePickerController.alloc.init
		pickController.delegate = self
		pickController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary
		self.presentModalViewController(pickController, animated:true)
	end
	# ==============================================================================

  # ==========  Camera ===========================================================
	def invoke_camera
		UIImagePickerController.alloc.init.tap do |picker|
  			picker.delegate = self
  			picker.sourceType = UIImagePickerControllerSourceTypeCamera
  			picker.allowsEditing = true
  			
  			self.presentModalViewController(picker, animated:true)
		end if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceTypeCamera)
	end
	# ==============================================================================

  # ==========  Contacts =========================================================
  ## ABPeoplePickerNavigationController class (whose instances are known as
  ## people-picker navigation controllers) implements a view controller that
	## manages a set of views that allow the user to select a contact or one of its
	## contact-information items from an address book.
	def contacts
		peoplePickController = ABPeoplePickerNavigationController.alloc.init
		props = [KABPersonFirstNameProperty, KABPersonLastNameProperty, KABPersonEmailProperty]
		peoplePickController.displayedProperties = props
		self.presentModalViewController(peoplePickController, animated:true)
	end
	def peoplePickerNavigationControllerDidCancel(peoplePickController)
		self.dismissModalViewControllerAnimated(true)
	end
	def peoplePickerNavigationController(peoplePicker, shouldContinueAfterSelectingPerson:person, property:property, identifier:identifier)
		peoplePicker.displayedProperties = [KABPersonPhoneProperty]
		peoplePicker.dismissModalViewControllerAnimated(true)
		return false
	end
	# ==============================================================================

  # ==========  Add Contact ======================================================
  ## The ABNewPersonViewController class (whose instances are known as new-person
  ## view controllers) implements the view controller used to create a contact. 
	def add_contact
		newPersonVC = ABNewPersonViewController.alloc.init
		newPersonVC.newPersonViewDelegate = self
		nc = UINavigationController.alloc.initWithRootViewController(newPersonVC)
		self.presentModalViewController(nc, animated:true)
	end
	def newPersonViewController(newPersonView, didCompleteWithNewPerson:person)
		self.dismissModalViewControllerAnimated(true)
	end
	# ==============================================================================

end