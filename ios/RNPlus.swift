import Foundation
import UIKit
import React

@objc(RNPlus)
public class RNPlus: NSObject {

    static var options: [AnyHashable : Any]? = [:];
    static var nav: UINavigationController? = nil;
    static var prefix: String = "modules";

    @objc
    static public func initWith(_ controller: UINavigationController, and lanuchOptions: [AnyHashable : Any]?) {
        options = lanuchOptions;
        nav = controller;
    }

    /**
     * module: entry file or bundle file
     * RN_Plus.navigate('intro', 'index')
     * modules/intro/index.js, options: {'pages': 'index'}
     * bundles/intro/index.ios.bundle, options: {'pages': 'index'}
     */
    @objc
    func navigate(_ module: String, to route: String){
        DispatchQueue.main.async {
            let url = URL(string: "http://localhost:8081/\(RNPlus.prefix)/\(module)/index.bundle?platform=ios")!;
            let rootView = RCTRootView.init(bundleURL: url,
                                            moduleName: module,
                                            initialProperties: ["route": route, "module": module],
                                            launchOptions: RNPlus.options);

            let page = UIViewController();
            page.view = rootView;

            RNPlus.nav?.pushViewController(page, animated: true);
        }
    }
}
