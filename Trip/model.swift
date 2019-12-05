import SideMenu

struct Controllers {
    var name = ["Browser cars" , "Recent adds" ,"Add car" , "About us" , "Requests" , "Add friend" , "Agreements" , "Help" , "privacy policy" , "Terms & conditions" , "Settings" , "Contact us" , "Sign Out"]
    
    
    var controller = ["Home" , "Home" ,"AddCar" , "AboutUs" , "Requests" , "AddFriend" , "agreements" , "Help" , "agreements" , "agreements" , "Settings" , "ContactUs" , "SignOut"]
}

class Shared {
    static var user: Login?
    static var Image: String?
    
    static func settings(view: UIView) -> SideMenuSettings {
        let presentationStyle = SideMenuPresentationStyle.menuSlideIn
        presentationStyle.backgroundColor = .white
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = view.frame.width-view.frame.width*(1/5)
        return settings
    }
}
