 

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func userSignOut(_ sender : AnyObject){
        if  Auth.auth().currentUser != nil{
            do{
            try Auth.auth().signOut()
                GIDSignIn.sharedInstance().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewID")
                print("logout success")
                self.present(vc , animated:  true , completion:  nil)
            } catch let error as NSError{
                print(error.localizedDescription)
            }
        }
    }

   

}
