import SideMenu

struct Controllers {
    var name = ["Browser cars" , "Recent adds" ,"Add car" , "About us" , "Requests" , "Add friend" , "Agreements" , "Help" , "privacy policy" , "Terms & conditions" , "Settings" , "Contact us" , "Sign Out"]
    
    
    var controller = ["Home" , "Home" ,"AddCar" , "AboutUs" , "Requests" , "AddFriend" , "agreements" , "Help" , "agreements" , "agreements" , "Settings" , "ContactUs" , "SignOut"]
    
  
}

class Shared {
    static var user: Login?
    static var Image: String?
     static let addressArray =  ["Riydha","Mecca","Dammam",
    "Medina","Jeddah","Ahsaa","Taif","Buraydah","Tabuk","Al-Khuttaif","Khamis Mushayt","Haql","Hafr Al-Batin","Jubail","Khobar","Abha","Najran","Yanbu","Kunfuza","Jizan","Al Kussem","Aseer"]
     static let colorArray = ["BROWN","BLUE","BLACK","GREEN","GRAY","ORANGE" ,"PINK", "PURPLE", "Red ","WHITE","Yellow"]
     static let modelArray = ["Toyota","Ford","Chevrolet","Nissan","Hyundai","Lexus","GMC","Trucks","Mercedes Benz","Honda","BMW","Spar Parts","Tanks","Kia","Dodge","Chrysler","Jeep","Mitsubishi","Mazda","Land Rover","Isuzu","Cadillac","Porsche","Audi","Suzuki","Infinity","Hammer","Lincoln","Volkswagen","Daihatsu","Jelly","Mercury","Volvo","Peugeot","Bentley","Jaguar","Subaru","MG","ZXO","Renault","Buick","Maserati","RollsRoyce","Lamborghini","Opel","Skoda","Ferrari","Citroen","Cherry","Seat","Daewoo","Saab","Fiat","Ssangyong","Aston Martin","Proton","Smashed Cars","Cars for Surrender","Traditional Cars"]
    
    
    static func settings(view: UIView) -> SideMenuSettings {
        let presentationStyle = SideMenuPresentationStyle.menuSlideIn
        presentationStyle.backgroundColor = .white
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = view.frame.width-view.frame.width*(1/5)
        return settings
    }
}
