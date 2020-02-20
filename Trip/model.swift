import SideMenu

struct Controllers {
    var name = ["Browser cars" , "Recent adds" ,"Add car" , "About us" , "Requests" , "Add friend" , "Agreements" , "Help" , "privacy policy" , "Terms & conditions" , "Settings" , "Contact us" , "Sign Out"]
    
    var nameAR = ["تصفح السيارات المعروضة" , "احدث الاعلانات" ,"اضافة سيارة" , "من نحن" , "الطلبات" , "دعوة صديق" , "الاتفاقية" , "المساعدة" , "سياسة الخصوصية" , "شروط الاستخدام" , "اعدادات التطبيق" , "اتصل بنا" , "تسجيل الخروج"]
    
    var controller = ["Home" , "Home" ,"AddCar" , "AboutUs" , "Requests" , "AddFriend" , "agreements" , "Help" , "agreements" , "agreements" , "Settings" , "ContactUs" , "SignOut"]
    
    
}

class Shared {
    static var user: Login?
    static var Image: String?
    static let timeFormate = "hh:mm:ss aa"
    static let dateFormate = "yyyy-MM-dd"
    static let Header: CGFloat = 16
    static let body:CGFloat = 14
    static let title:CGFloat = 20
    
    
    static let addressArray =  ["Riydha","Mecca","Dammam","Medina","Jeddah","Ahsaa","Taif","Buraydah","Tabuk","Al-Khuttaif","Khamis Mushayt","Haql","Hafr Al-Batin","Jubail","Khobar","Abha","Najran","Yanbu","Kunfuza","Jizan","Al Kussem","Aseer"]
    static let colorArray = ["Brown","blue","Black","Green","Gray","Orange" ,"Pink", "Purple", "Red ","White","Yellow"]
    
    static let modelArray = ["Toyota","Ford","Chevrolet","Nissan","Hyundai","Lexus","GMC","Trucks","Mercedes Benz","Honda","BMW","Spar Parts","Tanks","Kia","Dodge","Chrysler","Jeep","Mitsubishi","Mazda","Land Rover","Isuzu","Cadillac","Porsche","Audi","Suzuki","Infinity","Hammer","Lincoln","Volkswagen","Daihatsu","Jelly","Mercury","Volvo","Peugeot","Bentley","Jaguar","Subaru","MG","ZXO","Renault","Buick","Maserati","RollsRoyce","Lamborghini","Opel","Skoda","Ferrari","Citroen","Cherry","Seat","Daewoo","Saab","Fiat","Ssangyong","Aston Martin","Proton","Smashed Cars","Cars for Surrender","Traditional Cars"]
    
    
    static func settings(view: UIView) -> SideMenuSettings {
        let presentationStyle = SideMenuPresentationStyle.menuSlideIn
        presentationStyle.backgroundColor = .white
        
        var settings = SideMenuSettings()
        settings.statusBarEndAlpha = 0
        settings.presentationStyle = presentationStyle
        settings.allowPushOfSameClassTwice = false
        settings.menuWidth = view.frame.width-view.frame.width*(1/5)
        
    
        return settings
    }
    
   static func converDate(date: String) -> [String] {
        if let firstPracetIndex = date.firstIndex(of: "(") , let lastPracit = date.lastIndex(of: ")") {
            let startIndex = date.index(firstPracetIndex, offsetBy: 1)
            let finalDate = date[startIndex..<lastPracit]
            print(finalDate)
            guard let newDate = Int64(finalDate) else { return [""]}
            let date = Date(milliseconds: newDate)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.long //Set date style
            dateFormatter.dateFormat = "yyyy/MM/dd"
            dateFormatter.timeZone = .current
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = DateFormatter.Style.medium
            timeFormatter.dateFormat = "h:mm a"
            let localDate = dateFormatter.string(from: date)
            let localTime = timeFormatter.string(from: date)
            print(localDate)
            return [localDate , localTime]
        }
        return ["nil"]
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
