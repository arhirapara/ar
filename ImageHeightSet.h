#define NS_VIEW_FULL_SIZE                                       @"VIEW_FULL_SIZE"


- (void)setViewFullSize:(NSString *)viewSize
{
    [[NSUserDefaults standardUserDefaults] setObject:viewSize forKey:NS_VIEW_FULL_SIZE];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)getViewFullSize
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:NS_VIEW_FULL_SIZE];
}



CGRect viewSize = self.view.frame;
NSLog(@"%@", NSStringFromCGRect(viewSize));
[obj_SharedModel setViewFullSize:NSStringFromCGRect(viewSize)];


CGRect selfViewFrame = CGRectFromString([obj_SharedModel getViewFullSize]);
float bannerWidth = 1242;
float bannerHeight = 582;


//float bannerWidth = [[dictOfferData valueForKey:RES_companyBannerWidth] floatValue];
//float bannerHeight = [[dictOfferData valueForKey:RES_companyBannerHeight] floatValue];


if (bannerWidth == 0 || bannerHeight == 0) { constrintViewHeight.constant = (CGRectGetHeight(viewMainSegment.frame)); }
else {
    CGFloat heightImageView = (CGRectGetWidth(selfViewFrame) * bannerHeight) / bannerWidth;
    heightImageView = ceil(heightImageView);
    constrintViewHeight.constant = heightImageView;
}








typealias typeAliasDictionary               = [String: AnyObject]
typealias typeAliasStringDictionary         = [String: String]


let NS_APP_LANGUAGE                             = "NS_APP_LANGUAGE"


class func setLoginCredential(_ array: typeAliasStringDictionary) {
       UserDefaults.standard.set(array, forKey:NS_LOGIN_CREDENTIAL)
       UserDefaults.standard.synchronize()
   }
   
   class func getLoginCredential() -> typeAliasStringDictionary {
       return UserDefaults.standard.object(forKey: NS_LOGIN_CREDENTIAL) != nil ? UserDefaults.standard.object(forKey: NS_LOGIN_CREDENTIAL) as! typeAliasStringDictionary : typeAliasStringDictionary()
   }


//OR


class func setUserLanguage(_ dictData: typeAliasStringDictionary) {
    UserDefaults.standard.setValue(dictData, forKey:NS_APP_LANGUAGE)
    UserDefaults.standard.synchronize()
}

class func getUserLanguage() -> typeAliasStringDictionary {
    var dictLanguage = typeAliasStringDictionary()
    if let dict = UserDefaults.standard.object(forKey: NS_APP_LANGUAGE) { dictLanguage = dict as! typeAliasStringDictionary }
    return dictLanguage
}
